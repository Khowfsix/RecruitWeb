﻿using Api.ViewModels.Report;
using AutoMapper;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Service.Interfaces;

namespace Api.Controllers
{
    [Authorize(Roles = "Recruiter,Interviewer,Admin")]
    public class ReportController : BaseAPIController
    {
        private readonly IReportService _reportService;
        private readonly ICandidateService _candidateService;
        private readonly IInterviewerService _interviewerService;
        private readonly UserManager<WebUser> _userManager;
        private readonly IMapper _mapper;

        public ReportController(
            IReportService reportService,
            ICandidateService candidateService,
            IInterviewerService interviewerService,
            UserManager<WebUser> userManager,
            IMapper mapper)
        {
            _reportService = reportService;
            _candidateService = candidateService;
            _interviewerService = interviewerService;
            _userManager = userManager;
            _mapper = mapper;
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> InterviewReport(DateTime fromDate, DateTime toDate)
        {
            var reportList = await _reportService.InterviewReport(fromDate, toDate);

            foreach (var row in reportList)
            {
                var candidateId = row.CandidateId;
                var interviewerId = row.InterviewerId;

                var isAdmin = HttpContext.User.IsInRole("Admin");
                var candidate = await _candidateService.FindById(candidateId, isAdmin);

                var interviewer = await _interviewerService.GetInterviewerById(interviewerId);

                if (candidate != null)
                {
                    var candidateProfile = await _userManager.FindByIdAsync(candidate.UserId);

                    if (candidateProfile == null)
                    {
                        return NotFound("User Not Found");
                    }

                    row.CandidateName = candidateProfile.FullName ?? "";
                }

                if (interviewer != null)
                {
                    var interviewerProfile = await _userManager.FindByIdAsync(interviewer.UserId);

                    if (interviewerProfile == null)
                    {
                        return NotFound("User Not Found");
                    }

                    row.InterviewerName = interviewerProfile.FullName ?? "";
                }
            }

            List<InterviewReportViewModel> viewModels = new List<InterviewReportViewModel>();
            foreach (var report in reportList)
            {
                viewModels.Add(_mapper.Map<InterviewReportViewModel>(report));
            }

            return Ok(viewModels);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> ApplicationReport(DateTime fromDate, DateTime toDate)
        {
            var reportList = await _reportService.ApplicationReport(fromDate, toDate);
            List<InterviewReportViewModel> viewModels = new List<InterviewReportViewModel>();
            foreach (var report in reportList)
            {
                viewModels.Add(_mapper.Map<InterviewReportViewModel>(report));
            }
            return Ok(viewModels);
        }
    }
}