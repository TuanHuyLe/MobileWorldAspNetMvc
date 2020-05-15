using Model.Dao;
using System.Linq;
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
            int typeId;
            switch (typeName)
            {
                case "Điện thoại":
                    typeId = 1;
                    break;
                case "Laptop":
                    typeId = 2;
                    break;
                default:
                    typeId = 0;
                    break;
            };
            var dao = new CatalogUserDao();
            var brand = dao.getAllCatalogBrand(typeId);
            return PartialView(brand);
        }
    }
}