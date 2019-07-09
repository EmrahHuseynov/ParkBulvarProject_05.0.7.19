using System.ComponentModel;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class SocialLink:CoreEntity
    {
        [DisplayName("Link")]
        public string Link { get; set; }
        [DisplayName("İkon")]
        public string Icon { get; set; }
    }

}
