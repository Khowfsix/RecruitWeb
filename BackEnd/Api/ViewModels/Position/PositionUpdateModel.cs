﻿namespace Api.ViewModels.Position
{
    public class PositionUpdateModel
    {
        // Update model cũng giống add model, truyền id trên param là được
        // public Guid PositionId { get; set; }

        public string? PositionName { get; set; }

        public string? Description { get; set; }

        public string? ImageURL { get; set; }

        public decimal? MinSalary { get; set; }
        public decimal? MaxSalary { get; set; }

        public int MaxHiringQty { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public Guid LanguageId { get; set; }
        public Guid LevelId { get; set; }

        public Guid CategoryPositionId { get; set; }

        public bool IsDeleted { get; set; } = false;
    }
}