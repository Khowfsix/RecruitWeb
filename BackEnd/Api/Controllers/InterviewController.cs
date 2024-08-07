using Api.ViewModels.Interview;
using AutoMapper;
using Data.CustomModel.Interviewer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interfaces;
using Service.Models;

namespace Api.Controllers;

[Authorize]
public class InterviewController : BaseAPIController
{
    private readonly IInterviewService _interviewService;

    //private readonly IRoundService _roundService;

    private readonly IMapper _mapper;

    #region comment

    //public InterviewController(IInterviewService interviewService,
    //    IItrsinterviewService itrsinterviewService,
    //    IRoundService roundService)
    //{
    //    _interviewService = interviewService;
    //    _itrsinterviewService = itrsinterviewService;
    //    _roundService = roundService;
    //}

    /// <summary>
    /// For unit testing
    /// </summary>
    /// <param name="interviewService"></param>
    /// <param name="itrsinterviewService"></param>
    ///

    #endregion comment

    public InterviewController(
        IInterviewService interviewService,
        IMapper mapper)
    {
        _interviewService = interviewService;
        //_roundService 
        _mapper = mapper;
    }

    [HttpGet]
    public async Task<IActionResult> GetAllInterview(Guid? id, int? status)
    {
        // Get by id
        if (id != null)
        {
            var data = await _interviewService.GetInterviewById((Guid)id);
            var response = _mapper.Map<InterviewViewModel>(data);
            return response switch
            {
                null => Ok("Not found"),
                _ => Ok(response)
            };
        }

        // Get by Interviewer
        //var interviewByStatus = await _interviewService.GetAllInterviewByStatus(status);
        //if (interviewByStatus == null)
        //{
        //    return Ok();
        //}
        //return Ok(interviewByStatus);

        var reportList = await _interviewService.GetAllInterview(status);
        if (reportList == null)
        {
            return Ok();
        }
        var responseList = _mapper.Map<List<InterviewViewModel>>(reportList);
        return Ok(responseList);
    }

    [HttpGet("[action]/{requestId}")]
    public async Task<IActionResult> GetInterviewsByInterviewer(Guid requestId)
    {
        //try
        //{
        var dataList = await _interviewService.GetInterviewsByInterviewer(requestId);
        if (dataList == null)
        {
            return Ok();
        }
        return Ok(_mapper.Map<List<InterviewViewModel>>(dataList.ToList()));
        //}
        //catch (Exception)
        //{
        //    return BadRequest();
        //}
    }

    [HttpGet("[action]/{requestId}")]
    public async Task<IActionResult> GetInterviewsByPositon(Guid requestId)
    {
        try
        {
            var dataList = await _interviewService.GetInterviewsByPositon(requestId);
            if (dataList == null)
            {
                return Ok();
            }
            return Ok(dataList);
        }
        catch (Exception)
        {
            return BadRequest();
        }
    }

    [HttpGet("[action]/{companyId}")]
    public async Task<IActionResult> GetInterviewsByCompany(Guid companyId, [FromQuery] InterviewFilterModel interviewFilterModel, string? sortString = "MeetingDate_DESC")
    {
        var filter = _mapper.Map<InterviewFilter>(interviewFilterModel);
        var models = await _interviewService.GetInterviewsByCompanyId(companyId, filter, sortString);

        if (models == null)
        {
            return Ok();
        }
        return Ok(_mapper.Map<List<InterviewViewModel>>(models));
    }

    [HttpPost]
    [Authorize(Roles = "Recruiter")]
    public async Task<IActionResult> SaveInterview(InterviewAddModel interviewAddModel)
    {
        if (interviewAddModel == null)
        {
            return BadRequest();
        }

        var interviewModelData = _mapper.Map<InterviewModel>(interviewAddModel);
        var responseInterview = await _interviewService.SaveInterview(interviewModelData);

        if (responseInterview != null)
        {
            return Ok(responseInterview);
        }
        return StatusCode(StatusCodes.Status409Conflict);
    }

    [HttpPost("[action]/{id:guid}")]
    public async Task<IActionResult> PostQuestionInterviewResult(InterviewResultQuestion_ViewModel request)
    {
        var modelData = _mapper.Map<InterviewResultQuestion_Model>(request);
        var postQuestionIntoInterview = await _interviewService.PostQuestionIntoInterview(modelData);

        if (postQuestionIntoInterview == null)
        {
            return BadRequest(request);
        }
        else
        {
            return Ok(postQuestionIntoInterview);
        }
    }

    [HttpPut("{interviewId:guid}")]
    [Authorize(Roles = "Recruiter")]
    public async Task<IActionResult> UpdateInterview([FromBody] InterviewUpdateModel request, Guid interviewId)
    {
        if (request == null)
        {
            return BadRequest();
        }


        //var responseITRS = await _itrsinterviewService.SaveItrsinterview(request.Itrsinterview!, request.InterviewerId);
        //if (responseITRS == null)
        //{
        //    return StatusCode(StatusCodes.Status409Conflict);
        //}

        //request.InterviewId = interviewId;
        //request.ItrsinterviewId = responseITRS.ItrsinterviewId;

        var modelData = _mapper.Map<InterviewModel>(request);
        var responseInterview = await _interviewService.UpdateInterview(modelData, interviewId);

        //if (responseInterview == false)
        //{
        //    var rollback = await _itrsinterviewService.DeleteItrsinterview(responseITRS!.ItrsinterviewId);
        //    return StatusCode(StatusCodes.Status409Conflict);
        //}

        //var oldITRS = (Guid)request.ItrsinterviewId!;
        //var delITRS = await _itrsinterviewService.DeleteItrsinterview(oldITRS);
        if (responseInterview == true)
            return Ok(request);
        return Ok();
    }

    [HttpPut("[action]/{interviewId:guid}")]
    [Authorize(Roles = "Recruiter, Interviewer")]
    public async Task<IActionResult> UpdateStatusInterview(
        Guid interviewId,
        int? Candidate_Status,
        int? Company_Status
    )
    {
        if (Candidate_Status == null && Company_Status == null)
            return StatusCode(StatusCodes.Status400BadRequest);

        var interviewNewStatus = await _interviewService.GetInterviewById(interviewId);

        if (interviewNewStatus == null)
        {
            return BadRequest();
        }

        var response = await _interviewService.UpdateStatusInterview(interviewId, Candidate_Status, Company_Status);
        return Ok(response);
    }

    [HttpPut("[action]/{interviewId:guid}")]
    [Authorize(Roles = "Recruiter, Interviewer")]
    public async Task<IActionResult> UpdateAddressOrMeetingURL(
        Guid interviewId,
        string? address
    )
    {
        if (address is null)
        {
            Ok(false);
        }

        var interviewNewStatus = await _interviewService.GetInterviewById(interviewId);

        if (interviewNewStatus == null)
        {
            return BadRequest();
        }

        var response = await _interviewService.UpdateAddressInterview(interviewId, address);
        return Ok(response);
    }

    [HttpDelete("{id:guid}")]
    [Authorize(Roles = "Recruiter")]
    public async Task<IActionResult> DeleteInterview(Guid id)
    {
        return await _interviewService.DeleteInterview(id) ? Ok(true) : StatusCode(StatusCodes.Status404NotFound); ;
    }


}