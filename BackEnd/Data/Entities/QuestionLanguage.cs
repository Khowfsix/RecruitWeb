﻿namespace Data.Entities;

public partial class QuestionLanguage
{
    public Guid QuestionLanguageId { get; set; }

    public Guid QuestionId { get; set; }

    public Guid LanguageId { get; set; }

    public virtual Question Question { get; set; } 

    public virtual Language Language { get; set; } 

    //public virtual ICollection<QuestionLanguage> Languages { get; set; } = new List<QuestionLanguage>();
}