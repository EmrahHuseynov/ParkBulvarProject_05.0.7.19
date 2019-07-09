namespace ParkBulvarProject.Models.Entities.Tables
{
    public class AboutUsPageDictionary : CoreEntity
    {
        public string Title { get; set; }
        public string Text { get; set; }

        public int AboutUspageId { get; set; }
        public virtual AboutUsPage AboutUsPage { get; set; }

        public int LanguageId { get; set; }
        public virtual Language Language { get; set; }
    }
}
