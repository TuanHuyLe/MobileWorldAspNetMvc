﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MobileWorld.areas.Admin.Models.DTO
{
    public class BillDTO
    {
        public int id { get; set; }
        public decimal price { get; set; }
        public int unit { get; set; }
        public string pictureuri { get; set; }
        public string name { get; set; }
        public int status { get; set; }
        public string receivername { get; set; }
        public string sendername { get; set; }
        public string shiptoaddress { get; set; }
        public string createdAt { get; set; }
    }
}
