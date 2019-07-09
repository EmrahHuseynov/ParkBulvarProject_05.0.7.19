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
    public class AdminConfigsController : Controller
    {
        private readonly ParkBulvarContext _context;

        public AdminConfigsController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/AdminConfigs
        public async Task<IActionResult> Index()
        {
            return View(await _context.admnConfig.ToListAsync());
        }

        // GET: Admin/AdminConfigs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminConfigs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(AdminConfig adminConfig)
        {
            if (ModelState.IsValid)
            {
                _context.Add(adminConfig);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(adminConfig);
        }

        // GET: Admin/AdminConfigs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var adminConfig = await _context.admnConfig.FindAsync(id);
            if (adminConfig == null)
            {
                return NotFound();
            }
            return View(adminConfig);
        }

        // POST: Admin/AdminConfigs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,  AdminConfig adminConfig)
        {
            if (id != adminConfig.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(adminConfig);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AdminConfigExists(adminConfig.Id))
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
            return View(adminConfig);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var adminConfig = await _context.admnConfig.FindAsync(id);
            _context.admnConfig.Remove(adminConfig);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AdminConfigExists(int id)
        {
            return _context.admnConfig.Any(e => e.Id == id);
        }
    }
}
