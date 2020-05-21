using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DTO
{
    public class InfoCartDTO
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Chưa nhập họ tên")]
        public string fullname { get; set; }

        public string address { get; set; }
        [Required(ErrorMessage = "Chưa nhập đường")]
        public string shiptoroad { get; set; }
        [Required(ErrorMessage = "Chưa nhập căn hộ")]
        public string shiptoapartment { get; set; }
        [Required(ErrorMessage = "Chưa nhập email")]
        public string email { get; set; }
        [Required(ErrorMessage = "Chưa nhập số điện thoại")]
        public string phonenumber { get; set; }
        public string notebuy { get; set; }
        [Required(ErrorMessage = "Chưa nhập thành phố")]
        public string city { get; set; }
    }
}
