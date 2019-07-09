using System.Collections.Generic;

namespace ParkBulvarProject.Models.Entities
{
    public class SubShopCategory : CoreEntity
    {
        public int Queue { get; set; }

        public int ShopCategoryId { get; set; }
        public virtual ShopCategory ShopCategory { get; set; }
        public virtual List<SubShopCategoryDictionary> SubShopCategoryDictionaries { get; set; }
        public virtual List<ShopToSubCategories> ShopToSubCategories { get; set; }

    }

}
