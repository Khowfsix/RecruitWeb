﻿using Api.ViewModels.Question;

namespace Api.ViewModels.Round
{
    public class RoundViewModel
    {
        public Guid RoundId { get; set; }
        public Guid InterviewId { get; set; }
        public Guid QuestionId { get; set; }
        public virtual QuestionViewModel Question { get; set; } 
        public double? Score { get; set; }
    }
}