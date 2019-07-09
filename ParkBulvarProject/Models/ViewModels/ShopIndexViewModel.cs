﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ParkBulvarProject.Models.Entities;

namespace ParkBulvarProject.Models.ViewModels
{
    public class ShopIndexViewModel
    {
        public IOrderedQueryable<ShopCategory> categories { get; internal set; }
        public List<Shop> shops { get; internal set; }
    }
}
