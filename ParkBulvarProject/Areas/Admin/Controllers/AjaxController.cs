using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using ParkBulvarProject.Models.DAL;

namespace ParkBulvarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin")]

    public class AjaxController : Controller
    {
        private ParkBulvarContext _context { get; set; }
        private IConfiguration configuration;
        public AjaxController(IConfiguration _configuration,ParkBulvarContext context)
        {
            configuration = _configuration;
            _context = context;
        }

        public IActionResult ConfirmQueue(List<Order> order, string classname)
        {
            MySqlConnection conn = new MySqlConnection(configuration.GetConnectionString("Defaultconnection"));
            conn.Open();
            foreach (var item in order)
            {
                string query = "UPDATE " + classname + " SET Queue =" + item.Place + " WHERE id = " + item.Id + "";
                MySqlCommand comm = conn.CreateCommand();
                comm.CommandText = query;
                comm.ExecuteNonQuery();
            }
            conn.Close();
            return Json(new
            {
                status=200
            });
        }

        public IActionResult removecat(string type,int catid)
        {
            if (type == "cat")
            {
                var cat = _context.ShopToCategories.Find(catid);
                _context.Remove(cat);
            }
            else
            {
                var cat = _context.ShopToSubCategories.Find(catid);
                _context.Remove(cat);
            }
            _context.SaveChanges();
            return Json(new
            {
                status = 200
            });
        }

    }


    

    public class Order
    {
        public int Id { get; set; }
        public int Place { get; set; }
    }




}