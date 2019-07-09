namespace ParkBulvarProject.Models.Entities
{
    public class ShopCategoryDictionary : CoreEntity
    {
        public string Name { get; set; }

        public int ShopCategoryId { get; set; }
        public virtual ShopCategory ShopCategory { get; set; }
        public int LanguageId { get; set; }
        public virtual Language Language { get; set; }
    }

}
