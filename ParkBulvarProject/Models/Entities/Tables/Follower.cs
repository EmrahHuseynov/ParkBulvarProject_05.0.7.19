using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class Follower:CoreEntity
    {
        [MaxLength(255,ErrorMessage ="255 karakterden artiq ola bilmez")]
        [DisplayName("E-mail")]
        public string Email { get; set; }
    }

}
