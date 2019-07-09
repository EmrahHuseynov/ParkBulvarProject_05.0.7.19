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

    public class NewsController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public NewsController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.news.OrderBy(x=>x.Queue).ToListAsync());
        }

       
        public IActionResult Create()
        {
            return View();
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(News news,List<IFormFile> newsimages,IFormFile img,List<NewsDictionary> Dictionary)
        {
          
                if (img != null&& ImageIsValid(img))
                {
                    news.TitleImage = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", img);
                }
               
                _context.Add(news);
                await _context.SaveChangesAsync();
                var savednews = _context.news.OrderByDescending(x => x.Id).FirstOrDefault();
                if (newsimages != null && newsimages.Count > 0 && newsimages[0] != null)
                {
                    foreach (var item in newsimages)
                    {
                        if (ImageIsValid(item))
                        {
                            _context.newsImages.Add(new NewsImage
                            {
                                NewsId = savednews.Id,
                                Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", item)
                            });
                        }
                      
                    }
                   await _context.SaveChangesAsync();
                }
                foreach (var item in Dictionary)
                {
                    item.NewsId = savednews.Id;
                    _context.Add(item);
                }
           await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
          
        }

        // GET: Admin/News/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var news = await _context.news.FindAsync(id);
            if (news == null)
            {
                return NotFound();
            }
            return View(news);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, News news,List<IFormFile> newsimages,IFormFile img,List<NewsDictionary> Dictionary)
        {
            if (id != news.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {

                    if (img != null && ImageIsValid(img))
                    {
                        if (news.TitleImage != null)
                        {
                            DeleteImage(news.TitleImage, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newsList/");
                        }
                        news.TitleImage = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", img);
                    }
                    if (newsimages != null && newsimages.Count > 0 && newsimages[0] != null)
                    {
                        foreach (var item in newsimages)
                        {
                            if (ImageIsValid(item))
                            {
                                _context.newsImages.Add(new NewsImage
                                {
                                    NewsId = news.Id,
                                    Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\newsList\\", item)
                                });
                            }

                        }
                        await _context.SaveChangesAsync();
                    }
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                    _context.Update(news);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!NewsExists(news.Id))
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
            return View(news);
        }

     
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var news = await _context.news.FindAsync(id);
            if (news.TitleImage != null)
            {
                DeleteImage(news.TitleImage, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newsList/");
            }
            foreach (var item in _context.newsImages.Where(x=>x.NewsId==id).ToList())
            {
                DeleteImage(item.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newsList/");
                _context.Remove(item);
            }
            _context.news.Remove(news);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult removeimage(int id)
        {
            var img = _context.newsImages.Find(id);
            DeleteImage(img.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/newsList/");
            _context.newsImages.Remove(img);
            _context.SaveChanges();
            return Json(new
            {
                status=200
            });

        }


        private bool NewsExists(int id)
        {
            return _context.news.Any(e => e.Id == id);
        }
    }
}
