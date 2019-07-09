using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ParkBulvarProject.Models.DAL;
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class GeneralInfoesController : Controller
    {
        private readonly ParkBulvarContext _context;

        public GeneralInfoesController(ParkBulvarContext context)
        {
            _context = context;
        }

        // GET: Admin/GeneralInfoes
        public async Task<IActionResult> Index()
        {
            return View(await _context.generalInfos.ToListAsync());
        }

  

        // GET: Admin/GeneralInfoes/Create
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( GeneralInfo generalInfo)
        {
            if (ModelState.IsValid)
            {
                _context.Add(generalInfo);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(generalInfo);
        }

        // GET: Admin/GeneralInfoes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var generalInfo = await _context.generalInfos.FindAsync(id);
            if (generalInfo == null)
            {
                return NotFound();
            }
            return View(generalInfo);
        }

     
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Phone,WorkHours,HowToGo,Id")] GeneralInfo generalInfo)
        {
            if (id != generalInfo.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(generalInfo);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!GeneralInfoExists(generalInfo.Id))
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
            return View(generalInfo);
        }

       
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var generalInfo = await _context.generalInfos.FindAsync(id);
            _context.generalInfos.Remove(generalInfo);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool GeneralInfoExists(int id)
        {
            return _context.generalInfos.Any(e => e.Id == id);
        }
    }
}
