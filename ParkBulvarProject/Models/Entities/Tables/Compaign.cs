using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class Compaign : CoreEntity
    {
        [MaxLength(255)]
        public string Image { get; set; }
        public byte Type { get; set; }
        public byte IsCompleted { get; set; }
        public int Queue { get; set; }
        [DisplayName("Mağaza")]
        public int ShopId { get; set; }
        public virtual Shop Shop { get; set; }
        public virtual List<CompaignDictionary> CompaignDictionaries { get; set; }

    }

}
