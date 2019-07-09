using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ParkBulvarProject.Models;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities.Tables;
using ParkBulvarProject.Models.ViewModels;

namespace ParkBulvarProject.Controllers
{
    public class HomeController : Controller
    {

        private ParkBulvarContext context;
        public HomeController(ParkBulvarContext _context)
        {
            context = _context;
        }

        public IActionResult Index()
        {
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            ViewBag.lang = lang;
            return View(new HomeIndexViewModel {
                sociallinks=context.socialLinks.ToList(),
                slideritems=context.homeSliderItems.OrderBy(x => x.Queue).ToList(),
                shopcategories=context.shopCategories.OrderBy(x => x.Queue).ToList(),
                events=context.news.Where(x=>x.Type!=1).OrderBy(x => x.Queue).ToList(),
                compaigns=context.compaigns.OrderBy(x => x.Queue).ToList(),
                galleryimages=context.galleryImages.OrderBy(x => x.Queue).ToList(),
                generalinfo=context.generalInfos.FirstOrDefault()
            });
        }

        public IActionResult About()
        {
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            ViewBag.lang = lang;
            return View(new HomeAboutViewModel {
                info=context.aboutUsPages.FirstOrDefault()
            });
        }
        public IActionResult Contact()
        {
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            return View(new HomeContactViewModel {
                info=context.generalInfos.FirstOrDefault(),
                sociallinks=context.socialLinks.ToList()
            });
        }


        public IActionResult Model(int ? id)
        {
            if (id != null)
            {
                ViewBag.name = context.shops.Find(id).ShopDictionaries.First().Name;
            }
            return View();
        }


        public IActionResult AddMail(Follower follower)
        {
          
            context.Add(follower);
            context.SaveChanges();
            return Json(new
            {
                status = 200
            });
           
        }

        [HttpPost]
        public IActionResult Search(string keyword)
        {
            var shop = context.shopDictionaries.FirstOrDefault(x => x.Name.ToLower().Contains(keyword.ToLower()));
            if (shop != null)
            {
                return RedirectToAction("Model", "Home", new { id = shop.ShopId });
            }
            else
            {
                return RedirectToAction("Model");
            }
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
