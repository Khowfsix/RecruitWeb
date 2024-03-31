﻿namespace Api.ViewModels.SecurityAnswer
{
    public class SecurityAnswerUpdateModel
    {
        public Guid SecurityAnswerId { get; set; }
        public string AnswerString { get; set; } = null!;
        public Guid SecurityQuestionId { get; set; }
        public string WebUserId { get; set; } = string.Empty;
    }
}