using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities.Tables;
using static ParkBulvarProject.Helper;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class NewsPagesController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public NewsPagesController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }





        public async Task<IActionResult> Index()
        {
            return View(await _context.newsPages.ToListAsync());
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(NewsPage newsPage,IFormFile img,List<NewsPageDictionary> Dictionary)
        {
           
            if (img != null && ImageIsValid(img))
            {
                newsPage.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", img);
            }

            _context.Add(newsPage);
            await _context.SaveChangesAsync();
            var saved = _context.newsPages.OrderByDescending(x => x.Id).First();
            foreach (var item in Dictionary)
            {
                item.NewsPageId = saved.Id;
                _context.Add(item);
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var newsPage = await _context.newsPages.FindAsync(id);
            if (newsPage == null)
            {
                return NotFound();
            }
            return View(newsPage);
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,  NewsPage newsPage,IFormFile img,List<NewsPageDictionary> Dictionary)
        {
            if (id != newsPage.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (img != null && ImageIsValid(img))
                    {
                        if (newsPage.Image != null)
                        {
                            DeleteImage(newsPage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newslist/");
                        }
                        newsPage.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", img);
                    }
                    _context.Update(newsPage);
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewsPageExists(newsPage.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(newsPage);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var newsPage = await _context.newsPages.FindAsync(id);
            if (newsPage.Image != null)
            {
                DeleteImage(newsPage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newslist/");
            }
            _context.newsPages.Remove(newsPage);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool NewsPageExists(int id)
        {
            return _context.newsPages.Any(e => e.Id == id);
        }
    }
}
