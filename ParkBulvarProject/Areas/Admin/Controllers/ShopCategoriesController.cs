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

    public class ShopCategoriesController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public ShopCategoriesController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }


        // GET: Admin/ShopCategories
        public async Task<IActionResult> Index()
        {
            return View(await _context.shopCategories.OrderBy(x=>x.Queue).ToListAsync());
        }

    

        public IActionResult Create()
        {
            return View();
        }

    
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ShopCategory shopCategory,IFormFile img,IFormFile logo)
        {
            if (ModelState.IsValid)
            {
                if (img != null)
                {
                    if (ImageIsValid(img))
                    {
                        shopCategory.CoverImage = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", img);
                    }
                }
                if (logo != null)
                {
                    if (!logo.ContentType.ToLower().Contains("svg"))
                    {
                        shopCategory.Logo = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", logo);
                    }
                    else
                    {
                        shopCategory.Logo = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", logo);
                    }
                }

                _context.Add(shopCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(shopCategory);
        }

        // GET: Admin/ShopCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var shopCategory = await _context.shopCategories.FindAsync(id);
            if (shopCategory == null)
            {
                return NotFound();
            }
            return View(shopCategory);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, ShopCategory shopCategory,IFormFile img,IFormFile logo,List<ShopCategoryDictionary> ShopCategoryDictionaries)
        {
            if (id != shopCategory.Id)
            {
                return NotFound();
            }

           
                try
                {

                    if (img != null)
                    {
                        if (ImageIsValid(img))
                        {
                            if (shopCategory.CoverImage != null)
                            {
                                DeleteImage(shopCategory.CoverImage, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/iconslider/");
                            }
                            shopCategory.CoverImage = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", img);
                        }
                    }
                    if (logo != null)
                    {
                        if (shopCategory.Logo != null)
                        {
                            DeleteImage(shopCategory.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/iconslider/");
                        }
                        if (!logo.ContentType.ToLower().Contains("svg"))
                        {
                            shopCategory.Logo = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", logo);
                        }
                        else
                        {
                            shopCategory.Logo = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\iconSlider\\", logo);
                        }
                    }
                    foreach (var item in ShopCategoryDictionaries)
                    {
                        _context.Update(item);
                    }
                var cat = _context.shopCategories.Find(shopCategory.Id);
                cat.Logo = shopCategory.Logo;
                cat.CoverImage = shopCategory.CoverImage;
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ShopCategoryExists(shopCategory.Id))
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
            var shopCategory = await _context.shopCategories.FindAsync(id);
            if (shopCategory.Logo != null)
            {
                DeleteImage(shopCategory.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/iconslider/");
            }
            if (shopCategory.CoverImage != null)
            {
                DeleteImage(shopCategory.CoverImage, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/iconslider/");
            }
            foreach (var rl in _context.ShopToCategories.Where(x => x.ShopCategoryId == id))
            {
                if (rl.Shop.Image != null)
                {
                    DeleteImage(rl.Shop.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                }
                if (rl.Shop.Logo != null)
                {
                    DeleteImage(rl.Shop.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                }
                _context.Remove(rl.Shop);
            }
            foreach (var item in _context.subShopCategories.Where(x => x.ShopCategoryId == id))
            {
                //foreach (var shop in _context.shops.Where(x => x.SubShopCategoryId == item.Id || x.ShopCategoryId == id))
                //{
                //    if (shop.Image != null)
                //    {
                //        DeleteImage(shop.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                //    }
                //    if (shop.Logo != null)
                //    {
                //        DeleteImage(shop.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                //    }
                //    _context.Remove(shop);
                //}
                //_context.Remove(item);
            }
            _context.shopCategories.Remove(shopCategory);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ShopCategoryExists(int id)
        {
            return _context.shopCategories.Any(e => e.Id == id);
        }
    }
}
