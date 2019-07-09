using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class CompaignDictionary : CoreEntity
    {
        [MaxLength(255)]
        public string Name { get; set; }
        [MaxLength(255)]
        public string Duration { get; set; }

        public int LanguageId { get; set; }
        public virtual Language Language { get; set; }
        public int CompaignId { get; set; }
        public virtual Compaign Compaign { get; set; }
    }

}
