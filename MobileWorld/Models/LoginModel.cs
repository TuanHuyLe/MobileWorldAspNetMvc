
using System.ComponentModel.DataAnnotations;


namespace MobileWorld.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Chưa nhập tài khoản")]
        [Display(Name = "Tài khoản")]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Tên tài khoản phải trên 5 kí tự")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Chưa nhập mật khẩu")]
        [Display(Name = "Mật khẩu")]
        [DataType(DataType.Password)]
        [StringLength(255, MinimumLength = 5, ErrorMessage = "Mật khẩu phải trên 5 kí tự")]
        public string Password { get; set; }

        public bool RememberMe { get; set; }
    }
}