﻿namespace Data.Entities;

public partial class Round
{
    public Guid RoundId { get; set; }

    public Guid InterviewId { get; set; }

    public Guid QuestionId { get; set; }

    public double? Score { get; set; }

    public virtual Interview Interview { get; set; } 

    public virtual Question Question { get; set; } 
}