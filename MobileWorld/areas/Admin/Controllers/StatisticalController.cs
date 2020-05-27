using MobileWorld.areas.Admin.Models.Dao;
using System.Web.Mvc;

namespace MobileWorld.areas.Admin.Controllers
{
    public class StatisticalController : Controller
    {
        // GET: Admin/Statistical
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult GetAllCatalog(string seach, int brandid, int typeid, int month, int page, int pageSize)
        {
            var result = new StatisticalDao().GetAllCatalog(seach, brandid, typeid, month, page, pageSize);
            return Json(new
            {
                totalMoney = result.Total,
                totalRow = result.TotalRecord,
                data = result.Items
            }, JsonRequestBehavior.AllowGet);
        }
    }
}