
using System.ComponentModel.DataAnnotations;

namespace Model.DTO
{
    public abstract class CatalogDTO
    {
        public int id { get; set; }

        [Display(Name = "Tên")]
        public string name { get; set; }

        [Display(Name = "Hình ảnhh")]
        public string pictureuri { get; set; }

        [Display(Name = "Giá")]
        public decimal price { get; set; }

        [Display(Name = "Mô tả")]
        public string description { get; set; }

        [Display(Name = "Nội dung")]
        public string content { get; set; }

        [Display(Name = "Số lượng")]
        public int quantity { get; set; }

        [Display(Name = "Thương hiệu")]
        public string brand { get; set; }

        [Display(Name = "Loại")]
        public string type { get; set; }

        [Display(Name = "CPU")]
        public string cpu { get; set; }

        [Display(Name = "RAM")]
        public string ram { get; set; }

        [Display(Name = "Màn hình")]
        public string screen { get; set; }

        [Display(Name = "Hệ điều hành")]
        public string os { get; set; }
        public int catalogtypeid { get; set; }
        public int catalogbrandid { get; set; }
    }
}
