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

    public class SeoDescriptionsController : Controller
    {
        private readonly ParkBulvarContext _context;

        public SeoDescriptionsController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/SeoDescriptions
        public async Task<IActionResult> Index()
        {
            return View(await _context.seoDescriptions.ToListAsync());
        }


        // GET: Admin/SeoDescriptions/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/SeoDescriptions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SeoDescription seoDescription)
        {
            if (ModelState.IsValid)
            {
                _context.Add(seoDescription);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(seoDescription);
        }

        // GET: Admin/SeoDescriptions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var seoDescription = await _context.seoDescriptions.FindAsync(id);
            if (seoDescription == null)
            {
                return NotFound();
            }
            return View(seoDescription);
        }

        // POST: Admin/SeoDescriptions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, SeoDescription seoDescription)
        {
            if (id != seoDescription.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(seoDescription);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SeoDescriptionExists(seoDescription.Id))
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
            return View(seoDescription);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var seoDescription = await _context.seoDescriptions.FindAsync(id);
            _context.seoDescriptions.Remove(seoDescription);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SeoDescriptionExists(int id)
        {
            return _context.seoDescriptions.Any(e => e.Id == id);
        }
    }
}
