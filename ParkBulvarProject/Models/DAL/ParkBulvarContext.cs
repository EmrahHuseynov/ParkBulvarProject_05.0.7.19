using Microsoft.EntityFrameworkCore;
using ParkBulvarProject.Models.Entities;
using ParkBulvarProject.Models.Entities.Tables;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ParkBulvarProject.Models.DAL
{
    public class ParkBulvarContext:DbContext
    {
        public ParkBulvarContext(DbContextOptions<ParkBulvarContext> options):base(options)
        { }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLazyLoadingProxies();
        }

        public DbSet<CompaignDictionary> compaignDictionaries { get; set; }
        public DbSet<ShopCategoryDictionary> shopCategoryDictionaries { get; set; }
        public DbSet<ShopDictionary> shopDictionaries { get; set; }
        public DbSet<SubShopCategoryDictionary> subShopCategoryDictionaries { get; set; }

        public DbSet<Compaign> compaigns { get; set; }
        public DbSet<Follower> followers { get; set; }
        public DbSet<GalleryImage> galleryImages { get; set; }
        public DbSet<HomeSliderItem> homeSliderItems { get; set; }
        public DbSet<Language> languages { get; set; }
        public DbSet<SeoDescription> seoDescriptions { get; set; }
        public DbSet<SeoKeyword> seoKeyWords { get; set; }
        public DbSet<MetaTags> metaTags { get; set; }
        public DbSet<Shop> shops { get; set; }
        public DbSet<ShopCategory> shopCategories { get; set; }
        public DbSet<SocialLink> socialLinks { get; set; }
        public DbSet<SubShopCategory> subShopCategories { get; set; }
        public DbSet<AboutUsPage> aboutUsPages { get; set; }
        public DbSet<AboutUsPageDictionary> aboutUsPageDictionaries { get; set; }
        public DbSet<GeneralInfo> generalInfos { get; set; }
        public DbSet<News> news { get; set; }
        public DbSet<NewsDictionary> newsDictionaries { get; set; }
        public DbSet<NewsImage> newsImages { get; set; }
        public DbSet<NewsPage> newsPages { get; set; }
        public DbSet<NewsPageDictionary> newsPageDictionaries { get; set; }
        public DbSet<AdminConfig> admnConfig { get; set; }
        public DbSet<ShopToCategories> ShopToCategories { get; set; }
        public DbSet<ShopToSubCategories> ShopToSubCategories { get; set; }


    }
}
