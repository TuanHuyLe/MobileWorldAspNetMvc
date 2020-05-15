namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class CatalogBrand
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CatalogBrand()
        {
            Catalogs = new HashSet<Catalog>();
        }

        public int id { get; set; }

        [StringLength(100)]
        [Display(Name = "Thương hiệu")]
        [Required(ErrorMessage ="Chưa nhập tên thương hiệu")]
        public string brand { get; set; }
        [Display(Name = "Ngày nhập")]
        public DateTimeOffset? createdAt { get; set; }
        [Display(Name = "Ngày cập nhật")]
        public DateTimeOffset? updatedAt { get; set; }

        [StringLength(100)]
        [Display(Name = "Logo")]
        [Required(ErrorMessage = "Chưa nhập logo")]
        public string pictureurl { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Catalog> Catalogs { get; set; }
    }
}
