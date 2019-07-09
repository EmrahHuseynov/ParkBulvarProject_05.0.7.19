using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class ShopDictionary : CoreEntity
    {
        [MaxLength(255)]
        public string Name { get; set; }
        public string AboutText { get; set; }
        public string WorkHours { get; set; }

        public int ShopId { get; set; }
        public int LanguageId { get; set; }

        public virtual Shop Shop { get; set; }
        public virtual Language Language { get; set; }
    }

}
