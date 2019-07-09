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

    public class FollowersController : Controller
    {
        private readonly ParkBulvarContext _context;

        public FollowersController(ParkBulvarContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.followers.ToListAsync());
        }

      

    
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var follower = await _context.followers.FindAsync(id);
            _context.followers.Remove(follower);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool FollowerExists(int id)
        {
            return _context.followers.Any(e => e.Id == id);
        }
    }
}
