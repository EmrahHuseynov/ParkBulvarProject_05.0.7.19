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
    public class AboutUsPagesController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public AboutUsPagesController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }
        

        public async Task<IActionResult> Index()
        {
            return View(await _context.aboutUsPages.ToListAsync());
        }

      

        public IActionResult Create()
        {
            return View();
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(AboutUsPage aboutUsPage,IFormFile img,List<AboutUsPageDictionary> Dictionary)
        {
           
                if (img != null && ImageIsValid(img))
                {
                    aboutUsPage.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\about\\", img);
                }
                _context.Add(aboutUsPage);
                await _context.SaveChangesAsync();
                var saved = _context.aboutUsPages.OrderByDescending(x => x.Id).First();
                foreach (var item in Dictionary)
                {
                    item.AboutUspageId = saved.Id;
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

            var aboutUsPage = await _context.aboutUsPages.FindAsync(id);
            if (aboutUsPage == null)
            {
                return NotFound();
            }
            return View(aboutUsPage);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,AboutUsPage aboutUsPage,IFormFile img,List<AboutUsPageDictionary> Dictionary)
        {
            if (id != aboutUsPage.Id)
            {
                return NotFound();
            }

                try
                {
                    if (img != null && ImageIsValid(img))
                    {
                        if (aboutUsPage.Image != null)
                        {
                            DeleteImage(aboutUsPage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/about/");
                        }
                        aboutUsPage.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\about\\", img);
                    }
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                    _context.Update(aboutUsPage);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AboutUsPageExists(aboutUsPage.Id))
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

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var aboutUsPage = await _context.aboutUsPages.FindAsync(id);
            if (aboutUsPage.Image != null)
            {
                DeleteImage(aboutUsPage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/about/");
            }
            _context.aboutUsPages.Remove(aboutUsPage);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AboutUsPageExists(int id)
        {
            return _context.aboutUsPages.Any(e => e.Id == id);
        }
    }
}
