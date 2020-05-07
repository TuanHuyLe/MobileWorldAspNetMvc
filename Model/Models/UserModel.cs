using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Model.Models
{
    public class UserModel
    {
        public int id { get; set; }
        [Display(Name = "Tài khoản")]
        public string username { get; set; }
        [Display(Name = "Tên người dùng")]
        public string fullname { get; set; }
        [Display(Name = "Số điện thoại")]
        [StringLength(15)]
        [DataType(DataType.PhoneNumber)]
        public string phonenumber { get; set; }
        [DataType(DataType.EmailAddress)]
        [StringLength(50)]
        [Display(Name = "Email")]
        public string email { get; set; }
        [Display(Name = "Địa chỉ")]
        [StringLength(150)]
        public string address { get; set; }
        [Display(Name ="Thay đổi quyền")]
        public int role { get; set; }
        [Display(Name = "Thay đổi giới tính")]
        public int gender { get; set; }
        [Display(Name = "Ngày đăng ký")]
        public DateTimeOffset? createdAt { get; set; }
    }
}
