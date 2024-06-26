USE [master]
GO
/****** Object:  Database [RecruitmentWeb]    Script Date: 7/17/2023 7:28:41 AM ******/
CREATE DATABASE [RecruitmentWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecruitmentWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RecruitmentWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecruitmentWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RecruitmentWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RecruitmentWeb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecruitmentWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecruitmentWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecruitmentWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecruitmentWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RecruitmentWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecruitmentWeb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RecruitmentWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [RecruitmentWeb] SET  MULTI_USER 
GO
ALTER DATABASE [RecruitmentWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecruitmentWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecruitmentWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecruitmentWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecruitmentWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecruitmentWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RecruitmentWeb', N'ON'
GO
ALTER DATABASE [RecruitmentWeb] SET QUERY_STORE = ON
GO
ALTER DATABASE [RecruitmentWeb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RecruitmentWeb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/17/2023 7:28:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Cvid] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Company_Status] [nvarchar](255) NULL,
	[Priority] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
	[Candidate_Status] [nvarchar](255) NULL,
 CONSTRAINT [PK__Applicat__C93A4C99D502D0BD] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Address] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlackList]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackList](
	[BlackListId] [uniqueidentifier] NOT NULL,
	[CandidateId] [uniqueidentifier] NOT NULL,
	[Reason] [nvarchar](255) NULL,
	[DateTime] [datetime] NOT NULL,
	[Status] [int] NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__BlackLis__B54E3C741F66E917] PRIMARY KEY CLUSTERED 
(
	[BlackListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Experience] [nvarchar](max) NULL,
	[DefaultCvid] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Candidat__DF539B9C8196430E] PRIMARY KEY CLUSTERED 
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CandidateJoinEvent]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CandidateJoinEvent](
	[CandidateJoinEventId] [uniqueidentifier] NOT NULL,
	[CandidateId] [uniqueidentifier] NOT NULL,
	[EventId] [uniqueidentifier] NOT NULL,
	[DateJoin] [datetime] NOT NULL,
 CONSTRAINT [PK__Candidat__ECDC0AF2269C389E] PRIMARY KEY CLUSTERED 
(
	[CandidateJoinEventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryQuestion]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryQuestion](
	[CategoryQuestionId] [uniqueidentifier] NOT NULL,
	[CategoryQuestionName] [nvarchar](max) NULL,
	[Weight] [float] NOT NULL,
 CONSTRAINT [PK__Category__DE130A6A56DA0675] PRIMARY KEY CLUSTERED 
(
	[CategoryQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[CertificateId] [uniqueidentifier] NOT NULL,
	[CertificateName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[OrganizationName] [nvarchar](255) NULL,
	[DateEarned] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[Link] [nvarchar](max) NULL,
	[Cvid] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Certific__BBF8A7C122402FA9] PRIMARY KEY CLUSTERED 
(
	[CertificateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[Cvid] [uniqueidentifier] NOT NULL,
	[CandidateId] [uniqueidentifier] NOT NULL,
	[Experience] [nvarchar](max) NULL,
	[CvPdf] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__CV__A04CFFA37AEDF099] PRIMARY KEY CLUSTERED 
(
	[Cvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_has_Skills]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_has_Skills](
	[CV_SkillsId] [uniqueidentifier] NOT NULL,
	[Cvid] [uniqueidentifier] NOT NULL,
	[SkillId] [uniqueidentifier] NOT NULL,
	[ExperienceYear] [int] NULL,
 CONSTRAINT [PK__CV_has_S__21EE6FE772D382E5] PRIMARY KEY CLUSTERED 
(
	[CV_SkillsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [varchar](40) NULL,
	[Website] [nvarchar](255) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Departme__B2079BED26482F76] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [uniqueidentifier] NOT NULL,
	[EventName] [nvarchar](255) NOT NULL,
	[RecruiterId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Place] [nvarchar](max) NOT NULL,
	[DatetimeEvent] [datetime2](7) NULL,
	[MaxParticipants] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Event__7944C8101630C102] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interview]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interview](
	[InterviewId] [uniqueidentifier] NOT NULL,
	[InterviewerId] [uniqueidentifier] NOT NULL,
	[RecruiterId] [uniqueidentifier] NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[ITRSInterviewId] [uniqueidentifier] NULL,
	[Company_Status] [nvarchar](255) NULL,
	[Priority] [nvarchar](max) NULL,
	[ResultId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
	[Candidate_Status] [nvarchar](255) NULL,
 CONSTRAINT [PK__Intervie__C97C58525A846D87] PRIMARY KEY CLUSTERED 
(
	[InterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Interviewer]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Interviewer](
	[InterviewerId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Intervie__C29BDA1D949A214A] PRIMARY KEY CLUSTERED 
(
	[InterviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ITRSInterview]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ITRSInterview](
	[ITRSInterviewId] [uniqueidentifier] NOT NULL,
	[DateInterview] [date] NOT NULL,
	[ShiftId] [uniqueidentifier] NOT NULL,
	[RoomId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__ITRSInte__689D871CEED2E961] PRIMARY KEY CLUSTERED 
(
	[ITRSInterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [uniqueidentifier] NOT NULL,
	[LanguageName] [nvarchar](255) NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Language__B93855AB02B6E2A3] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionId] [uniqueidentifier] NOT NULL,
	[PositionName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[Salary] [decimal](18, 0) NULL,
	[MaxHiringQty] [int] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[LanguageId] [uniqueidentifier] NOT NULL,
	[RecruiterId] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Position__60BB9A79BADAC7AE] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [uniqueidentifier] NOT NULL,
	[QuestionString] [nvarchar](max) NOT NULL,
	[CategoryQuestionId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Question__0DC06FAC07D9C6DD] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionSkills]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionSkills](
	[QuestionSkillsId] [uniqueidentifier] NOT NULL,
	[QuestionId] [uniqueidentifier] NOT NULL,
	[SkillId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Question__3D7C86CBF36F4D5D] PRIMARY KEY CLUSTERED 
(
	[QuestionSkillsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[RecruiterId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Recruite__219CFF5625FB1B60] PRIMARY KEY CLUSTERED 
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [uniqueidentifier] NOT NULL,
	[ReportName] [nvarchar](max) NULL,
	[RecruiterId] [uniqueidentifier] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Report__D5BD48055F400A51] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Requirements]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requirements](
	[RequirementId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[SkillId] [uniqueidentifier] NOT NULL,
	[Experience] [nvarchar](max) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Requirem__7DF11E5D19F31719] PRIMARY KEY CLUSTERED 
(
	[RequirementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ResultId] [uniqueidentifier] NOT NULL,
	[ResultString] [nvarchar](255) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Result__976902081579C0D7] PRIMARY KEY CLUSTERED 
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [uniqueidentifier] NOT NULL,
	[RoomName] [nvarchar](255) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK__Room__3286393943AEBB6D] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Round]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Round](
	[RoundId] [uniqueidentifier] NOT NULL,
	[InterviewId] [uniqueidentifier] NOT NULL,
	[QuestionId] [uniqueidentifier] NOT NULL,
	[Score] [float] NULL,
 CONSTRAINT [PK__Round__94D84DFA949E251F] PRIMARY KEY CLUSTERED 
(
	[RoundId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityAnswer]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityAnswer](
	[SecurityAnswerId] [uniqueidentifier] NOT NULL,
	[SecurityQuestionId] [uniqueidentifier] NOT NULL,
	[WebUserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK__SecurityAnswer__C0A83881EF08EB13] PRIMARY KEY CLUSTERED 
(
	[SecurityAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecurityQuestion]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestion](
	[SecurityQuestionId] [uniqueidentifier] NOT NULL,
	[QuestionString] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__SecurityQuestion__C0A83881EF08EB13] PRIMARY KEY CLUSTERED 
(
	[SecurityQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shift](
	[ShiftId] [uniqueidentifier] NOT NULL,
	[ShiftTimeStart] [int] NOT NULL,
	[ShiftTimeEnd] [int] NOT NULL,
 CONSTRAINT [PK__Shift__C0A83881EF08EB13] PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillId] [uniqueidentifier] NOT NULL,
	[SkillName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Skill__DFA0918741CB17C8] PRIMARY KEY CLUSTERED 
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuccessfulCadidate]    Script Date: 7/17/2023 7:28:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuccessfulCadidate](
	[SuccessfulCadidateId] [uniqueidentifier] NOT NULL,
	[PositionId] [uniqueidentifier] NOT NULL,
	[CandidateId] [uniqueidentifier] NOT NULL,
	[DateSuccess] [datetime] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Successf__0743315651E595B0] PRIMARY KEY CLUSTERED 
(
	[SuccessfulCadidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Application_Cvid]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Application_Cvid] ON [dbo].[Application]
(
	[Cvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Application_PositionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Application_PositionId] ON [dbo].[Application]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlackList_CandidateId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_BlackList_CandidateId] ON [dbo].[BlackList]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Candidate_DefaultCvid]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Candidate_DefaultCvid] ON [dbo].[Candidate]
(
	[DefaultCvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Candidate_UserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Candidate_UserId] ON [dbo].[Candidate]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CandidateJoinEvent_EventId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_CandidateJoinEvent_EventId] ON [dbo].[CandidateJoinEvent]
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Candidat__0FAC84DD20A583A2]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Candidat__0FAC84DD20A583A2] ON [dbo].[CandidateJoinEvent]
(
	[CandidateId] ASC,
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Certificate_Cvid]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Certificate_Cvid] ON [dbo].[Certificate]
(
	[Cvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CV_CandidateId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_CV_CandidateId] ON [dbo].[CV]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CV_has_Skills_Cvid]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_CV_has_Skills_Cvid] ON [dbo].[CV_has_Skills]
(
	[Cvid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CV_has_Skills_SkillId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_CV_has_Skills_SkillId] ON [dbo].[CV_has_Skills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Event_RecruiterId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Event_RecruiterId] ON [dbo].[Event]
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_ApplicationId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_ApplicationId] ON [dbo].[Interview]
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_InterviewerId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_InterviewerId] ON [dbo].[Interview]
(
	[InterviewerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_ITRSInterviewId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_ITRSInterviewId] ON [dbo].[Interview]
(
	[ITRSInterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_RecruiterId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_RecruiterId] ON [dbo].[Interview]
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interview_ResultId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interview_ResultId] ON [dbo].[Interview]
(
	[ResultId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Interviewer_CompanyId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interviewer_CompanyId] ON [dbo].[Interviewer]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Interviewer_UserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Interviewer_UserId] ON [dbo].[Interviewer]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ITRSInterview_RoomId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_ITRSInterview_RoomId] ON [dbo].[ITRSInterview]
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ITRSInterview_ShiftId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_ITRSInterview_ShiftId] ON [dbo].[ITRSInterview]
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UNIQUE_InterviewTime]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UNIQUE_InterviewTime] ON [dbo].[ITRSInterview]
(
	[DateInterview] ASC,
	[ShiftId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Position_CompanyId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Position_CompanyId] ON [dbo].[Position]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Position_LanguageId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Position_LanguageId] ON [dbo].[Position]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Position_RecruiterId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Position_RecruiterId] ON [dbo].[Position]
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Question_CategoryQuestionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Question_CategoryQuestionId] ON [dbo].[Question]
(
	[CategoryQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_QuestionSkills_SkillId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_QuestionSkills_SkillId] ON [dbo].[QuestionSkills]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Question__603A66B596184E51]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Question__603A66B596184E51] ON [dbo].[QuestionSkills]
(
	[QuestionId] ASC,
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recruiter_CompanyId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Recruiter_CompanyId] ON [dbo].[Recruiter]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recruiter_UserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Recruiter_UserId] ON [dbo].[Recruiter]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Report_RecruiterId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Report_RecruiterId] ON [dbo].[Report]
(
	[RecruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requirements_PositionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Requirements_PositionId] ON [dbo].[Requirements]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Requirements_SkillId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Requirements_SkillId] ON [dbo].[Requirements]
(
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Room__6B500B55E5A0FA95]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__Room__6B500B55E5A0FA95] ON [dbo].[Room]
(
	[RoomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Round_InterviewId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Round_InterviewId] ON [dbo].[Round]
(
	[InterviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Round_QuestionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_Round_QuestionId] ON [dbo].[Round]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SecurityAnswer_SecurityQuestionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_SecurityAnswer_SecurityQuestionId] ON [dbo].[SecurityAnswer]
(
	[SecurityQuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SecurityAnswer_WebUserId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_SecurityAnswer_WebUserId] ON [dbo].[SecurityAnswer]
(
	[WebUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SuccessfulCadidate_CandidateId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_SuccessfulCadidate_CandidateId] ON [dbo].[SuccessfulCadidate]
(
	[CandidateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SuccessfulCadidate_PositionId]    Script Date: 7/17/2023 7:28:42 AM ******/
CREATE NONCLUSTERED INDEX [IX_SuccessfulCadidate_PositionId] ON [dbo].[SuccessfulCadidate]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application] ADD  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[BlackList] ADD  DEFAULT (getdate()) FOR [DateTime]
GO
ALTER TABLE [dbo].[CandidateJoinEvent] ADD  DEFAULT (getdate()) FOR [DateJoin]
GO
ALTER TABLE [dbo].[CV] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isDeleted]
GO
ALTER TABLE [dbo].[CV_has_Skills] ADD  DEFAULT ((0)) FOR [ExperienceYear]
GO
ALTER TABLE [dbo].[Skill] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isDeleted]
GO
ALTER TABLE [dbo].[SuccessfulCadidate] ADD  DEFAULT (getdate()) FOR [DateSuccess]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [Fk_appliCv] FOREIGN KEY([Cvid])
REFERENCES [dbo].[CV] ([Cvid])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [Fk_appliCv]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [Fk_appliPosition] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([PositionId])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [Fk_appliPosition]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BlackList]  WITH CHECK ADD  CONSTRAINT [FK_CandiInBlackList] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[BlackList] CHECK CONSTRAINT [FK_CandiInBlackList]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_CandidateUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_CandidateUser]
GO
ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD  CONSTRAINT [FK_defaultCV] FOREIGN KEY([DefaultCvid])
REFERENCES [dbo].[CV] ([Cvid])
GO
ALTER TABLE [dbo].[Candidate] CHECK CONSTRAINT [FK_defaultCV]
GO
ALTER TABLE [dbo].[CandidateJoinEvent]  WITH CHECK ADD  CONSTRAINT [FK_CandiJoin] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[CandidateJoinEvent] CHECK CONSTRAINT [FK_CandiJoin]
GO
ALTER TABLE [dbo].[CandidateJoinEvent]  WITH CHECK ADD  CONSTRAINT [FK_joinEvent] FOREIGN KEY([EventId])
REFERENCES [dbo].[Event] ([EventId])
GO
ALTER TABLE [dbo].[CandidateJoinEvent] CHECK CONSTRAINT [FK_joinEvent]
GO
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_CertificateInCV] FOREIGN KEY([Cvid])
REFERENCES [dbo].[CV] ([Cvid])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_CertificateInCV]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CreateCV] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CreateCV]
GO
ALTER TABLE [dbo].[CV_has_Skills]  WITH CHECK ADD  CONSTRAINT [FK_hasSkill] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skill] ([SkillId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CV_has_Skills] CHECK CONSTRAINT [FK_hasSkill]
GO
ALTER TABLE [dbo].[CV_has_Skills]  WITH CHECK ADD  CONSTRAINT [FK_ofCV] FOREIGN KEY([Cvid])
REFERENCES [dbo].[CV] ([Cvid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CV_has_Skills] CHECK CONSTRAINT [FK_ofCV]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_EventManagedBy] FOREIGN KEY([RecruiterId])
REFERENCES [dbo].[Recruiter] ([RecruiterId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_EventManagedBy]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_applicationInterview] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Application] ([ApplicationId])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_applicationInterview]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_IsConductes] FOREIGN KEY([InterviewerId])
REFERENCES [dbo].[Interviewer] ([InterviewerId])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_IsConductes]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_ITRS] FOREIGN KEY([ITRSInterviewId])
REFERENCES [dbo].[ITRSInterview] ([ITRSInterviewId])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_ITRS]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_ReccerCreateInterview] FOREIGN KEY([RecruiterId])
REFERENCES [dbo].[Recruiter] ([RecruiterId])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_ReccerCreateInterview]
GO
ALTER TABLE [dbo].[Interview]  WITH CHECK ADD  CONSTRAINT [FK_ResultInterview] FOREIGN KEY([ResultId])
REFERENCES [dbo].[Result] ([ResultId])
GO
ALTER TABLE [dbo].[Interview] CHECK CONSTRAINT [FK_ResultInterview]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [Fk_interDepart] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [Fk_interDepart]
GO
ALTER TABLE [dbo].[Interviewer]  WITH CHECK ADD  CONSTRAINT [Fk_InterviewerUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Interviewer] CHECK CONSTRAINT [Fk_InterviewerUser]
GO
ALTER TABLE [dbo].[ITRSInterview]  WITH CHECK ADD  CONSTRAINT [Fk_ITRS_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ITRSInterview] CHECK CONSTRAINT [Fk_ITRS_Room]
GO
ALTER TABLE [dbo].[ITRSInterview]  WITH CHECK ADD  CONSTRAINT [Fk_ITRS_Shift] FOREIGN KEY([ShiftId])
REFERENCES [dbo].[Shift] ([ShiftId])
GO
ALTER TABLE [dbo].[ITRSInterview] CHECK CONSTRAINT [Fk_ITRS_Shift]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Hires] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Hires]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [Fk_language] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([LanguageId])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [Fk_language]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_ManagedBy] FOREIGN KEY([RecruiterId])
REFERENCES [dbo].[Recruiter] ([RecruiterId])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_ManagedBy]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [Fk_catQues] FOREIGN KEY([CategoryQuestionId])
REFERENCES [dbo].[CategoryQuestion] ([CategoryQuestionId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [Fk_catQues]
GO
ALTER TABLE [dbo].[QuestionSkills]  WITH CHECK ADD  CONSTRAINT [Fk_QuesSkill] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skill] ([SkillId])
GO
ALTER TABLE [dbo].[QuestionSkills] CHECK CONSTRAINT [Fk_QuesSkill]
GO
ALTER TABLE [dbo].[QuestionSkills]  WITH CHECK ADD  CONSTRAINT [Fk_SkillQues] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[QuestionSkills] CHECK CONSTRAINT [Fk_SkillQues]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [Fk_reccerDepart] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [Fk_reccerDepart]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_ReccerUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_ReccerUser]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_ReccerCreateReport] FOREIGN KEY([RecruiterId])
REFERENCES [dbo].[Recruiter] ([RecruiterId])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_ReccerCreateReport]
GO
ALTER TABLE [dbo].[Requirements]  WITH CHECK ADD  CONSTRAINT [FK_requePos] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([PositionId])
GO
ALTER TABLE [dbo].[Requirements] CHECK CONSTRAINT [FK_requePos]
GO
ALTER TABLE [dbo].[Requirements]  WITH CHECK ADD  CONSTRAINT [FK_requeSkil] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skill] ([SkillId])
GO
ALTER TABLE [dbo].[Requirements] CHECK CONSTRAINT [FK_requeSkil]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [Fk_RoundInterview] FOREIGN KEY([InterviewId])
REFERENCES [dbo].[Interview] ([InterviewId])
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [Fk_RoundInterview]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [Fk_RoundQuestion] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [Fk_RoundQuestion]
GO
ALTER TABLE [dbo].[SecurityAnswer]  WITH CHECK ADD  CONSTRAINT [FK_AnswerForQues] FOREIGN KEY([SecurityQuestionId])
REFERENCES [dbo].[SecurityQuestion] ([SecurityQuestionId])
GO
ALTER TABLE [dbo].[SecurityAnswer] CHECK CONSTRAINT [FK_AnswerForQues]
GO
ALTER TABLE [dbo].[SecurityAnswer]  WITH CHECK ADD  CONSTRAINT [FK_AnswerForUser] FOREIGN KEY([WebUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[SecurityAnswer] CHECK CONSTRAINT [FK_AnswerForUser]
GO
ALTER TABLE [dbo].[SuccessfulCadidate]  WITH CHECK ADD  CONSTRAINT [FK_SuccessfulCandi] FOREIGN KEY([CandidateId])
REFERENCES [dbo].[Candidate] ([CandidateId])
GO
ALTER TABLE [dbo].[SuccessfulCadidate] CHECK CONSTRAINT [FK_SuccessfulCandi]
GO
ALTER TABLE [dbo].[SuccessfulCadidate]  WITH CHECK ADD  CONSTRAINT [FK_SuccessfulPosition] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([PositionId])
GO
ALTER TABLE [dbo].[SuccessfulCadidate] CHECK CONSTRAINT [FK_SuccessfulPosition]
GO
USE [master]
GO
ALTER DATABASE [RecruitmentWeb] SET  READ_WRITE 
GO
