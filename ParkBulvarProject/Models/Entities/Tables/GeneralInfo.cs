using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class GeneralInfo:CoreEntity
    {
        [DisplayName("Nömrə")]
        [MaxLength(30, ErrorMessage ="30 karakterden artiq ola bilmez")]
        public string Phone { get; set; }
        [DisplayName("İş saatları")]
        [MaxLength(30, ErrorMessage = "30 karakterden artiq ola bilmez")]
        public string WorkHours { get; set; }
        [DisplayName("Necə getmək olar")]
        public string HowToGo { get; set; }
    }
}
