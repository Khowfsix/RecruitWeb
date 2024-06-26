﻿using AutoMapper;
using Data.Entities;
using Data.Interfaces;
using Microsoft.IdentityModel.Tokens;
using Service.Interfaces;
using Service.Models;

namespace Service
{
    public class CompanyService : ICompanyService
    {
        private readonly ICompanyRepository _companyRepository;
        private readonly IMapper _mapper;

        public CompanyService(ICompanyRepository companyRepository, IMapper mapper)
        {
            _companyRepository = companyRepository;
            _mapper = mapper;
        }

        public async Task<bool> DeleteCompany(Guid requestId)
        {
            return await _companyRepository.DeleteCompany(requestId);
        }

        public async Task<IEnumerable<CompanyModel>> GetAllCompany(bool isAdmin, string? request)
        {
            var data = await _companyRepository.GetAllCompany(request);
            if (!data.IsNullOrEmpty())
            {
                List<CompanyModel> result = _mapper.Map<List<CompanyModel>>(data);
                return !isAdmin ? result.Where(o => !o.IsDeleted).ToList() : result;
            }
            return null!;
        }

        public async Task<CompanyModel> SaveCompany(CompanyModel request)
        {
            var data = _mapper.Map<Company>(request);
            var response = await _companyRepository.SaveCompany(data);
            return _mapper.Map<CompanyModel>(response);
        }

        public async Task<bool> UpdateCompany(CompanyModel request, Guid requestId)
        {
            var data = _mapper.Map<Company>(request);
            return await _companyRepository.UpdateCompany(data, requestId);
        }
    }
}