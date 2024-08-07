﻿using AutoMapper;
using Data.Entities;
using Data.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.IdentityModel.Tokens;
using Service.Interfaces;
using Service.Models;

namespace Service
{
    public class CvService : ICvService
    {
        private readonly ICvRepository _cvRepository;
        private readonly ICandidateRepository _candidateRepository;
        private readonly ICertificateRepository _certificateRepository;
        private readonly IMapper _mapper;
        private readonly IFileService _uploadFileService;

        public CvService(
            ICvRepository cvRepository,
            ICandidateRepository candidateRepository,
            ICertificateRepository certificateRepository,
            IMapper mapper, IFileService uploadFileService)
        {
            _cvRepository = cvRepository;
            _candidateRepository = candidateRepository;
            _certificateRepository = certificateRepository;
            _mapper = mapper;
            _uploadFileService = uploadFileService;
        }

        public async Task<bool> DeleteCv(Guid requestId)
        {
            return await _cvRepository.DeleteCv(requestId);
        }

        public async Task<IEnumerable<CvModel>> GetAllCv(string? request)
        {
            // Get Cv thuộc về candidate
            var data = await _cvRepository.GetAllCv(request);
            var resp = _mapper.Map<IList<CvModel>>(data);

            //foreach (var item in resp)
            //{
            //    // Tìm skills và gắn vào
            //    var skills = await _cvHasSkillRepository.GetSkill(item.Cvid);
            //    var skillVMs = _mapper.Map<IList<SkillModel>>(skills);
            //    item.Skills = skillVMs;

            //    // Tìm certificates và gắn vào
            //    var certificates = await _certificateRepository.GetForeignKey(item.Cvid);
            //    var certificateVMs = _mapper.Map<IList<CertificateModel>>(certificates);
            //    item.Certificates = certificateVMs;
            //}

            return resp;
        }

        public async Task<CvModel?> GetCvDefault(Guid candidateId)
        {
            var entityData = await _cvRepository.GetDefaultCv(candidateId);
            var resp = _mapper.Map<CvModel>(entityData);
            return resp;
        }

        public async Task<CvModel> SaveCv(CvModel request)
        {
            //// Get list skill
            //var skills = request.Skills;

            //// Get list Certificate
            //var CertificateVMs = request.Certificates;

            //var data = _mapper.Map<CvModel>(request);

            //// Create cv
            //var result = await _cvRepository.SaveCv(data);

            //if (result.Item1 == false)
            //    return null!;

            //var cv = result.Item2;

            //// Create Cv skill
            //foreach (var skill in skills)
            //{
            //    var cvHasSkill = new CvHasSkillModel()
            //    {
            //        Cvid = cv.Cvid,
            //        SkillId = skill.SkillId,
            //        ExperienceYear = skill.ExperienceYear
            //    };

            //    var cvHasSkill_entityData = _mapper.Map<CvHasSkill>(cvHasSkill);
            //    _ = await _cvHasSkillRepository.SaveCvHasSkillService(cvHasSkill_entityData) ?? throw new Exception("Fail to create CvHasSkill");
            //}

            //// Create Cv Certificate
            //foreach (var certificateVM in CertificateVMs)
            //{
            //    certificateVM.Cvid = cv.Cvid;
            //    var certificate = _mapper.Map<CertificateModel>(certificateVM);
            //    var certificate_entityData = _mapper.Map<Certificate>(certificate);
            //    _ = await _certificateRepository.SaveCertificate(certificate_entityData) ?? throw new Exception("Failed to save certificate");
            //}
            //var cvVM = GetCvById(result.Item2.Cvid);
            //return await cvVM;

            try
            {
                var entityData = _mapper.Map<Cv>(request);
                var response = await _cvRepository.SaveCv(entityData);
                return _mapper.Map<CvModel>(response);
            }
            catch (Exception)
            {
                return null!;
            }
        }

        public async Task<bool> UpdateCv(CvModel request, Guid requestId)
        {
            //// Get list skill
            //var skills = request.Skills;

            //// Get list Certificate
            //var CertificateVMs = request.Certificates;

            //// Update Cv
            //var data = _mapper.Map<CvModel>(request);
            //var result = await _cvRepository.UpdateCv(data, requestId);

            //if (result == false)
            //    throw new Exception("Cannot update CV");

            //// Update Cv Has Skill
            //var listCvHasSkill = await _cvHasSkillRepository.GetAllSkillsFromOneCV(requestId);

            ////// Delete all
            //foreach (var cvHasSkill in listCvHasSkill)
            //{
            //    await _cvHasSkillRepository.DeleteCvHasSkillService(cvHasSkill.CvSkillsId);
            //}

            ////// Create new
            //foreach (var skill in skills)
            //{
            //    var cvHasSkill = new CvHasSkillModel()
            //    {
            //        Cvid = requestId,
            //        SkillId = skill.SkillId,
            //        ExperienceYear = skill.ExperienceYear
            //    };

            //    await _cvHasSkillRepository.SaveCvHasSkillService(cvHasSkill);
            //}

            //// Update Certificate
            //var certificates = await _certificateRepository.GetForeignKey(requestId);

            ////// Delete all
            //foreach (var certificate in certificates)
            //{
            //    await _certificateRepository.DeleteCertificate(certificate.CertificateId);
            //}

            ////// Create new
            //foreach (var certificateVM in CertificateVMs)
            //{
            //    var certificate = _mapper.Map<CertificateModel>(certificateVM);

            //    await _certificateRepository.SaveCertificate(certificate);
            //}

            //return true;

            try
            {
                var entityData = _mapper.Map<Cv>(request);
                var response = await _cvRepository.UpdateCv(entityData, requestId);
                return _mapper.Map<CvModel>(response) != null;
            }
            catch (Exception)
            {
                return await Task.FromResult(false);
            }
        }

        public async Task<CvModel> GetCvById(Guid requestId)
        {
            //// Get cv from cv id
            //var data = await _cvRepository.GetCVById(requestId);

            //// Get skill from cv id
            //var skills = await _cvHasSkillRepository.GetSkill(requestId);

            //var skillVMs = _mapper.Map<IList<SkillModel>>(skills);

            //// Gắn skill vào cv
            //var resp = _mapper.Map<CvModel>(data);
            //resp.Skills = skillVMs;

            //// Tìm certificates và gắn vào
            //var certificates = await _certificateRepository.GetForeignKey(requestId);

            //var certificateVMs = _mapper.Map<IList<CertificateModel>>(certificates);

            //resp.Certificates = certificateVMs;
            //return resp;

            try
            {
                var data = await _cvRepository.GetCVById(requestId);
                var response = _mapper.Map<CvModel>(data);
                return response;
            }
            catch (Exception)
            {
                return null!;
            }
        }

        public async Task<IEnumerable<CvModel>> GetCvsOfCandidate(Guid candidateId)
        {
            //// Get Cv thuộc về candidate
            //var data = await _cvRepository.GetForeignKey(candidateId);

            //var resp = _mapper.Map<IEnumerable<CvModel>>(data);

            //// Tìm skills và gắn vào
            //foreach (var item in resp)
            //{
            //    // Tìm skills và gắn vào
            //    var skills = await _cvHasSkillRepository.GetSkill(item.Cvid);

            //    var skillVMs = _mapper.Map<IList<SkillModel>>(skills);

            //    item.Skills = skillVMs;

            //    // Tìm certificates và gắn vào
            //    var certificates = await _certificateRepository.GetForeignKey(item.Cvid);

            //    var certificateVMs = _mapper.Map<IList<CertificateModel>>(certificates);

            //    item.Certificates = certificateVMs;
            //}

            //return resp;

            try
            {
                var entityDatas = await _cvRepository.GetCvsByCandidateId(candidateId);
                if (!entityDatas.IsNullOrEmpty())
                {
                    var resp = _mapper.Map<IEnumerable<CvModel>>(entityDatas);
                    return resp;
                }
                return null!;
            }
            catch (Exception)
            {
                return null!;
            }
        }

        public async Task<IEnumerable<CvModel>> GetAllUserCv(string userId)
        {
            try
            {
                var data = await _cvRepository.GetAllUserCv(userId);
                var resp = _mapper.Map<IEnumerable<CvModel>>(data);
                return resp;
            }
            catch (Exception)
            {
                return null!;
            }
        }

        public async Task<bool> UploadCvPdf(IFormFile? CvFile, Guid Cvid)
        {
            // Upload file to Cloud
            if (CvFile == null)
            {
                return false;
            }

            var resp = await _uploadFileService.AddFileAsync(CvFile);
            var CvLink = resp.Url != null ? resp.Url.ToString() : "";

            var cvModel = await _cvRepository.GetCVById(Cvid) ?? throw new Exception("CV not found");
            cvModel.CvPdf = CvLink;

            var updated = await _cvRepository.UpdateCv(cvModel, cvModel.Cvid);
            return updated;
        }
    }
}