namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SpecificationsLaptop
    {
        public int id { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập card màn hình")]
        [Display(Name = "Card màn hình")]
        public string cardscreen { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập cổng kết nối")]
        [Display(Name = "Cổng kết nối")]
        public string connector { get; set; }

        [StringLength(100)]
        [Display(Name = "Ổ cứng")]
        [Required(ErrorMessage = "Chưa nhập ổ cứng")]
        public string harddrive { get; set; }

        [StringLength(100)]
        [Display(Name = "Thiết kế")]
        [Required(ErrorMessage = "Chưa nhập thiết kế")]
        public string design { get; set; }

        [StringLength(100)]
        [Display(Name = "Kích thước")]
        [Required(ErrorMessage = "Chưa nhập kích thước")]
        public string size { get; set; }

        [StringLength(100)]
        [Display(Name = "Thời điểm ra mắt")]
        [Required(ErrorMessage = "Chưa nhập thời điểm ra mắt")]
        public string release { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int catalogid { get; set; }

        public virtual Catalog Catalog { get; set; }
    }
}
