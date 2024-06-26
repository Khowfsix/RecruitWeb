using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Api.ViewModels.Language
{
    public class LanguageUpdateModel
    {
        // [Required(ErrorMessage = "ID is not null")]
        // [ReadOnly(true)]
        // [Key]
        // public Guid LanguageId { get; set; }

        // Update model cũng giống add model, truyền id trên param là được

        [Required(ErrorMessage = "Must have Name")]
        [MaxLength(50)]
        public string LanguageName { get; set; } 

        [DefaultValue(false)]
        public bool IsDeleted { get; set; } = false;
    }
}