namespace ParkBulvarProject.Models.Entities.Tables
{
    public class NewsPageDictionary : CoreEntity
    {
        public string Title { get; set; }
        public string Text { get; set; }

        public int NewsPageId { get; set; }
        public int LanguageId { get; set; }
        public virtual NewsPage NewsPage { get; set; }
        public virtual Language Language { get; set; }
    }
}
