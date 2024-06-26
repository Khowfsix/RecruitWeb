﻿namespace Data.Entities;

public partial class BlackList
{
    public Guid BlackListId { get; set; }

    public Guid CandidateId { get; set; }

    public string? Reason { get; set; }

    public DateTime CreatedAt { get; set; }

    public int? Status { get; set; }

    public bool IsDeleted { get; set; }

    public virtual Candidate Candidate { get; set; } 
}