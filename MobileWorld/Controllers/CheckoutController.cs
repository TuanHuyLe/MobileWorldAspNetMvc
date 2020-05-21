using MobileWorld.common;
using Model.DTO;
using Model.Models;
using System.Collections.Generic;
using System.Web.Mvc;

namespace MobileWorld.Controllers
{
    public class CheckoutController : Controller
    {
        // GET: Checkout
        public ActionResult Index()
        {
            var cart = (List<CartItem>)Session[CommonConstant.CART_SESSION];
            var userSession = (UserSession)Session[CommonConstant.USER_SESSION];
            if (userSession == null)
            {
                return RedirectToAction("index", "login");
            }
            if(cart == null || cart.Count == 0)
            {
                return RedirectToAction("index", "cart");
            }
            return View();
        }

        [ChildActionOnly]
        public ActionResult ShopTable()
        {
            var cart = (List<CartItem>)Session[CommonConstant.CART_SESSION];
            decimal totalPrice = 0;
            foreach(var item in cart)
            {
                totalPrice += item.quantity * item.catalog.price;
            }
            ViewBag.TotalCart = totalPrice;
            return PartialView(cart);
        }

        [HttpPost]
        public ActionResult Pay(InfoCartDTO model)
        {
            if (ModelState.IsValid)
            {

                return RedirectToAction("index");
            }
            return View("index");
        }
    }
}