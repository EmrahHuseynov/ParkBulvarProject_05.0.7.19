using System.ComponentModel;

namespace ParkBulvarProject.Models.Entities
{
    public class SeoDescription:CoreEntity
    {
        [DisplayName("Açıqlama")]
        public string Word { get; set; }
    }

}
