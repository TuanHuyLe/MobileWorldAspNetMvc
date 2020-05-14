using Model.Dao;
using Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileWorld.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult Index(int id)
        {
            ViewBag.id = id;
            return View();
        }

        [ChildActionOnly]
        public ActionResult Detail(int id)
        {
            var dao = new CatalogUserDao();
            var catalog = dao.GetCatalogById(id);
            ViewBag.typeid = catalog.catalogtypeid;
            return PartialView(catalog);
        }

        [ChildActionOnly]
        public ActionResult Specifications(int id, int typeid)
        {
            var model = new CatalogUserDao().GetCatalogById(id);
            if(typeid == 1)
            {
                return PartialView("mobiles", model);
            }
            return PartialView("laptops", model);
        }

        [ChildActionOnly]
        public ActionResult RelatedProduct(int id)
        {
            var dao = new CatalogUserDao();
            var catalog = dao.getCatalog(id);
            var typeId = catalog.catalogtypeid;
            var brandId = catalog.catalogbrandid;
            var model = dao.GetAllProductByType(typeId, brandId, id).Take(6);
            ViewBag.typeName = typeId == 1 ? "điện thoại" : "laptop";
            ViewBag.catalogName = catalog.name;
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult FilterBrand(string typeName)
        {
            var dao = new CatalogUserDao();
            int brandId;
            switch (typeName)
            {
                case "Điện thoại":
                    brandId = 1;
                    break;
                case "Laptop":
                    brandId = 2;
                    break;
                default:
                    brandId = 0;
                    break;
            }
            var brand = dao.getAllCatalogBrand(brandId);
            return PartialView(brand);
        }

        [HttpPost]
        public ActionResult Search(string searchKeyword)
        {
            return RedirectToAction("catalog", "homeshop", new { typeid = 3, keyword = searchKeyword });
        }
    }
}