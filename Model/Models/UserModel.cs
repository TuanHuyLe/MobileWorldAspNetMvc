using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Model.Models
{
    public class UserModel
    {
        public int id { get; set; }
        [Display(Name = "Tên người dùng")]
        public string fullname { get; set; }
        [Display(Name = "Số điện thoại")]
        public string phonenumber { get; set; }
        [Display(Name = "Email")]
        public string email { get; set; }
        [Display(Name = "Địa chỉ")]
        public string address { get; set; }
        [Display(Name ="Thay đổi quyền")]
        public int role { get; set; }
        [Display(Name = "Thay đổi giới tính")]
        public int gender { get; set; }

    }
}
