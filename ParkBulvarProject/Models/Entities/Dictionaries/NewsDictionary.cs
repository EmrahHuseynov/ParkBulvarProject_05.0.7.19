using System;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class NewsDictionary : CoreEntity
    {
        public string Title { get; set; }
        public string Text { get; set; }

        public int LanguageId { get; set; }
        public virtual Language Language { get; set; }
        public int NewsId { get; set; }
        public virtual News News { get; set; } 
    }
}
