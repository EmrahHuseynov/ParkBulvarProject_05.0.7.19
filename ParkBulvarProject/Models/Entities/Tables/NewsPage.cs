using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class NewsPage : CoreEntity
    {
        [MaxLength(255)]
        public string Image { get; set; }
        public virtual List<NewsPageDictionary> NewsPageDictionaries { get; set; }
    }
}
