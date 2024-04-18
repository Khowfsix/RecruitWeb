namespace Service.Models
{
    public class LanguageModel
    {
        public Guid LanguageId { get; set; }

        public string LanguageName { get; set; } 

        public bool IsDeleted { get; set; } = false;
    }
}