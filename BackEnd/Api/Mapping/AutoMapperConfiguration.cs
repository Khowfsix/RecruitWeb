﻿using Api.ViewModels;
using Api.ViewModels.Application;
using Api.ViewModels.BlackList;
using Api.ViewModels.Candidate;
using Api.ViewModels.CandidateJoinEvent;
using Api.ViewModels.CategoryPosition;
using Api.ViewModels.CategoryQuestion;
using Api.ViewModels.Certificate;
using Api.ViewModels.Company;
using Api.ViewModels.Cv;
using Api.ViewModels.CvHasSkill;
using Api.ViewModels.Event;
using Api.ViewModels.Interview;
using Api.ViewModels.Interviewer;
using Api.ViewModels.Itrsinterview;
using Api.ViewModels.Language;
using Api.ViewModels.Position;
using Api.ViewModels.Question;
using Api.ViewModels.QuestionSkill;
using Api.ViewModels.Recruiter;
using Api.ViewModels.Report;
using Api.ViewModels.Requirement;
using Api.ViewModels.Result;
using Api.ViewModels.Room;
using Api.ViewModels.Round;
using Api.ViewModels.SecurityAnswer;
using Api.ViewModels.SecurityQuestion;
using Api.ViewModels.Shift;
using Api.ViewModels.Skill;
using Api.ViewModels.SuccessfulCadidate;
using AutoMapper;
using Data.Entities;
using Data.Paging;
using Service.Models;

namespace Data.Mapping
{
    public class AutoMapperConfiguration : Profile
    {
        public AutoMapperConfiguration()
        {
            #region CategoryPosition

            CreateMap<CategoryPosition, CategoryPositionModel>().ReverseMap();
            CreateMap<CategoryPositionModel, CategoryPositionViewModel>().ReverseMap();
            CreateMap<CategoryPositionModel, CategoryPositionAddModel>().ReverseMap();
            CreateMap<CategoryPositionModel, CategoryPositionUpdateModel>().ReverseMap();

            #endregion CategoryPosition

            #region Language

            CreateMap<Language, LanguageModel>().ReverseMap();
            CreateMap<LanguageModel, LanguageViewModel>().ReverseMap();
            CreateMap<LanguageModel, LanguageAddModel>().ReverseMap();
            CreateMap<LanguageModel, LanguageUpdateModel>().ReverseMap();

            #endregion Language

            #region Position
            CreateMap<PositionModel, PositionModel>()
                .ForAllMembers(opts => opts.Condition((src, dest, srcMember) => {
                    if (srcMember is Guid guidValue) {
                        if (guidValue == Guid.Parse("00000000-0000-0000-0000-000000000000"))
                            return false;
                    }

                    if (srcMember == null)
                    {
                        return false;
                    }

                    return true;
                }));
            //.ForMember(dest => dest.CompanyId, opt => opt.Ignore()) 
            //.ForMember(dest => dest.RecruiterId, opt => opt.Ignore()) 
            //.ForMember(dest => dest.Requirements, opt => opt.Ignore());
            CreateMap<Position, PositionModel>().ReverseMap();
            CreateMap<PositionModel, PositionViewModel>().ReverseMap();
            CreateMap<PositionModel, PositionAddModel>().ReverseMap();
            CreateMap<PositionUpdateModel, PositionModel>().ReverseMap();
            CreateMap<PositionFilter, PositionFilterModel>().ReverseMap();
            #endregion Position

            #region Question

            CreateMap<Question, QuestionModel>().ReverseMap();
            CreateMap<QuestionModel, QuestionAddModel>().ReverseMap();
            CreateMap<QuestionModel, QuestionUpdateModel>().ReverseMap();
            CreateMap<QuestionModel, QuestionViewModel>().ReverseMap();

            #endregion Question

            #region QuestionSkill

            CreateMap<QuestionSkill, QuestionSkillModel>().ReverseMap();
            CreateMap<QuestionSkillModel, QuestionSkillAddModel>().ReverseMap();
            CreateMap<QuestionSkillModel, QuestionSkillUpdateModel>().ReverseMap();
            CreateMap<QuestionSkillModel, QuestionSkillViewModel>().ReverseMap();

            #endregion QuestionSkill

            #region Recruiter

            CreateMap<Recruiter, RecruiterModel>().ReverseMap();
            CreateMap<RecruiterModel, RecruiterAddModel>().ReverseMap();
            CreateMap<RecruiterModel, RecruiterUpdateModel>().ReverseMap();
            CreateMap<RecruiterModel, RecruiterViewModel>().ReverseMap();

            #endregion Recruiter

            #region Report

            CreateMap<Report, ReportModel>().ReverseMap();
            CreateMap<ReportModel, ReportAddModel>().ReverseMap();
            CreateMap<ReportModel, ReportUpdateModel>().ReverseMap();
            CreateMap<ReportModel, ReportViewModel>().ReverseMap();

            #endregion Report

            #region Requirement

            CreateMap<Requirement, RequirementModel>().ReverseMap();
            CreateMap<RequirementModel, RequirementAddModel>().ReverseMap();
            CreateMap<RequirementModel, RequirementUpdateModel>().ReverseMap();
            CreateMap<RequirementModel, RequirementViewModel>().ReverseMap();

            #endregion Requirement

            #region Result

            CreateMap<Result, ResultModel>().ReverseMap();
            CreateMap<ResultModel, ResultAddModel>().ReverseMap();
            CreateMap<ResultModel, ResultUpdateModel>().ReverseMap();
            CreateMap<ResultModel, ResultViewModel>().ReverseMap();

            #endregion Result

            #region Room

            CreateMap<Room, RoomModel>().ReverseMap();
            CreateMap<RoomModel, RoomAddModel>().ReverseMap();
            CreateMap<RoomModel, RoomUpdateModel>().ReverseMap();
            CreateMap<RoomModel, RoomViewModel>().ReverseMap();

            #endregion Room

            #region Round

            CreateMap<Round, RoundModel>().ReverseMap();
            CreateMap<RoundModel, RoundAddModel>().ReverseMap();
            CreateMap<RoundModel, RoundUpdateModel>().ReverseMap();
            CreateMap<RoundModel, RoundViewModel>().ReverseMap();

            #endregion Round

            #region Shift

            CreateMap<Shift, ShiftModel>().ReverseMap();
            CreateMap<ShiftModel, ShiftAddModel>().ReverseMap();
            CreateMap<ShiftModel, ShiftUpdateModel>().ReverseMap();
            CreateMap<ShiftModel, ShiftViewModel>().ReverseMap();

            #endregion Shift

            #region Skill

            CreateMap<SkillModel, Skill>().ReverseMap();
            CreateMap<SkillModel, SkillAddModel>().ReverseMap();
            CreateMap<SkillModel, SkillUpdateModel>().ReverseMap();
            CreateMap<SkillModel, SkillViewModel>().ReverseMap();

            #endregion Skill

            #region SuccessfulCadidate

            CreateMap<SuccessfulCadidate, SuccessfulCadidateModel>().ReverseMap();
            CreateMap<SuccessfulCadidateModel, SuccessfulCadidateAddModel>().ReverseMap();
            CreateMap<SuccessfulCadidateModel, SuccessfulCadidateUpdateModel>().ReverseMap();
            CreateMap<SuccessfulCadidateModel, SuccessfulCadidateViewModel>().ReverseMap();

            #endregion SuccessfulCadidate

            #region Application

            CreateMap<Application, ApplicationModel>().ReverseMap();
            CreateMap<ApplicationModel, ApplicationAddModel>().ReverseMap();
            CreateMap<ApplicationModel, ApplicationUpdateModel>().ReverseMap();
            CreateMap<ApplicationModel, ApplicationViewModel>().ReverseMap();
            CreateMap<ApplicationModel, ApplicationHistoryViewModel>().ReverseMap();

            #endregion Application

            #region BlackList

            CreateMap<BlackList, BlacklistModel>().ReverseMap();
            CreateMap<BlacklistModel, BlackListAddModel>().ReverseMap();
            CreateMap<BlacklistModel, BlackListUpdateModel>().ReverseMap();
            CreateMap<BlacklistModel, BlacklistViewModel>().ReverseMap();

            #endregion BlackList

            #region Candidate

            CreateMap<Candidate, CandidateModel>().ReverseMap();
            CreateMap<CandidateModel, CandidateAddModel>().ReverseMap();
            CreateMap<CandidateModel, CandidateUpdateModel>().ReverseMap();
            CreateMap<CandidateModel, CandidateViewModel>().ReverseMap();

            #endregion Candidate

            #region Profile Candidate

            CreateMap<Candidate, ProfileModel>().ReverseMap();
            CreateMap<ProfileModel, ProfileViewModel>().ReverseMap();

            #endregion Profile Candidate

            #region CandidateJoinEvent

            CreateMap<CandidateJoinEvent, CandidateJoinEventModel>().ReverseMap();
            CreateMap<CandidateJoinEventModel, CandidateJoinEventAddModel>().ReverseMap();
            CreateMap<CandidateJoinEventModel, CandidateJoinEventUpdateModel>().ReverseMap();
            CreateMap<CandidateJoinEventModel, CandidateJoinEventViewModel>().ReverseMap();
            CreateMap<CandidateJoinEvent, CandidateJoinedEvent>().ReverseMap();
            CreateMap<CandidateJoinEventModel, CandidateJoinedEvent>().ReverseMap();
            CreateMap<CandidateJoinEvent, CandidateJoinEventModel>().ReverseMap();

            #endregion CandidateJoinEvent

            #region CategoryQuestion

            CreateMap<CategoryQuestion, CategoryQuestionModel>().ReverseMap();
            CreateMap<CategoryQuestionModel, CategoryQuestionAddModel>().ReverseMap();
            CreateMap<CategoryQuestionModel, CategoryQuestionUpdateModel>().ReverseMap();
            CreateMap<CategoryQuestionModel, CategoryQuestionViewModel>().ReverseMap();

            #endregion CategoryQuestion

            #region Certificate

            CreateMap<Certificate, CertificateModel>().ReverseMap();
            CreateMap<CertificateModel, CertificateAddModel>().ReverseMap();
            CreateMap<CertificateModel, CertificateUpdateModel>().ReverseMap();
            CreateMap<CertificateModel, CertificateViewModel>().ReverseMap();

            #endregion Certificate

            #region Cv

            CreateMap<Cv, CvModel>().ReverseMap();
            CreateMap<CvModel, CvAddModel>().ReverseMap();
            CreateMap<CvModel, CvUpdateModel>().ReverseMap();
            CreateMap<CvModel, CvViewModel>().ReverseMap();
            CreateMap<CvAddModel, CvViewModel>().ReverseMap();

            #endregion Cv

            #region CvHasSkill

            CreateMap<CvHasSkill, CvHasSkillModel>().ReverseMap();
            CreateMap<CvHasSkillModel, CvHasSkillAddModel>().ReverseMap();
            CreateMap<CvHasSkillModel, CvHasSkillUpdateModel>().ReverseMap();
            CreateMap<CvHasSkillModel, CvHasSkillViewModel>().ReverseMap();

            #endregion CvHasSkill

            #region Company

            CreateMap<Company, CompanyModel>().ReverseMap();
            CreateMap<CompanyModel, CompanyViewModel>().ReverseMap();
            CreateMap<CompanyModel, CompanyUpdateModel>().ReverseMap();
            CreateMap<CompanyModel, CompanyAddModel>().ReverseMap();

            #endregion Company

            #region Event

            CreateMap<Event, EventModel>().ReverseMap();
            CreateMap<EventModel, EventAddModel>().ReverseMap();
            CreateMap<EventModel, EventUpdateModel>().ReverseMap();
            CreateMap<EventModel, EventViewModel>().ReverseMap();

            #endregion Event

            #region Itrsinterview

            CreateMap<Itrsinterview, ItrsinterviewModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewAddModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewUpdateModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewViewModel>().ReverseMap();

            #endregion Itrsinterview

            #region Interview

            CreateMap<Interview, InterviewModel>().ReverseMap();
            CreateMap<InterviewModel, InterviewUpdateModel>().ReverseMap();
            CreateMap<InterviewModel, InterviewAddModel>().ReverseMap();
            CreateMap<InterviewModel, InterviewViewModel>().ReverseMap();

            #endregion Interview

            #region Interviewer

            CreateMap<Interviewer, InterviewerModel>().ReverseMap();
            CreateMap<InterviewerModel, InterviewerAddModel>().ReverseMap();
            CreateMap<InterviewerModel, InterviewerUpdateModel>().ReverseMap();
            CreateMap<InterviewerModel, InterviewerViewModel>().ReverseMap();

            #endregion Interviewer

            #region Itrsinterview

            CreateMap<Itrsinterview, ItrsinterviewModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewAddModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewUpdateModel>().ReverseMap();
            CreateMap<ItrsinterviewModel, ItrsinterviewViewModel>().ReverseMap();

            #endregion Itrsinterview

            #region SecurityQuestion

            CreateMap<SecurityQuestion, SecurityQuestionModel>().ReverseMap();
            CreateMap<SecurityQuestionModel, SecurityQuestionViewModel>().ReverseMap();
            CreateMap<SecurityQuestionModel, SecurityQuestionAddModel>().ReverseMap();
            CreateMap<SecurityQuestionModel, SecurityQuestionUpdateModel>().ReverseMap();

            #endregion SecurityQuestion

            #region SecurityAnswer

            CreateMap<SecurityAnswer, SecurityAnswerModel>().ReverseMap();
            CreateMap<SecurityAnswerModel, SecurityAnswerViewModel>().ReverseMap();
            CreateMap<SecurityAnswerModel, SecurityAnswerAddModel>().ReverseMap();
            CreateMap<SecurityAnswerModel, SecurityAnswerUpdateModel>().ReverseMap();

            #endregion SecurityAnswer

            #region WebUser

            CreateMap<WebUser, UserViewModel>().ReverseMap();
            CreateMap<WebUser, WebUserViewModel>().ReverseMap();
            CreateMap<WebUser, ProfileViewModel>().ReverseMap();

            CreateMap<WebUser, UserModel>().ReverseMap();
            CreateMap<WebUser, WebUserModel>().ReverseMap();

            CreateMap<WebUserModel, WebUserViewModel>().ReverseMap();
            CreateMap<UserModel, WebUserViewModel>().ReverseMap();

            #endregion WebUser
        }
    }
}