using System.ComponentModel;

namespace ParkBulvarProject.Models.Entities
{
    public class SeoKeyword : CoreEntity
    {
        [DisplayName("Açar söz")]
        public string Word { get; set; }
    }

}
