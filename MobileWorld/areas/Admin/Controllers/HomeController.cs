using MobileWorld.common;
using System.Web.Mvc;

namespace MobileWorld.areas.Admin.Controllers
{
    public class HomeController : AuthController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            UserSession userSession = (UserSession)Session[CommonConstant.USER_SESSION];
            TempData["name"] = userSession.UserName.ToUpper();
            TempData.Keep();
            return View();
        }
    }
}