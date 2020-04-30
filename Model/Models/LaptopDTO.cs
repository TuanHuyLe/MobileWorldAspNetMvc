using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Models
{
    public class LaptopDTO : CatalogDTO
    {
        [Display(Name = "Card màn hình")]
        public string cardscreen { get; set; }

        [Display(Name = "Cổng kết nối")]
        public string connector { get; set; }

        [Display(Name = "Ổ cứng")]
        public string harddrive { get; set; }

        [Display(Name = "Thiết kế")]
        public string design { get; set; }

        [Display(Name = "Kích thước")]
        public string size { get; set; }

        [Display(Name = "Thời điểm ra mắt")]
        public string release { get; set; }
    }
}
