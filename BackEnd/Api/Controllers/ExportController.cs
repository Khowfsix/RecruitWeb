﻿using Common.ExportExcel;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Service.Interfaces;

namespace Api.Controllers
{
    [Authorize]
    public class ExportController : BaseAPIController
    {
        private readonly IReportService _reportService;
        private readonly IBlacklistService _blacklistService;
        private readonly ICertificateService _certificateService;
        private readonly ISkillService _skillService;
        private readonly UserManager<WebUser> _userManager;

        public ExportController(
            IReportService reportService,
            ICertificateService certificateService,
            IBlacklistService blacklistService,
            ISkillService skillService,
            UserManager<WebUser> userManager)
        {
            _reportService = reportService;
            _blacklistService = blacklistService;
            _certificateService = certificateService;
            _skillService = skillService;
            _userManager = userManager;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> ExportBlacklist()
        {
            var isAdmin = HttpContext.User.IsInRole("Admin");
            var data = await _blacklistService.GetAllBlackLists(isAdmin);

            string[] columns = { "BlacklistId", "CandidateId", "Reason", "DateTime", "Status", "IsDeleted" };
            byte[] filecontent = ExportExcelHelper.ExportExcel(data.ToList(), $"{nameof(BlackList)} Report", true, columns);
            var responseFile = File(filecontent, ExportExcelHelper.ExcelContentType, $"{nameof(BlackList)}_{DateTime.Today.ToString()}.xlsx");
            return responseFile;
         }

        [HttpPost("[action]")]
        public async Task<IActionResult> ExportCertificate()
        {
            var data = await _certificateService.GetAllCertificate(null);

            string[] columns = { "CertificateId", "CertificateName", "Description", "OrganizationName", "DateEarned", "ExpirationDate", "Link", "Cvid", "IsDeleted" };
            byte[] filecontent = ExportExcelHelper.ExportExcel(data.ToList(), $"{nameof(Certificate)} Report", true, columns);
            var responseFile = File(filecontent, ExportExcelHelper.ExcelContentType, $"{nameof(Certificate)}_{DateTime.Today.ToString()}.xlsx");

            return responseFile;
            }

        [HttpPost("[action]")]
        [AllowAnonymous]
        public async Task<IActionResult> ExportSkill()
        {
            var data = await _skillService.GetAllSkills(true, null);

            string[] columns = { "SkillId", "SkillName", "Description", "IsDeleted" };
            byte[] filecontent = ExportExcelHelper.ExportExcel(data.ToList(), $"{nameof(Skill)} Report", true, columns);
            var responseFile = File(filecontent, ExportExcelHelper.ExcelContentType, $"{nameof(Skill)}_{DateTime.Today}.xlsx");
            return responseFile;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> ExportApplicationReport(DateTime fromDate, DateTime toDate)
        {
            var data = await _reportService.ApplicationReport(fromDate, toDate);

            string[] columns = {
                "ApplicationId", "FullName", "DateOfBirth", "Address", "Experience",
                "CVName", "Introduction", "Education", "PositionName", "Description",
                "Salary", "CompanyName", "LanguageName", "DateTime", "CandidateStatus",
                "CompanyStatus", "Priority", "IsDeleted"
                               };
            byte[] filecontent = ExportExcelHelper.ExportExcel(data.ToList(), $"{nameof(Application)} Report", true, columns);
            var respFile = File(filecontent, ExportExcelHelper.ExcelContentType, $"{nameof(Application)}_{DateTime.Today.ToString()}.xlsx");
            return respFile;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> ExportInterviewReport(DateTime fromDate, DateTime toDate)
        {
            var data = await _reportService.InterviewReport(fromDate, toDate);

            string[] columns = { "InterviewId", "CandidateId", "InterviewerId", "ApplyDate", "Status", "Score" };
            byte[] filecontent = ExportExcelHelper.ExportExcel(data.ToList(), $"{nameof(Interview)} Report", true, columns);
            var respFile = File(filecontent, ExportExcelHelper.ExcelContentType, $"{nameof(Interview)}_{DateTime.Today.ToString()}.xlsx");
            return respFile;
        }        
    }
}