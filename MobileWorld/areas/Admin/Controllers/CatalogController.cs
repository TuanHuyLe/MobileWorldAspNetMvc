using Model.Dao;
using Model.EF;
using Model.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace MobileWorld.areas.Admin.Controllers
{
    [Serializable]
    public class CatalogController : AuthController
    {
        // GET: Admin/Catalog
        public ActionResult Index(string search, string brand, string type = "laptop", int page = 1, int pageSize = 5, int price = 0)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            var model = dao.ListAllPaging(search, brand, type, page, pageSize, price);
            ViewBag.search = search;
            ViewBag.type = type;
            ViewBag.brand = brand;
            return View(model);
        }

        public ActionResult Detail(int id)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            Catalog catalog = dao.findById(id);
            return View(catalog);
        }

        [HttpGet]
        public ActionResult Update(int id)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            Catalog catalog = dao.findById(id);
            return View(catalog);
        }

        [HttpPost]
        public ActionResult Update(Catalog catalog)
        {

            if (ModelState.IsValid)
            {
                var dao = new CatalogDao();
                var typeId = catalog.catalogtypeid;
                CatalogType ct = dao.getTypeById(typeId);
                try
                {
                    dao.Update(catalog);
                    return RedirectToAction("index", new { ct.type });
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex);
                }
            }
            return View("update");
        }

        public ActionResult Delete(int id)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            Catalog catalog = dao.findById(id);
            dao.delete(id);
            if (catalog.catalogtypeid == 1)
            {
                return RedirectToAction("index", "catalog", new { type = "Điện thoại" });
            }
            else
            {
                return RedirectToAction("index", "catalog", new { type = "Laptop" });
            }
        }

        [HttpGet]
        public ActionResult Specifications(int id, int type)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            if (type == 1)
            {
                var mobile = dao.getSpecificationMobile(id);
                return View("mobile", mobile);
            }
            else if (type == 2)
            {
                var laptop = dao.getSpecificationLaptop(id);
                return View("laptop", laptop);
            }
            return View("index");
        }

        [HttpGet]
        public ActionResult Edit(int id, int type)
        {
            TempData.Keep();
            var dao = new CatalogDao();
            if (type == 1)
            {
                var mobile = dao.getSpecificationMobile(id);
                return View("editmobile", mobile);
            }
            else if (type == 2)
            {
                var laptop = dao.getSpecificationLaptop(id);
                return View("editlaptop", laptop);
            }
            return View("index");
        }

        [HttpPost]
        public ActionResult EditMobile(SpecificationMobile mobile)
        {
            if (ModelState.IsValid)
            {
                var dao = new CatalogDao();
                try
                {
                    dao.editSpecificationMobile(mobile);
                    return RedirectToAction("specifications", new { mobile.id, type = 1 });
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex);
                    return View("editmobile", mobile);
                }
            }
            return View("editmobile", mobile);
        }

        [HttpPost]
        public ActionResult EditLaptop(SpecificationLaptop laptop)
        {
            if (ModelState.IsValid)
            {
                var dao = new CatalogDao();
                try
                {
                    dao.editSpecificationLaptop(laptop);
                    return RedirectToAction("specifications", new { laptop.id, type = 2 });
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", ex);
                    return View("editlaptop", laptop);
                }
            }
            return View("editlaptop", laptop);
        }

        [HttpPost]
        public JsonResult Add(int type, string model)
        {
            var catalogDao = new CatalogDao();
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            if (type == 1)
            {
                MobileDTO catalog = serializer.Deserialize<MobileDTO>(model);
                var check = catalogDao.addMobileDTO(catalog);
                if (check)
                {
                    return Json(new
                    {
                        status = true,
                        type = 1
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new
                    {
                        status = false
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            else
            {
                LaptopDTO catalog = serializer.Deserialize<LaptopDTO>(model);
                var check = catalogDao.addLaptopDTO(catalog);
                if (check)
                {
                    return Json(new
                    {
                        status = true,
                        type = 2
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new
                    {
                        status = false
                    }, JsonRequestBehavior.AllowGet);
                }
            }
        }

    }
}