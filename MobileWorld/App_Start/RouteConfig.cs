
using System.Web.Mvc;
using System.Web.Routing;

namespace MobileWorld
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "auth",
                url: "admin/{*url}",
                defaults: new { controller = "auth" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "homeshop", action = "index", id = UrlParameter.Optional }
            );

            
        }
    }
}
