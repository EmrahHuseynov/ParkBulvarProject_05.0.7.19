using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class News : CoreEntity
    {
        [MaxLength(255)]
        public string TitleImage { get; set; }
        public DateTime dateTime { get; set; }
        public int Queue { get; set; }
        public byte Type { get; set; }
        public virtual List<NewsDictionary> NewsDictionaries { get; set; }
        public virtual List<NewsImage> NewsImages { get; set; }
    }
}
