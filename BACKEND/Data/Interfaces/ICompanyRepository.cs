﻿using Data.Entities;

namespace Data.Interfaces
{
    public interface ICompanyRepository
    {
        Task<IEnumerable<Company>> GetAllCompany(string? request);
        Task<Company> GetCompanyById(Guid companyId);

        Task<Company> SaveCompany(Company request);

        Task<bool> UpdateCompany(Company request, Guid requestId);
        Task<bool> UpdateStatus(bool isActived, bool isDeleted, Guid requestId);

        Task<bool> DeleteCompany(Guid requestId);
    }
}