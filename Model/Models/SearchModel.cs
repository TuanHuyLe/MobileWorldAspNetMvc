using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models
{
    public class SearchModel
    {
        public int id { get; set; }
        public string name { get; set; }
        public string brand { get; set; }
        public string type { get; set; }
        public int brandid { get; set; }
        public int typeid { get; set; }
        public decimal price { get; set; }
        public string pictureuri { get; set; }
    }
}
