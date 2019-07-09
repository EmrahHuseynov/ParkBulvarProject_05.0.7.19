using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities;

namespace ParkBulvarProject.Controllers
{
    public class AJaxController : Controller
    {
        private ParkBulvarContext context;
        public AJaxController(ParkBulvarContext _context)
        {
            context = _context;
        }
        public IActionResult getshopinfo(string shopname)
        {
            Shop shop = null;
            if (shopname != string.Empty)
            {
                 //shopname=shopname.ToLower().Replace(" ", "").Replace("ı", "i").Replace("ə", "e");
                foreach (var item in context.shopDictionaries)
                {
                    if (item.Name != null && item.Name != string.Empty)
                    {
                        if (item.Name.ToLower()/*.Replace(" ", "").Replace("ı", "i").Replace("ə", "e") */== shopname.ToLower())
                        {
                            shop = item.Shop;
                            break;
                        }
                    }
                   
                }
                 //shop = context.shops.FirstOrDefault(x => x.ShopDictionaries.Any(y => y.Name.ToLower().Replace(" ","").Replace("ı","i").Replace("ə","e") == shopname));
            }
            if (shop != null)
            {
                string lang = "az-Latn";
                if (HttpContext.Session.GetString("lang") != null)
                {
                    lang = HttpContext.Session.GetString("lang");
                }
                ViewBag.lang = lang;
                return PartialView(shop);
            }
            else
            {
                return PartialView();
            }
          
        }
    }
}