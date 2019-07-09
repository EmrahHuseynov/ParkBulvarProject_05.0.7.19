using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities.Tables
{
    public class NewsImage:CoreEntity
    {
        [MaxLength(255)]
        public string Image { get; set; }
        public int NewsId { get; set; }
        public virtual News News { get; set; }

    }
}
