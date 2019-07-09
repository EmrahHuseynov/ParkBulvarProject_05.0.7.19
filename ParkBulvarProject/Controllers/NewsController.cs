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
    public class NewsController : Controller
    {
        private ParkBulvarContext context;
        public NewsController(ParkBulvarContext _context)
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
            return View(new NewsIndexViewModel {
                news=context.news.Where(x=>x.Type==1).OrderBy(x=>x.Queue).ToList(),
                pageconfig=context.newsPages.FirstOrDefault()
            });
        }

        public IActionResult InnerNews(int? id)
        {
            if (id == null)
                return RedirectToAction("Index");
            string lang = "az-Latn";
            if (HttpContext.Session.GetString("lang") != null)
            {
                lang = HttpContext.Session.GetString("lang");
            }
            ViewBag.lang = lang;
            var readingnews = context.news.Find(id);
            var news = context.news.Where(x=>x.Type==1).OrderBy(x=>x.Queue).ToList();
            news.Remove(readingnews);
            return View(new InnerNewsViewModel {
                news = readingnews,
                othernews=news
            });
        }
    }
}