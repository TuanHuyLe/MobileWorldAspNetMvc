using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DTO
{
    public class LoginFbDTO
    {
        public int id { get; set; }

        [Required(ErrorMessage = "Chưa nhập tên tài khoản")]
        [StringLength(255)]
        public string username { get; set; }

        [Required(ErrorMessage = "Chưa nhập mật khẩu")]
        [StringLength(255)]
        [DataType(DataType.Password)]
        public string password { get; set; }

        [StringLength(255)]
        [Required(ErrorMessage = "Chưa nhập họ và tên")]
        public string fullname { get; set; }

        public bool status { get; set; }

        [StringLength(15)]
        public string phonenumber { get; set; }

        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        public string email { get; set; }

        [StringLength(150)]
        public string address { get; set; }

        [StringLength(255)]
        public string createdby { get; set; }

        [StringLength(255)]
        public string modifiedby { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int gender { get; set; }

        [StringLength(255)]
        public string avatar { get; set; }
    }
}
