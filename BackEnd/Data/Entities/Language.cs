﻿namespace Data.Entities;

public partial class Language
{
    public Guid LanguageId { get; set; }

    public string LanguageName { get; set; } 

    public bool IsDeleted { get; set; }

    public virtual ICollection<Position> Positions { get; set; } = new List<Position>();

    public virtual ICollection<QuestionLanguage> QuestionLanguages { get; set; } = new List<QuestionLanguage>();
}