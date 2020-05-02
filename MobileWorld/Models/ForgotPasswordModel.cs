using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MobileWorld.Models
{
    public class ForgotPasswordModel
    {
        [Display(Name = "Tên tài khoản")]
        [Required(ErrorMessage = "Chưa nhập tên tài khoản")]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Tên tài khoản phải trên 5 kí tự")]
        public string UserName { get; set; }

        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Chưa nhập số điện thoại")]
        [StringLength(15)]
        [DataType(DataType.PhoneNumber)]
        public string PhoneNumber { get; set; }

        [Display(Name = "Mật khẩu mới")]
        [Required(ErrorMessage = "Chưa nhập mật khẩu mới")]
        [DataType(DataType.Password)]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Mật khẩu phải trên 5 kí tự")]
        public string NewPassword { get; set; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Required(ErrorMessage = "Chưa nhập mật khẩu xác nhận")]
        [Compare("NewPassword", ErrorMessage = "Mật khẩu không trùng khớp")]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Mật khẩu phải trên 5 kí tự")]
        [DataType(DataType.Password)]
        public string RePassword { get; set; }
    }
}