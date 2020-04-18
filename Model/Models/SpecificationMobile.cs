using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models
{
    public class SpecificationMobile
    {
        public int id { get; set; }
        public Specification Specification { get; set; }
        public SpecificationsMobile SpecificationsMobile { get; set; }
    }
}
