using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class GalleryImage:CoreEntity
    {
        [MaxLength(255, ErrorMessage = "255 karakterden artiq ola bilmez")]
        public string Image { get; set; }
        public int Queue { get; set; }
    }
    
}
