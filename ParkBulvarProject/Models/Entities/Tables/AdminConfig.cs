using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class AdminConfig:CoreEntity
    {
        [MaxLength(255)]
        [DisplayName("İstifadəçi adı")]
        public string Username { get; set; }
        [MaxLength(255)]
        [DisplayName("Şifrə")]
        public string Password { get; set; }
        [MaxLength(255)]
        [DisplayName("Rol")]
        public string Role { get; set; }

    }

}
