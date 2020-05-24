using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Model.DTO
{
    public class BillDTO
    {
        public int id { get; set; }

        [Required(ErrorMessage = "Chưa nhập họ tên")]
        [Display(Name = "Họ và tên")]
        public string username { get; set; }

        [Required(ErrorMessage = "Chưa nhập địa chỉ nhận hàng")]
        [Display(Name = "Địa chỉ nhận hàng")]
        public string shiptoaddress { get; set; }

        [Display(Name = "Chú thích mua hàng")]
        public string notebuy { get; set; }

        [Required(ErrorMessage = "Chưa nhập số điện thoại")]
        public string phone { get; set; }

        [DataType(DataType.EmailAddress)]
        [Required(ErrorMessage = "Chưa nhập email")]
        public string email { get; set; }
    }
}
