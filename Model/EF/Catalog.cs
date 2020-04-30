namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Catalog
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Catalog()
        {
            Baskets = new HashSet<Basket>();
            Specifications = new HashSet<Specification>();
            SpecificationsLaptops = new HashSet<SpecificationsLaptop>();
            SpecificationsMobiles = new HashSet<SpecificationsMobile>();
        }

        [Key]
        public int id { get; set; }

        [StringLength(255)]
        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Chưa nhập tên sản phẩm")]
        public string name { get; set; }

        [StringLength(255)]
        [Display(Name = "Ảnh")]
        [Required(ErrorMessage = "Chưa nhập URL ảnh")]
        public string pictureuri { get; set; }

        [Display(Name = "Giá")]
        [DataType(DataType.Currency)]
        [Required(ErrorMessage = "Chưa nhập giá sản phẩm")]
        public decimal price { get; set; }

        [Display(Name = "Mô tả")]
        [Required(ErrorMessage = "Chưa nhập mô tả sản phẩm")]
        public string description { get; set; }

        [Display(Name = "Nội dung")]
        [Required(ErrorMessage = "Chưa nhập nội dung")]
        public string content { get; set; }

        [Display(Name = "Ngày nhập hàng")]
        public DateTimeOffset createdAt { get; set; }

        [Display(Name = "Ngày sửa")]
        public DateTimeOffset? updatedAt { get; set; }

        [Display(Name = "Loại")]
        public int catalogtypeid { get; set; }

        [Display(Name = "Thương hiệu")]
        public int catalogbrandid { get; set; }

        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Chưa nhập số lượng sản phẩm")]
        public int quantity { get; set; }

        [StringLength(50)]
        public string metatitle { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Basket> Baskets { get; set; }

        public virtual CatalogBrand CatalogBrand { get; set; }

        public virtual CatalogType CatalogType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Specification> Specifications { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SpecificationsLaptop> SpecificationsLaptops { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SpecificationsMobile> SpecificationsMobiles { get; set; }
    }
}
