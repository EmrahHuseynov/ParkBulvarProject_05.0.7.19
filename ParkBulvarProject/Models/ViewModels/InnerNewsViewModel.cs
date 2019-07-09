using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Models.ViewModels
{
    public class InnerNewsViewModel
    {
        public News news { get; internal set; }
        public List<News> othernews { get; internal set; }
    }
}
