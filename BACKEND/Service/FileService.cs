﻿using CloudinaryDotNet.Actions;
using Data.Interfaces;
using Microsoft.AspNetCore.Http;
using Service.Interfaces;

namespace Service
{
    public class FileService : IFileService
    {
        private readonly IFileRepository _uploadFileRepository;

        public FileService(IFileRepository uploadFileRepository)
        {
            _uploadFileRepository = uploadFileRepository;
        }

        public async Task<IEnumerable<ImageUploadResult>> AddListFileAsync(List<IFormFile> files)
        {
            return await _uploadFileRepository.AddListFileAsync(files);
        }

        public async Task<ImageUploadResult> AddFileAsync(IFormFile file)
        {
            return await _uploadFileRepository.AddFileAsync(file);
        }

        public async Task<IEnumerable<DeletionResult>> DeleteListFileAsync(List<string> listId)
        {
            return await _uploadFileRepository.DeleteListFileAsync(listId);
        }

        public async Task<DeletionResult> DeleteFileAsync(string path)
        {
            return await _uploadFileRepository.DeleteFileAsync(path);
        }
    }
}