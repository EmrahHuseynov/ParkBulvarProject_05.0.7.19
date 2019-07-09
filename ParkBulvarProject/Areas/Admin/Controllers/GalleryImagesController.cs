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

    public class GalleryImagesController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public GalleryImagesController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }



        public async Task<IActionResult> Index()
        {
            return View(await _context.galleryImages.OrderBy(x => x.Queue).ToListAsync());
        }


        public IActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(GalleryImage galleryImage, List<IFormFile> img)
        {
           
                if (img != null &&img.Count>0 &&img[0] != null)
                {
                    foreach (var item in img)
                    {
                        if (ImageIsValid(item))
                        {
                            _context.galleryImages.Add(new GalleryImage
                            {
                                Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\galleryslider\\", item)
                            });
                        }
                    }

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

            var galleryImage = await _context.galleryImages.FindAsync(id);
            if (galleryImage == null)
            {
                return NotFound();
            }
            return View(galleryImage);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,  GalleryImage galleryImage,IFormFile img)
        {
            if (id != galleryImage.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (img != null && ImageIsValid(img))
                    {
                        if (galleryImage.Image != null)
                        {
                            DeleteImage(galleryImage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/galleryslider/");
                        }
                        galleryImage.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\galleryslider\\", img);
                    }

                    _context.Update(galleryImage);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GalleryImageExists(galleryImage.Id))
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
            return View(galleryImage);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var galleryImage = await _context.galleryImages.FindAsync(id);
            if (galleryImage.Image != null)
            {
                DeleteImage(galleryImage.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/galleryslider/");
            }
            _context.galleryImages.Remove(galleryImage);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GalleryImageExists(int id)
        {
            return _context.galleryImages.Any(e => e.Id == id);
        }
    }
}
