using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MobileWorld.areas.Admin.Models
{
    public class RegisterModel : AbstractModel
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Chưa nhập tên tài khoản")]
        [Display(Name = "Tên tài khoản")]
        public string UserName { get; set; }

        [Display(Name = "Mật khẩu")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Chưa nhập mật khẩu")]
        public string Password { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Chưa nhập mật khẩu xác nhận")]
        public string RePassword { get; set; }

        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Chưa nhập đầy đủ họ tên")]
        public string Fullname { get; set; }

        [Required(ErrorMessage = "Hãy chọn giới tính")]
        [Display(Name ="Giới tính")]
        public int gender { get; set; }

        [Display(Name = "Số điện thoại")]
        [DataType(DataType.PhoneNumber)]
        [Required(ErrorMessage = "Chưa nhập số điện thoại")]
        public string PhoneNumber { get; set; }

        [Display(Name = "Email")]
        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Chưa nhập email")]
        public string Email { get; set; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Chưa nhập địa chỉ")]
        public string Address { get; set; }
    }
}