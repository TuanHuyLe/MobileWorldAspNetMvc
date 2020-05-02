using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models
{
    [Serializable]
    public class CartItem
    {
        public Catalog catalog { get; set; }
        public int quantity { get; set; }
    }
}
