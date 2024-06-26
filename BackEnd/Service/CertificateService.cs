﻿using AutoMapper;
using Data.Entities;
using Data.Interfaces;
using Microsoft.IdentityModel.Tokens;
using Service.Interfaces;
using Service.Models;

namespace Service
{
    public class CertificateService : ICertificateService
    {
        private readonly ICertificateRepository _certificateRepository;
        private readonly IMapper _mapper;

        public CertificateService(ICertificateRepository certificateRepository, IMapper mapper)
        {
            _certificateRepository = certificateRepository;
            _mapper = mapper;
        }

        public async Task<bool> DeleteCertificate(Guid requestId)
        {
            return await _certificateRepository.DeleteCertificate(requestId);
        }

        public async Task<IEnumerable<CertificateModel>> GetAllCertificate(string? request)
        {
            var data = await _certificateRepository.GetAllCertificate(request);
            if (!data.IsNullOrEmpty())
            {
                List<CertificateModel> result = _mapper.Map<List<CertificateModel>>(data);
                return result;
            }
            return null!;
        }

        public async Task<CertificateModel> SaveCertificate(CertificateModel request)
        {
            var data = _mapper.Map<Certificate>(request);
            var response = await _certificateRepository.SaveCertificate(data);

            return _mapper.Map<CertificateModel>(response);
        }

        public async Task<bool> UpdateCertificate(CertificateModel request, Guid requestId)
        {
            var data = _mapper.Map<Certificate>(request);
            return await _certificateRepository.UpdateCertificate(data, requestId);
        }
    }
}