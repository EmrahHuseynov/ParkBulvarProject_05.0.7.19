using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities;
using ParkBulvarProject.Models.ViewModels;

namespace ParkBulvarProject.Controllers
{
    public class ShopsController : Controller
    {

        private ParkBulvarContext context;
        public ShopsController(ParkBulvarContext _context)
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
            return View(new ShopIndexViewModel {
                categories=context.shopCategories.OrderBy(x=>x.Queue),
                shops=context.shops.OrderBy(x=>x.Queue).ToList()
            });


        }

        public IActionResult Categories(int ? id)
        {
            if (id == null)
                return RedirectToAction("Index", "Home");
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            ViewBag.lang = lang;
            var cat = context.shopCategories.FirstOrDefault(x=>x.Id==id);
            List<Shop> shops = new List<Shop>();
            foreach (var item in cat.ShopToCategories)
            {
                shops.Add(item.Shop);
            }
            if (cat != null)
            {
                return View(new ShopCategoriesViewModel
                {
                    cat=cat,
                    shops=shops
                });

            }
            else
            {
                return RedirectToAction("Index", "Home");
            }

        }


        public IActionResult All(int ? id)
        {
            if (id == null)
                return RedirectToAction("Index");
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            ViewBag.lang = lang;
            var subcat = context.subShopCategories.FirstOrDefault(x => x.Id == id);
            if (subcat != null)
            {
                return View(new ShopsAllViewModel
                {
                    subcat = subcat
                });
            }
            else
            {
                return RedirectToAction("Index");
            }

        }
    }
}