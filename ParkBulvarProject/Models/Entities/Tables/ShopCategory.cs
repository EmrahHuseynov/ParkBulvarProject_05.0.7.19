using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class ShopCategory : CoreEntity
    {
        [MaxLength(255)]
        public string CoverImage { get; set; }
        public string Logo { get; set; }
        public int Queue { get; set; }
        public virtual List<ShopCategoryDictionary> ShopCategoryDictionaries { get; set; }
        public virtual List<SubShopCategory> SubShopCategories { get; set; }

        public virtual List<ShopToCategories> ShopToCategories { get; set; }


    }

}
