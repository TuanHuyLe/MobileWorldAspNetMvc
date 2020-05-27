using Model.Dao;
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
    }
}