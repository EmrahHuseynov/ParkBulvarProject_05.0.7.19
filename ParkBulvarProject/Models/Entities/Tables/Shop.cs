using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class Shop : CoreEntity
    {
        [MaxLength(255)]
        public string Image { get; set; }
        [MaxLength(255)]
        public string Logo { get; set; }
        public int Queue { get; set; }

        [DisplayName("B.E")]
        [MaxLength(30)]
        public string day1 { get; set; }

        [DisplayName("Ç.A")]
        [MaxLength(30)]
        public string day2 { get; set; }

        [DisplayName("Ç")]
        [MaxLength(30)]
        public string day3 { get; set; }

        [DisplayName("C.A")]
        [MaxLength(30)]
        public string day4 { get; set; }

        [DisplayName("C")]
        [MaxLength(30)]
        public string day5 { get; set; }

        [DisplayName("Ş")]
        [MaxLength(30)]
        public string day6 { get; set; }

        [DisplayName("B")]
        [MaxLength(30)]
        public string day7 { get; set; }


        [MaxLength(30,ErrorMessage ="30 karakterden cox ola bilmez!")]
        [DisplayName("Nömrə")]
        public string Number { get; set; }
        public int Floor { get; set; }

      

        public virtual List<Compaign> Compaigns { get; set; }
        public virtual List<ShopDictionary> ShopDictionaries { get; set; }
        public virtual List<ShopToCategories> ShopToCategories { get; set; }
        public virtual List<ShopToSubCategories> ShopToSubCategories { get; set; }
    }
}
