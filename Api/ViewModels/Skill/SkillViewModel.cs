﻿namespace Api.ViewModels.Skill
{
    public class SkillViewModel
    {
        public Guid SkillId { get; set; }
        public string SkillName { get; set; } = null!;

        public string? Description { get; set; }

        public bool IsDeleted { get; set; } = false;
    }
}