namespace ParkBulvarProject.Models.Entities
{
    public class ShopToSubCategories : CoreEntity
    {
        public int ShopId { get; set; }
        public virtual Shop Shop { get; set; }
        public int SubShopCategoryId { get; set; }
        public virtual SubShopCategory SubShopCategory { get; set; }
    }
}
