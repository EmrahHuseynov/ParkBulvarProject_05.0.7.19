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

    public class MetaTagsController : Controller
    {
        private readonly ParkBulvarContext _context;

        public MetaTagsController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/MetaTags
        public async Task<IActionResult> Index()
        {
            return View(await _context.metaTags.ToListAsync());
        }

       
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/MetaTags/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( MetaTags metaTags)
        {
            if (ModelState.IsValid)
            {
                _context.Add(metaTags);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(metaTags);
        }

        // GET: Admin/MetaTags/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var metaTags = await _context.metaTags.FindAsync(id);
            if (metaTags == null)
            {
                return NotFound();
            }
            return View(metaTags);
        }

        // POST: Admin/MetaTags/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,MetaTags metaTags)
        {
            if (id != metaTags.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(metaTags);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MetaTagsExists(metaTags.Id))
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
            return View(metaTags);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var metaTags = await _context.metaTags.FindAsync(id);
            _context.metaTags.Remove(metaTags);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MetaTagsExists(int id)
        {
            return _context.metaTags.Any(e => e.Id == id);
        }
    }
}
