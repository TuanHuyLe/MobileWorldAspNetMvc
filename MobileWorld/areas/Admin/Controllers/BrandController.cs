using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MobileWorld.areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        // GET: Admin/Brand
        public ActionResult Index()
        {
            var brand = new CatalogDao().getAllBrand();
            return View(brand);
        }

        public ActionResult AddNewBrand()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddNewBrand(CatalogBrand entity)
        {
            if (ModelState.IsValid)
            {
                var catalogDao = new CatalogDao();
                try
                {
                    int check = catalogDao.AddNewBrand(entity);
                    if (check == 1)
                    {
                        return RedirectToAction("index");
                    }
                    ModelState.AddModelError("", "Đã tồn tại tên thương hiệu");
                    return View("AddNewBrand");
                }
                catch (Exception)
                {
                    ModelState.AddModelError("", "Lỗi!");
                    return View("AddNewBrand");
                }
            }
            return View("AddNewBrand");
        }

        public ActionResult Edit(int id)
        {
            var model = new CatalogDao().findCatalogBrandById(id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(CatalogBrand entity)
        {
            var dao = new CatalogDao();
            var check = dao.UpdateCatalogBrand(entity);
            if(check == 1)
            {
                return RedirectToAction("index");
            }
            ModelState.AddModelError("", "Cập nhật thất bại");
            return View();
        }

        [HttpGet]
        public JsonResult Delete(int id)
        {
            var check = new CatalogDao().DeleteBrand(id);
            if(check == 1)
            {
                return Json(new
                {
                    message = "success",
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
            return Json(new
            {
                message = "falied",
                status = false
            }, JsonRequestBehavior.AllowGet);
        }
    }
}