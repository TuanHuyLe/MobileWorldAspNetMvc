using MobileWorld.common;
using System.Web.Mvc;
using System.Web.Routing;

namespace MobileWorld.areas.Admin.Controllers
{
    public class AuthController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "login", action = "index", area = "" }));
            } else if(session.Role == 1)
            {
                filterContext.Result = new RedirectToRouteResult(new
                    RouteValueDictionary(new { controller = "error", action = "index", area = "" }));
            }
            base.OnActionExecuting(filterContext);
        }
    }
}