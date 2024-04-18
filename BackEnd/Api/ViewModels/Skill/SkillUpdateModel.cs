﻿namespace Api.ViewModels.Skill
{
    public class SkillUpdateModel
    {
        public Guid SkillId { get; set; }
        public string SkillName { get; set; } 

        public string? Description { get; set; }

        public bool IsDeleted { get; set; } = false;
    }
}