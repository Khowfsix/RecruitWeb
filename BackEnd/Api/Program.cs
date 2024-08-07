﻿using Common.TrapException;
using Data;
using Data.Entities;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using Serilog;
using Serilog.Events;
using Service;
using Service.Models;
using Service.Services;
using System.Text;
using System.Text.Json.Serialization;

Log.Logger = new LoggerConfiguration().MinimumLevel
    .Override("Microsoft", LogEventLevel.Information)
    .MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Warning)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .CreateBootstrapLogger();

try
{
    var corsPolicyName = "ApiCorsPolicy";
    Log.Information("Starting web application");
    var builder = WebApplication.CreateBuilder(args);
    {
        builder.Services.AddRepository().AddServices();
        builder.Services.Configure<CloudinarySettings>(
            builder.Configuration.GetSection("CloudinarySettings")
        );
    }

    builder.Services.AddControllers()
    .AddNewtonsoftJson(options =>
    {
        options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
    });

    builder.Services.AddCors(options =>
    {
        options.AddPolicy(
            name: corsPolicyName,
            policy =>
            {
                // FIXME: This is not secure, please specify the origins instead of allowing any origin
                policy
                    .SetIsOriginAllowed(origin => true)
                    .AllowAnyHeader()
                    .AllowAnyMethod()
                    .AllowCredentials()
                    .WithExposedHeaders("Content-Disposition");
                //.AllowAnyOrigin();
            }
        );
    });
    // Use Serilog
    builder.Host.UseSerilog(
        (context, services, configuration) =>
            configuration.ReadFrom
                .Configuration(context.Configuration)
                .ReadFrom.Services(services)
                .Enrich.FromLogContext()
                .WriteTo.Console()
    );

    // Add services to the container.
    builder.Services
        .AddControllers(options =>
        {
            options.Filters.Add<HttpResponseExceptionFilter>();
        })
        .AddJsonOptions(options =>
        {
            options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles;
            options.JsonSerializerOptions.MaxDepth = 10;
        });

    // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen(option =>
    {
        option.SwaggerDoc("v1", new OpenApiInfo { Title = "Jasmine Recruitment Web API", Version = "v1" });
        //option.MapType<List<IFormFile>>(() => new OpenApiSchema { Type = "array", Items = new OpenApiSchema { Type = "file", Format = "binary" } });
        option.AddSecurityDefinition(
            "Bearer",
            new OpenApiSecurityScheme
            {
                In = ParameterLocation.Header,
                Description = "Please enter a valid token",
                Name = "Authorization",
                Type = SecuritySchemeType.Http,
                BearerFormat = "JWT",
                Scheme = "Bearer"
            }
        );
        option.AddSecurityRequirement(
            new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                            //In = ParameterLocation.Header,
                            //Description = "Please enter a valid token",
                            //Name = "Authorization",
                            //Type = SecuritySchemeType.Http,
                            //BearerFormat = "JWT",
                            //Scheme = "Bearer"
                        }
                    },
                    Array.Empty<string>()
                },
            }
        );
    });
    builder.Services.AddDbContext<RecruitmentWebContext>(options =>
    {
        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
    });

    builder.Services
        .AddIdentity<WebUser, IdentityRole>()
        .AddEntityFrameworkStores<RecruitmentWebContext>()
        .AddDefaultTokenProviders();

    builder.Services.AddHttpContextAccessor();

    builder.Services
        .AddAuthentication(options =>
        {
            options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
        })
        .AddJwtBearer(options =>
        {
            options.SaveToken = true;
            options.RequireHttpsMetadata = false;
            options.TokenValidationParameters = new TokenValidationParameters()
            {
                ValidateIssuer = false,
                ValidateAudience = true,
                ValidateLifetime = true,
                ValidAudience = builder.Configuration["JWT:ValidAudience"],
                ValidIssuer = builder.Configuration["JWT:ValidIssuer"],
                IssuerSigningKey = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(builder.Configuration["JWT:Secret"])
                )
            };

            //options.Events = new JwtBearerEvents
            //{
            //    OnTokenValidated = context =>
            //    {
            //        // Tùy chỉnh xử lý sau khi token được xác thực thành công
            //        // ở đây, bạn có thể đọc thông tin từ token và cấu hình tên thuộc tính
            //        var claims = context.Principal!.Claims.ToList();

            //        // Tìm và đổi tên thuộc tính nếu cần
            //        var roleClaim = claims.FirstOrDefault(c => c.Type == ClaimTypes.Role);
            //        if (roleClaim != null)
            //        {
            //            var newRoleClaim = new Claim("role", roleClaim.Value);
            //            claims.Remove(roleClaim);
            //            claims.Add(newRoleClaim);
            //            var newIdentity = new ClaimsIdentity(claims, context.Principal.Identity!.AuthenticationType, context.Principal.Identity.Name, ClaimTypes.Role);
            //            context.Principal = new ClaimsPrincipal(newIdentity);
            //        }

            //        return Task.CompletedTask;
            //    }
            //};
        });

    //Add Config for Required Email
    builder.Services.Configure<IdentityOptions>(opts => opts.SignIn.RequireConfirmedEmail = true);
    builder.Services.Configure<DataProtectionTokenProviderOptions>(option => option.TokenLifespan = TimeSpan.FromHours(3));

    // Add auto mapper
    //builder.Services.AddAutoMapper(typeof(Program));
    builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

    //Add Email Configs
    var emailConfig = builder.Configuration
     .GetSection("EmailConfiguration")
    .Get<EmailConfiguration>();
    builder.Services.AddSingleton(emailConfig!);
    builder.Services.AddScoped<IEmailService, EmailService>();

    builder.Services.AddHttpClient();
    builder.Services.AddHttpContextAccessor();

    var app = builder.Build();
    /***
    WARNING: Please notice the middleware order
    See: https://learn.microsoft.com/en-us/aspnet/core/fundamentals/middleware/?view=aspnetcore-7.0#middleware-order
    ***/
    // Configure HTTP logging (only for development environment)
    if (app.Environment.IsDevelopment())
    {
        app.UseSerilogRequestLogging(options =>
        {
            options.GetLevel = (context, elapsed, exception) => LogEventLevel.Information;
        });
        app.UseExceptionHandler("/error-development");
    }
    else
    {
        app.UseExceptionHandler("/error");
    }

    // Configure the HTTP request pipeline.
    app.UseSwagger();
    app.UseSwaggerUI();

    // Remove this middleware if you use reverse proxy
    app.UseHttpsRedirection();

    // Configure CORS
    app.UseCors(corsPolicyName);
    app.UseAuthentication();
    app.UseAuthorization();

    app.MapControllers();
    app.Run();
}
catch (Exception ex)
{
    Log.Fatal(ex, "Application terminated unexpectedly");
}
finally
{
    Log.CloseAndFlush();
}