using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class SubShopCategoriesController : Controller
    {
        private readonly ParkBulvarContext _context;

        public SubShopCategoriesController(ParkBulvarContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var parkBulvarContext = _context.subShopCategories.OrderBy(x=>x.Queue).Include(s => s.ShopCategory);
            return View(await parkBulvarContext.ToListAsync());
        }

       
        public IActionResult Create()
        {
            
            return View();
        }

     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SubShopCategory subShopCategory,List<SubShopCategoryDictionary> Dictionary)
        {
           
                
                _context.Add(subShopCategory);
                 await _context.SaveChangesAsync();
                var saved = _context.subShopCategories.OrderByDescending(x => x.Id).First();
                foreach (var item in Dictionary)
                {
                    item.SubShopCategoryId = saved.Id;
                    _context.Add(item);
                }
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
        }

        // GET: Admin/SubShopCategories/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var subShopCategory = await _context.subShopCategories.FindAsync(id);
            if (subShopCategory == null)
            {
                return NotFound();
            }
           
            return View(subShopCategory);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, SubShopCategory subShopCategory,List<SubShopCategoryDictionary> Dictionary)
        {
            if (id != subShopCategory.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                    _context.Update(subShopCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SubShopCategoryExists(subShopCategory.Id))
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
            return View(subShopCategory);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var subShopCategory = await _context.subShopCategories.FindAsync(id);
            _context.subShopCategories.Remove(subShopCategory);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SubShopCategoryExists(int id)
        {
            return _context.subShopCategories.Any(e => e.Id == id);
        }
    }
}
