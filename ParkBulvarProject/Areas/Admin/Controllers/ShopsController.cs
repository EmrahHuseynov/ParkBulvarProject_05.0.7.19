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

    public class ShopsController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public ShopsController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }


        // GET: Admin/Shops
        public async Task<IActionResult> Index()
        {
            var parkBulvarContext = _context.shops.OrderBy(x=>x.Queue);
            return View(await parkBulvarContext.ToListAsync());
        }

       
        public IActionResult Create()
        {
            
            return View();
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Shop shop,IFormFile img,IFormFile logo,List<ShopDictionary> Dictionary,List<int> Cats,List<int> SubCats)
        {
            if (img != null)
            {
                if (img.ContentType.ToLower().Contains("svg"))
                {
                    shop.Image = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", img);
                }
                else
                {
                    if (ImageIsValid(img))
                    {
                        shop.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", img);
                    }
                }
            }
            if (logo != null)
            {
                if (logo.ContentType.ToLower().Contains("svg"))
                {
                    shop.Logo = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", logo);
                }
                else
                {
                    if (ImageIsValid(logo))
                    {
                        shop.Logo = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", logo);
                    }
                }
            }
           
            _context.Add(shop);
            await _context.SaveChangesAsync();
            var saved = _context.shops.OrderByDescending(x => x.Id).FirstOrDefault();
            foreach (var item in Dictionary)
            {
                item.ShopId = saved.Id;
                _context.Add(item);
            }
            foreach (var item in Cats)
            {
                if (_context.shopCategories.FirstOrDefault(x => x.Id == item) != null)
                {
                    _context.ShopToCategories.Add(new ShopToCategories
                    {
                        ShopId = saved.Id,
                        ShopCategoryId = item
                    });

                }
             
            }
            foreach (var item in SubCats)
            {
                if (_context.subShopCategories.FirstOrDefault(x => x.Id == item) != null)
                {
                    _context.ShopToSubCategories.Add(new ShopToSubCategories
                    {
                        ShopId = saved.Id,
                        SubShopCategoryId = item
                    });
                }
               
            }
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        // GET: Admin/Shops/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var shop = await _context.shops.FindAsync(id);
            if (shop == null)
            {
                return NotFound();
            }
           
            return View(shop);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,Shop shop,IFormFile img,IFormFile logo,List<ShopDictionary> Dictionary,List<int> Cats,List<int> SubCats)
        {
            if (id != shop.Id)
            {
                return NotFound();
            }
                try
                {
                    if (img != null)
                    {
                    if (shop.Image != null)
                    {
                        DeleteImage(shop.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                    }
                    if (img.ContentType.ToLower().Contains("svg"))
                        {
                            shop.Image = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", img);
                        }
                        else
                        {
                            if (ImageIsValid(img))
                            {
                                shop.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", img);
                            }
                        }
                     
                    }
                    if (logo != null)
                    {
                    if (shop.Logo != null)
                    {
                        DeleteImage(shop.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
                    }
                    if (logo.ContentType.ToLower().Contains("svg"))
                        {
                            shop.Logo = SvgUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", logo);
                        }
                        else
                        {
                            if (ImageIsValid(logo))
                            {
                                shop.Logo = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\magazalar\\", logo);
                            }
                        }
                        
                    }
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                foreach (var item in Cats)
                {
                    if (_context.shopCategories.FirstOrDefault(x => x.Id == item) != null)
                    {
                        _context.ShopToCategories.Add(new ShopToCategories
                        {
                            ShopId = shop.Id,
                            ShopCategoryId = item
                        });

                    }

                }
                foreach (var item in SubCats)
                {
                    if (_context.subShopCategories.FirstOrDefault(x => x.Id == item) != null)
                    {
                        _context.ShopToSubCategories.Add(new ShopToSubCategories
                        {
                            ShopId = shop.Id,
                            SubShopCategoryId = item
                        });
                    }

                }
                _context.Update(shop);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ShopExists(shop.Id))
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
            var shop = await _context.shops.FindAsync(id);
            if (shop.Image != null)
            {
                DeleteImage(shop.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
            }
            if (shop.Logo != null)
            {
                DeleteImage(shop.Logo, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/magazalar/");
            }
            _context.shops.Remove(shop);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ShopExists(int id)
        {
            return _context.shops.Any(e => e.Id == id);
        }
    }
}
