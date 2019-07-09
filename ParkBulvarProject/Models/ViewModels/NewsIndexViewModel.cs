using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Models.ViewModels
{
    public class NewsIndexViewModel
    {
        public List<News> news { get; internal set; }
        public NewsPage pageconfig { get; internal set; }
    }
}
