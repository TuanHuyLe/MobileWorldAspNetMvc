namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Specification
    {
        public int id { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập thông số CPU")]
        [Display(Name = "CPU")]
        public string cpu { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập thông số RAM")]
        [Display(Name = "RAM")]
        public string ram { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập thông số màn hình")]
        [Display(Name = "Màn hình")]
        public string screen { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập hệ điều hành")]
        [Display(Name = "Hệ điều hành")]
        public string os { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int catalogid { get; set; }

        public virtual Catalog Catalog { get; set; }
    }
}
