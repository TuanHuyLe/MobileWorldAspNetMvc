
using System.ComponentModel.DataAnnotations;

namespace Model.DTO
{
    public class MobileDTO : CatalogDTO
    {
        [Display(Name = "Camera sau")]
        public string backcamera { get; set; }

        [Display(Name = "Camera trước")]
        public string frontcamera { get; set; }

        [Display(Name = "Bộ nhớ trong")]
        public string internalmemory { get; set; }

        [Display(Name = "Thẻ nhớ")]
        public string memorystick { get; set; }

        [Display(Name = "Thẻ SIM")]
        public string sim { get; set; }

        [Display(Name = "Dung lượng pin")]
        public string batery { get; set; }
    }
}
