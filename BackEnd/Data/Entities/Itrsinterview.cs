﻿namespace Data.Entities;

public partial class Itrsinterview
{
    public Guid ItrsinterviewId { get; set; }

    public DateTime DateInterview { get; set; }

    public Guid ShiftId { get; set; }

    public Guid RoomId { get; set; }

    public virtual ICollection<Interview> Interviews { get; set; } = new List<Interview>();

    public virtual Room Room { get; set; } 

    public virtual Shift Shift { get; set; } 
}