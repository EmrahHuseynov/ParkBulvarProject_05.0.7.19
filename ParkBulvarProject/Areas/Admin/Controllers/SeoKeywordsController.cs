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

    public class SeoKeywordsController : Controller
    {
        private readonly ParkBulvarContext _context;

        public SeoKeywordsController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/SeoKeywords
        public async Task<IActionResult> Index()
        {
            return View(await _context.seoKeyWords.ToListAsync());
        }


        // GET: Admin/SeoKeywords/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/SeoKeywords/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SeoKeyword seoKeyword)
        {
            if (ModelState.IsValid)
            {
                _context.Add(seoKeyword);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(seoKeyword);
        }

        // GET: Admin/SeoKeywords/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var seoKeyword = await _context.seoKeyWords.FindAsync(id);
            if (seoKeyword == null)
            {
                return NotFound();
            }
            return View(seoKeyword);
        }

        // POST: Admin/SeoKeywords/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, SeoKeyword seoKeyword)
        {
            if (id != seoKeyword.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(seoKeyword);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SeoKeywordExists(seoKeyword.Id))
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
            return View(seoKeyword);
        }


        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var seoKeyword = await _context.seoKeyWords.FindAsync(id);
            _context.seoKeyWords.Remove(seoKeyword);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SeoKeywordExists(int id)
        {
            return _context.seoKeyWords.Any(e => e.Id == id);
        }
    }
}
