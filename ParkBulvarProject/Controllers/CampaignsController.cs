using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.ViewModels;

namespace ParkBulvarProject.Controllers
{
    public class CampaignsController : Controller
    {
        private ParkBulvarContext context;
        public CampaignsController(ParkBulvarContext _context)
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
            return View(new CompaignsIndexViewModel {
                campaigns=context.compaigns.ToList()
            });
        }
    }
}