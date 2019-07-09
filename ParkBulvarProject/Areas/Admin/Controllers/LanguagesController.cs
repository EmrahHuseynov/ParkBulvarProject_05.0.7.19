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
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class LanguagesController : Controller
    {
        private readonly ParkBulvarContext _context;

        public LanguagesController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/Languages
        public async Task<IActionResult> Index()
        {
            return View(await _context.languages.OrderBy(x=>x.Queue).ToListAsync());
        }

      

        // GET: Admin/Languages/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Language language)
        {
            _context.Add(language);
            await _context.SaveChangesAsync();
            var savedlang = _context.languages.FirstOrDefault(x => x.Code == language.Code);
            try
            {

                foreach (var item in _context.aboutUsPages)
                {
                    _context.aboutUsPageDictionaries.Add(new AboutUsPageDictionary { LanguageId = savedlang.Id, AboutUspageId = item.Id });
                }
                foreach (var item in _context.compaigns)
                {
                    _context.compaignDictionaries.Add(new CompaignDictionary { LanguageId = savedlang.Id, CompaignId = item.Id });
                }
                foreach (var item in _context.news)
                {
                    _context.newsDictionaries.Add(new NewsDictionary { LanguageId = savedlang.Id, NewsId = item.Id });
                }
                foreach (var item in _context.newsPages)
                {
                    _context.newsPageDictionaries.Add(new NewsPageDictionary { LanguageId = savedlang.Id, NewsPageId = item.Id });
                }
                foreach (var item in _context.shopCategories)
                {
                    _context.shopCategoryDictionaries.Add(new ShopCategoryDictionary { LanguageId = savedlang.Id, ShopCategoryId = item.Id });
                }
                foreach (var item in _context.shops)
                {
                    _context.shopDictionaries.Add(new ShopDictionary { LanguageId = savedlang.Id, ShopId = item.Id });
                }
                foreach (var item in _context.subShopCategories)
                {
                    _context.subShopCategoryDictionaries.Add(new SubShopCategoryDictionary { LanguageId = savedlang.Id, SubShopCategoryId = item.Id });
                }
            }
            catch (Exception)
            {

                throw;
            }


            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        // GET: Admin/Languages/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var language = await _context.languages.FindAsync(id);
            if (language == null)
            {
                return NotFound();
            }
            return View(language);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,Language language)
        {
            if (id != language.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(language);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!LanguageExists(language.Id))
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
            return View(language);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var language = await _context.languages.FindAsync(id);
            _context.languages.Remove(language);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool LanguageExists(int id)
        {
            return _context.languages.Any(e => e.Id == id);
        }
    }
}
