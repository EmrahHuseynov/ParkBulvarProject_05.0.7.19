using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class SubShopCategoryDictionary:CoreEntity
    {
        [MaxLength(255)]
        public string Name { get; set; }

        public int SubShopCategoryId { get; set; }
        public int LanguageId { get; set; }
        public virtual Language Language { get; set; }
        public virtual SubShopCategory SubShopCategory { get; set; }
    }

}
