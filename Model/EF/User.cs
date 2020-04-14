namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            UserRoles = new HashSet<UserRole>();
        }

        public int id { get; set; }

        [Required(ErrorMessage = "Chưa nhập tài khoản")]
        [Display(Name = "Tài khoản")]
        [StringLength(255)]
        public string username { get; set; }

        [Required(ErrorMessage = "Chưa nhập mật khẩu")]
        [Display(Name = "Mật khẩu")]
        [DataType(DataType.Password)]
        [StringLength(255)]
        public string password { get; set; }

        [Required(ErrorMessage = "Chưa nhập họ tên")]
        [Display(Name = "Họ và tên")]
        [StringLength(255)]
        public string fullname { get; set; }

        [Display(Name =  "Trạng thái")]
        public bool status { get; set; }

        [Required(ErrorMessage = "Chưa nhập số điện thoại")]
        [Display(Name = "Số điện thoại")]
        [StringLength(15)]
        [DataType(DataType.PhoneNumber)]
        public string phonenumber { get; set; }

        [Required(ErrorMessage = "Chưa nhập email")]
        [Display(Name = "Email")]
        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        public string email { get; set; }

        [Required(ErrorMessage = "Chưa nhập địa chỉ")]
        [Display(Name = "Địa chỉ")]
        [StringLength(150)]
        public string address { get; set; }

        [Display(Name = "Người khởi tạo")]
        [StringLength(255)]
        public string createdby { get; set; }

        [Display(Name = "Người thay đổi")]
        [StringLength(255)]
        public string modifiedby { get; set; }

        [Display(Name = "Ngày đăng ký")]
        public DateTimeOffset? createdAt { get; set; }

        [Display(Name = "Ngày cập nhật")]
        public DateTimeOffset? updatedAt { get; set; }

        [Display(Name = "Giới tính")]
        public int gender { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserRole> UserRoles { get; set; }
    }
}
