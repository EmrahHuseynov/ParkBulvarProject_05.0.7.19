using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class HomeSliderItem : CoreEntity
    {
        [MaxLength]
        public string Image { get; set; }
        public int Queue { get; set; }
        public string Link { get; set; }
    }

}
