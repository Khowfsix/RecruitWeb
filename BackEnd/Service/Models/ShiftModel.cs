﻿namespace Service.Models
{
    public class ShiftModel
    {
        public Guid ShiftId { get; set; }

        public int ShiftTimeStart { get; set; }

        public int ShiftTimeEnd { get; set; }
    }
}