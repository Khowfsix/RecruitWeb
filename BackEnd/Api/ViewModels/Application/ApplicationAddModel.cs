﻿namespace Api.ViewModels.Application
{
    public class ApplicationAddModel
    {
        public Guid Cvid { get; set; }
        public Guid PositionId { get; set; }
        public string Introduce { get; set; }
        public int? Priority { get; set; }
    }
}