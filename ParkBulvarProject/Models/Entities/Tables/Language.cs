using ParkBulvarProject.Models.Entities.Tables;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace ParkBulvarProject.Models.Entities
{
    public class Language : CoreEntity
    {
        [MaxLength(255, ErrorMessage = "Ad uzunluğu 255 karakterdən çox ola bilməz")]
        [DisplayName("Ad")]
        public string Name { get; set; }
        [MaxLength(20, ErrorMessage = "Kod uzunluğu 20 karakterdən çox ola bilməz")]
        [DisplayName("Kod")]
        public string Code { get; set; }
        public int Queue { get; set; }


        public virtual List<ShopCategoryDictionary> ShopCategoryDictionaries { get; set; }
        public virtual List<SubShopCategoryDictionary> SubShopCategoryDictionaries { get; set; }
        public virtual List<ShopDictionary> ShopDictionaries { get; set; }
        public virtual List<CompaignDictionary> CompaignDictionaries { get; set; }
        public virtual List<AboutUsPageDictionary> aboutUsPageDictionaries { get; set; }
        public virtual List<NewsDictionary> NewsDictionaries { get; set; }
        public virtual List<NewsPageDictionary> NewsPageDictionaries { get; set; }







    }

}
