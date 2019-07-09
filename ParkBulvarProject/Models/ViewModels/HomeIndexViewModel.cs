using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ParkBulvarProject.Models.Entities;
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Models.ViewModels
{
    public class HomeIndexViewModel
    {
        public List<SocialLink> sociallinks { get; internal set; }
        public List<HomeSliderItem> slideritems { get; internal set; }
        public List<ShopCategory> shopcategories { get; internal set; }
        public List<Compaign> compaigns { get; internal set; }
        public List<GalleryImage> galleryimages { get; internal set; }
        public GeneralInfo generalinfo { get; internal set; }
        public List<News> events { get; internal set; }
    }
}
