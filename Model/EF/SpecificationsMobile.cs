namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SpecificationsMobile
    {
        public int id { get; set; }

        [StringLength(100)]
        [Display(Name = "Camera sau")]
        [Required(ErrorMessage = "Chưa nhập camera sau")]
        public string backcamera { get; set; }

        [StringLength(100)]
        [Display(Name = "Camera trước")]
        [Required(ErrorMessage = "Chưa nhập camera trước")]
        public string frontcamera { get; set; }

        [StringLength(100)]
        [Display(Name = "Bộ nhớ trong")]
        [Required(ErrorMessage = "Chưa nhập bộ nhớ trong")]
        public string internalmemory { get; set; }

        [StringLength(100)]
        [Display(Name = "Thẻ nhớ")]
        [Required(ErrorMessage = "Chưa nhập thẻ nhớ")]
        public string memorystick { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập sim")]
        [Display(Name = "Sim")]
        public string sim { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập dung lượng pin")]
        [Display(Name = "Dung lượng pin")]
        public string batery { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int catalogid { get; set; }

        public virtual Catalog Catalog { get; set; }
    }
}
