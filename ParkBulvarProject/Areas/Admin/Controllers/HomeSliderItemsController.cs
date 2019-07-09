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
using ParkBulvarProject.Models.Entities;
using static ParkBulvarProject.Helper;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class HomeSliderItemsController : Controller
    {
        private readonly ParkBulvarContext _context;

        private readonly IHostingEnvironment _hostingEnvironment;
        public HomeSliderItemsController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;
        }


        // GET: Admin/HomeSliderItems
        public async Task<IActionResult> Index()
        {
            return View(await _context.homeSliderItems.OrderBy(x=>x.Queue).ToListAsync());
        }

    
        // GET: Admin/HomeSliderItems/Create
        public IActionResult Create()
        {
            return View();
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(HomeSliderItem homeSliderItem,List<IFormFile> img)
        {
            if (img != null && img[0] != null)
            {
                foreach (var item in img)
                {
                    if (!ImageIsValid(item))
                        return View(homeSliderItem);
                }
                foreach (var item in img)
                {
                    _context.homeSliderItems.Add(new HomeSliderItem
                    {
                        Link=homeSliderItem.Link,
                        Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\mainslider\\", item)
                    });
                }
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(homeSliderItem);
        }

        // GET: Admin/HomeSliderItems/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var homeSliderItem = await _context.homeSliderItems.FindAsync(id);
            if (homeSliderItem == null)
            {
                return NotFound();
            }
            return View(homeSliderItem);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, HomeSliderItem homeSliderItem,IFormFile img)
        {
            if (id != homeSliderItem.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (img != null)
                    {
                        if (!ImageIsValid(img))
                        {
                            return View(homeSliderItem);
                        }
                        else
                        {
                            if (homeSliderItem.Image != null)
                            {
                                DeleteImage(homeSliderItem.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/mainslider/");
                            }
                            homeSliderItem.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\mainslider\\", img);
                        }
                    }
                    _context.Update(homeSliderItem);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HomeSliderItemExists(homeSliderItem.Id))
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
            return View(homeSliderItem);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var homeSliderItem = await _context.homeSliderItems.FindAsync(id);
            if (homeSliderItem.Image != null)
            {
                DeleteImage(homeSliderItem.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/mainslider/");
            }
            _context.homeSliderItems.Remove(homeSliderItem);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HomeSliderItemExists(int id)
        {
            return _context.homeSliderItems.Any(e => e.Id == id);
        }
    }
}
