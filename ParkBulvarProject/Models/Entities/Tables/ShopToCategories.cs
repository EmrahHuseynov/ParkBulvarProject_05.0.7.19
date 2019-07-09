namespace ParkBulvarProject.Models.Entities
{
    public class ShopToCategories:CoreEntity
    {
        public int ShopId { get; set; }
        public virtual Shop Shop { get; set; }
        public int ShopCategoryId { get; set; }
        public virtual ShopCategory ShopCategory { get; set; }
    }
}
