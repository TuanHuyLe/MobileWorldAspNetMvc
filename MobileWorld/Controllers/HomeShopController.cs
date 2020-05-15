using MobileWorld.common;
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
        public ActionResult SlideHeader()
        {
            List<Catalog> model = new CatalogUserDao().GetCatalogs(1, 4, null);
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult CatalogNewest()
        {
            List<Catalog> model = new CatalogUserDao().GetCatalogs(1, 9, null);
            return PartialView(model);
        }

        [HttpGet]
        public JsonResult loadData(string brand, int page = 1, int pageSize = 9, int typeid = 1, decimal minP = -1, decimal maxP = -1)
        {
            var dao = new CatalogUserDao();
            var model = dao.loadData(brand, typeid, minP, maxP).ToList();
            var totalRow = model.Count();
            var mydata = model.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            string loaisp;
            switch (typeid)
            {
                case 1:
                    loaisp = "điện thoại";
                    break;
                case 2:
                    loaisp = "laptop";
                    break;
                default:
                    loaisp = "sản phẩm";
                    break;
            }
            return Json(new
            {
                data = mydata,
                status = true,
                total = totalRow,
                soluong = totalRow - page * pageSize,
                loai = loaisp
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Catalog(int? typeid, string kwsearch)
        {
            if (!string.IsNullOrEmpty(kwsearch))
            {
                return View("ResultSearch", new CatalogUserDao().searchFor(kwsearch, 10));
            }
            switch (typeid)
            {
                case 1:
                    ViewBag.TypeName = "Điện thoại";
                    break;
                case 2:
                    ViewBag.TypeName = "Laptop";
                    break;
                default:
                    ViewBag.TypeName = "Tất cả sản phẩm";
                    break;
            }
            return View();
        }

        [ChildActionOnly]
        public ActionResult SlideBrand()
        {
            var brand = new CatalogUserDao().getAllCatalogBrand();
            return PartialView(brand);
        }

        [ChildActionOnly]
        public PartialViewResult CartHeader()
        {
            var cart = Session[CommonConstant.CART_SESSION];
            var list = new List<CartItem>();
            if (cart != null) list = (List<CartItem>)cart;
            return PartialView(list);
        }

        [HttpGet]
        public JsonResult Search(string keyword)
        {
            var list = new CatalogUserDao().searchFor(keyword);
            if (list.Count() > 0)
                return Json(new
                {
                    status = true,
                    data = list
                }, JsonRequestBehavior.AllowGet);
            else
                return Json(new
                {
                    status = false,
                    data = list
                }, JsonRequestBehavior.AllowGet);
        }

        [ChildActionOnly]
        public ActionResult FooterProduct(int? typeId)
        {
            return PartialView(new CatalogUserDao().GetCatalogs(1, 4, typeId));
        }

    }
}