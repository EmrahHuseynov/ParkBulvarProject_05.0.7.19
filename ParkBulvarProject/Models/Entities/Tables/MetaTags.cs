using System.ComponentModel;

namespace ParkBulvarProject.Models.Entities
{
    public class MetaTags : CoreEntity
    {
        [DisplayName("Kod")]
        public string TagName { get; set; }
    }

}
