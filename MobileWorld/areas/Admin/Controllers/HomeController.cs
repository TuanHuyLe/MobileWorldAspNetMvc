using MobileWorld.common;
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
    }
}