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

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Chưa nhập email")]
        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

    }
}