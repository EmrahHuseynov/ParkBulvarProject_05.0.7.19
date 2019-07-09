using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class AboutUsPage:CoreEntity
    {
        [MaxLength(255)]
        public string Image { get; set; }
        public virtual List<AboutUsPageDictionary> aboutUsPageDictionaries { get; set; }
    }
}
