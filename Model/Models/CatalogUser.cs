using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models
{
    public class CatalogUser
    {
        public int id { get; set; }
        public string name { get; set; }
        public string pictureuri { get; set; }
        public decimal price { get; set; }
        public string description { get; set; }
        public string content { get; set; }
        public int quantity { get; set; }
        public int brandid { get; set; }

    }
}
