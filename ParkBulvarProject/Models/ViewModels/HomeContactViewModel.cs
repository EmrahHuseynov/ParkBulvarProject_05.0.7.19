using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ParkBulvarProject.Models.Entities.Tables;

namespace ParkBulvarProject.Models.ViewModels
{
    public class HomeContactViewModel
    {
        public GeneralInfo info { get; internal set; }
        public List<SocialLink> sociallinks { get; internal set; }
    }
}
