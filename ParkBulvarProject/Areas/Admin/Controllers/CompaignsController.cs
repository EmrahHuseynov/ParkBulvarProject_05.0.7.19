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

    public class CompaignsController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ParkBulvarContext _context;
        public CompaignsController(ParkBulvarContext context, IHostingEnvironment hostingEnvironment)
        {
            _context = context;
            _hostingEnvironment = hostingEnvironment;

        }

        public async Task<IActionResult> Index()
        {
            var parkBulvarContext = _context.compaigns.OrderBy(x=>x.Queue).Include(c => c.Shop);
            return View(await parkBulvarContext.ToListAsync());
        }


        public IActionResult Create()
        {
           
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Compaign compaign,IFormFile img,List<CompaignDictionary> Dictionary)
        {
           
                if (img != null)
                {
                    if (ImageIsValid(img))
                    {
                        compaign.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\eventslider\\", img);
                    }
                }

                _context.Add(compaign);
                await _context.SaveChangesAsync();
                var added = _context.compaigns.OrderByDescending(x => x.Id).First();
                foreach (var item in Dictionary)
                {
                    item.CompaignId = added.Id;
                    _context.Add(item);
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

            var compaign = await _context.compaigns.FindAsync(id);
            if (compaign == null)
            {
                return NotFound();
            }
          
            return View(compaign);
        }

      
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Compaign compaign,IFormFile img,List<CompaignDictionary> Dictionary)
        {
            if (id != compaign.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    if (img != null)
                    {
                        if (ImageIsValid(img))
                        {
                            if (compaign.Image != null)
                            {
                                DeleteImage(compaign.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/eventslider/");
                            }
                            compaign.Image = ImageUpload(_hostingEnvironment.WebRootPath + "\\assets\\img\\eventslider\\", img);
                        }
                    }
                    foreach (var item in Dictionary)
                    {
                        _context.Update(item);
                    }
                    _context.Update(compaign);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CompaignExists(compaign.Id))
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
          
            return View(compaign);
        }

        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var compaign = await _context.compaigns.FindAsync(id);
            if (compaign.Image != null)
            {
                DeleteImage(compaign.Image, _hostingEnvironment.ContentRootPath + "/wwwroot/assets/img/eventslider/");
            }
            _context.compaigns.Remove(compaign);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CompaignExists(int id)
        {
            return _context.compaigns.Any(e => e.Id == id);
        }
    }
}
