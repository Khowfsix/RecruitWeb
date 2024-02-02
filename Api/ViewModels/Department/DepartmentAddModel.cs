﻿using System.ComponentModel.DataAnnotations;

namespace Api.ViewModels.Department
{
    public class DepartmentAddModel
    {
        [Required]
        public string DepartmentName { get; set; } = null!;

        public string? Address { get; set; }

        [DataType(DataType.EmailAddress)]
        public string? Email { get; set; }

        [DataType(DataType.PhoneNumber)]
        public string? Phone { get; set; }

        [DataType(DataType.Url)]
        public string? Website { get; set; }
    }
}