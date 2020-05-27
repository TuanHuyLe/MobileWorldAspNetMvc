using MobileWorld.areas.Admin.Models.Dao;
using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MobileWorld.areas.Admin.Controllers
{
    public class HomeController : AuthController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult GetMessage()
        {
            var dao = new MessageBillDao();
            int[] stt = dao.GetMessage();
            int c = stt.Count(x => x != -2);
            var lstTime = dao.GetTimeBill();
            return Json(new
            {
                status = stt,
                count = c,
                timeCD = lstTime[0].ToString(),
                timeDH = lstTime[1].ToString()
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult SeenMessage(int typeMsg)
        {
            bool seen = new MessageBillDao().SeenMessage(typeMsg);
            return Json(new
            {
                status = seen
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CatalogHotest()
        {
            var lstData = new StatisticalDao().catalogHotest(4);
            return Json(new
            {
                data = lstData
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CatalogChart()
        {
            List<double> lstcost = new List<double>();
            for (int i = 1; i < 13; i++)
            {
                var lstData = new StatisticalDao().GetAllCatalog("", 0, 0, i, 1, 1);
                lstcost.Add(lstData.Total);
            }
            return Json(new
            {
                data = lstcost
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CatalogTypeChart()
        {
            int month = DateTime.Now.Month;
            int slMobile = new StatisticalDao().GetAllCatalog("", 0, 1, month, 1, 1).TotalRecord;
            int slLaptop = new StatisticalDao().GetAllCatalog("", 0, 2, month, 1, 1).TotalRecord;
            return Json(new
            {
                slMobile,
                slLaptop
            }, JsonRequestBehavior.AllowGet);
        }
    }
}