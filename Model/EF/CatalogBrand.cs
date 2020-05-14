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
        [Required(ErrorMessage = "Chưa nhập thương hiệu")]
        public string brand { get; set; }

        [StringLength(100)]
        [Display(Name = "Logo")]
        [Required(ErrorMessage = "Chưa nhập logo")]
        public string pictureurl { get; set; }

        [Display(Name = "Ngày nhập")]
        public DateTimeOffset? createdAt { get; set; }

        [Display(Name = "Ngày sửa")]
        public DateTimeOffset? updatedAt { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Catalog> Catalogs { get; set; }
    }
}
