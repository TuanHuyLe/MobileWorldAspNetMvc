﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MobileWorld.areas.Admin.Models.Util
{
    public static class DateOnYear
    {
        public static string GetDate(DateTimeOffset date)
        {
            return date.Day.ToString() + "/" + date.Month.ToString() + "/" + date.Year.ToString();
        }
    }
}
