using Model.Dao;
using Model.EF;
using Model.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace MobileWorld.Controllers
{
    public class HomeShopController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult Slide()
        {
            List<Catalog> model = new CatalogUserDao().GetCatalogs(1, 4);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult CatalogNewest()
        {
            List<Catalog> model = new CatalogUserDao().GetCatalogs(1, 9);
            return PartialView(model);
        }

        [HttpGet]
        public JsonResult loadData(string brand, int page = 1, int pageSize = 9, int typeid = 1, decimal minP = -1, decimal maxP = -1)
        {
            var dao = new CatalogUserDao();
            var model = dao.loadData(brand, typeid, minP, maxP).ToList();
            var totalRow = model.Count();
            var mydata = model.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            return Json(new
            {
                data = mydata,
                status = true,
                total = totalRow,
                soluong = totalRow - page * pageSize,
                loai = typeid == 1 ? "điện thoại" : "laptop"
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Catalog(int typeid = 1, decimal minP = -1, decimal maxP = -1)
        {
            ViewBag.TypeName = typeid == 1 ? "Điện thoại" : "Laptop";
            return View();
        }

    }
}