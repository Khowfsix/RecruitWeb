using Api.ViewModels.Cv;
using AutoMapper;
using Castle.Core.Internal;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Service.Interfaces;
using Service.Models;

namespace Api.Controllers
{
    [Authorize]
    public class CvController : BaseAPIController
    {
        private readonly ICvService _cvService;
        private readonly UserManager<WebUser> _userManager;
        private readonly IApplicationSuggestionService _applicationSuggestionService;
        private readonly IFileService _fileService;
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IMapper _mapper;

        public CvController(ICvService cvService,
            UserManager<WebUser> userManager,
            IApplicationSuggestionService applicationSuggestionService,
            IFileService uploadFileService,
            IHttpClientFactory httpClientFactory,
            IMapper mapper)
        {
            _cvService = cvService;
            _userManager = userManager;
            _applicationSuggestionService = applicationSuggestionService;
            _fileService = uploadFileService;
            _httpClientFactory = httpClientFactory;

            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllCv(string? request)
        {
            var cvList = await _cvService.GetAllCv(request);
            if (cvList.IsNullOrEmpty())
            {
                return NotFound();
            }
            var response = _mapper.Map<List<CvViewModel>>(cvList);
            return Ok(response);
        }

        [HttpGet("[action]/{candidateId}")]
        public async Task<IActionResult> GetCvDefault(Guid candidateId)
        {
            var cvDefault = await _cvService.GetCvDefault(candidateId);
            if (cvDefault is null)
            {
                return NotFound();
            }
            var response = _mapper.Map<CvViewModel>(cvDefault);
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> SaveCv([FromBody] CvAddModel request)
        {
            if (request == null)
                return BadRequest();

            if (ModelState.IsValid)
            {
                var modelData = _mapper.Map<CvModel>(request);
                var cvList = await _cvService.SaveCv(modelData);
                return Ok(cvList);
            }

            ModelState.AddModelError("", "Could not create new CV!");
            return BadRequest();
        }

        //[HttpPost("[action]/{Cvid:guid}")]
        //public async Task<IActionResult> UploadCvPdf([FromForm] UploadFileFromForm request, Guid Cvid)
        //{
        //    //var fileExtension = Path.GetExtension(request.CvPDF.FileName);
        //    //// Các đuôi file cho phép
        //    //var allowedExtensions = new[] { ".pdf" };
        //    //if (!allowedExtensions.Contains(fileExtension.ToLower()))
        //    //{
        //    //    // Xử lý khi tệp tải lên không phải là pdf
        //    //    ModelState.AddModelError("", "Uploaded file is not pdf!");
        //    //    return BadRequest();
        //    //}

        //    var resp = await _cvService.UploadCvPdf(request.File, Cvid);

        //    if (resp is false)
        //        return BadRequest(resp);

        //    return Ok(resp);
        //}

        [HttpPut("{requestId:guid}")]
        public async Task<IActionResult> UpdateCv([FromBody] CvUpdateModel request, Guid requestId)
        {
            if (ModelState.IsValid)
            {
                var modelData = _mapper.Map<CvModel>(request);
                var cvList = await _cvService.UpdateCv(modelData, requestId);
                if (!cvList)
                {
                    return NotFound();
                }
                return Ok(cvList);
            }
            ModelState.AddModelError("", "Could not Update CV!");
            return NotFound(request);
        }

        [HttpDelete("{requestId:guid}")]
        public async Task<IActionResult> DeleteCv(Guid requestId)
        {
            // lưu link file cv vào 1 biến
            // xóa data cv đó trong db
            // gọi service xóa file
            if (ModelState.IsValid)
            {
                var resp = await _cvService.DeleteCv(requestId);
                if (resp == false)
                {
                    return NotFound();
                }
                return Ok(resp);
            }
            ModelState.AddModelError("", "Could not Delete CV!"); ;
            return NotFound();
        }

        [HttpGet("[action]/{candidateId:guid}")]
        public async Task<IActionResult> GetCandidateCvs(Guid candidateId)
        {
            var cvList = await _cvService.GetCvsOfCandidate(candidateId);
            if (cvList == null)
            {
                return NotFound();
            }
            return Ok(cvList);
        }

        [HttpGet("[action]/{Cvid:guid}")]
        public async Task<IActionResult> GetCv(Guid Cvid)
        {
            var cv = await _cvService.GetCvById(Cvid);
            if (cv == null)
            {
                return NotFound();
            }
            return Ok(cv);
        }

        [HttpGet("{positionId:guid}")]
        public async Task<IActionResult> GetCvSuggestions(Guid positionId)
        {
            var response = await _applicationSuggestionService.GetSuggestion(positionId);
            return Ok(response);
        }

        //[HttpGet("UserCv")]
        //public async Task<IActionResult> GetUserCv()
        //{
        //    //string role = "Candidate";
        //    //var curUser = await GetIdCurrent();
        //    var name = HttpContext.User.Identity!.Name;
        //    var id = (await _userManager.FindByNameAsync(name)).Id;
        //    if (HttpContext.User.IsInRole("Candidate"))
        //    {
        //        var response = await _cvService.GetAllUserCv(id);
        //        if (response == null)
        //        {
        //            return BadRequest("Cv has not been created");
        //        }
        //        return Ok(response);
        //    }
        //    return BadRequest();
        //}

        //[HttpDelete("DeleteFile")]
        //public async Task<IActionResult> DeleteFile(string path)
        //{
        //    var data = await _fileService.DeleteFileAsync(path);
        //    return Ok(data);
        //}

        //[HttpGet("download")]
        //public async Task<IActionResult> DownloadImageFromCloudinary(string imageUrl)
        //{
        //    if (string.IsNullOrEmpty(imageUrl))
        //    {
        //        return BadRequest("Image URL is required.");
        //    }

        //    using var httpClient = _httpClientFactory.CreateClient();
        //    try
        //    {
        //        // Gửi yêu cầu GET để download tấm hình từ Cloudinary
        //        var response = await httpClient.GetAsync(imageUrl);

        //        // Kiểm tra xem yêu cầu có thành công không
        //        if (response.IsSuccessStatusCode)
        //        {
        //            // Lấy nội dung của tấm hình từ response
        //            var imageStream = await response.Content.ReadAsStreamAsync();

        //            // Chuyển Stream thành mảng byte
        //            using var memoryStream = new MemoryStream();
        //            await imageStream.CopyToAsync(memoryStream);
        //            var imageBytes = memoryStream.ToArray();

        //            // Trả về FileContentResult để download tấm hình
        //            return new FileContentResult(imageBytes, "image/jpeg")
        //            {
        //                FileDownloadName = "downloaded_image.jpg"
        //            };
        //        }
        //        else
        //        {
        //            // Xử lý lỗi nếu yêu cầu không thành công
        //            return BadRequest("Error while downloading image from Cloudinary.");
        //        }
        //    }
        //    catch (HttpRequestException)
        //    {
        //        // Xử lý lỗi nếu URL không hợp lệ hoặc không thể kết nối đến Cloudinary
        //        return BadRequest("Invalid image URL or failed to connect to Cloudinary.");
        //    }
        //}
    }
}