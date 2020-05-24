using EmailService;
using MobileWorld.common;
using Model.Dao;
using Model.DTO;
using Model.Models;
using System;
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
            if (cart == null || cart.Count == 0)
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
            foreach (var item in cart)
            {
                totalPrice += item.quantity * item.catalog.price;
            }
            ViewBag.TotalCart = totalPrice;
            return PartialView(cart);
        }

        [HttpPost]
        public ActionResult Payment(BillDTO model)
        {
            if (ModelState.IsValid)
            {
                var carts = (List<CartItem>)Session[CommonConstant.CART_SESSION];
                var user = (UserSession)Session[CommonConstant.USER_SESSION];
                decimal totalPrice = 0;
                string tblData = "";
                Dictionary<int, List<string>> hash = new BillDao().AddBill(carts, model, user.UserId);
                if (hash.ContainsKey(1))
                {
                    try
                    {
                        string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/user/orderBill.html"));
                        content = content.Replace("{{username}}", user.UserName);
                        content = content.Replace("{{customername}}", model.username);
                        content = content.Replace("{{phone}}", model.phone);
                        content = content.Replace("{{shiptoaddress}}", model.shiptoaddress);
                        content = content.Replace("{{email}}", model.email);
                        foreach (var item in carts)
                        {
                            decimal p = item.catalog.price * item.quantity;
                            totalPrice += p;
                            tblData += "<tr><td>" + item.catalog.name + "</td><td>" + item.quantity + "</td><td>" + string.Format("{0:0,0} VNĐ", p) + "</td></tr>";
                        }
                        content = content.Replace("{{tblData}}", tblData);
                        content = content.Replace("{{price}}", string.Format("{0:0,0 VNĐ}", totalPrice));
                        new MailHelper().SendEmail(model.email, "Hóa đơn thanh toán từ Mobile World", content);
                        Session[CommonConstant.CART_SESSION] = null;
                        Session[CommonConstant.CART_TOTAL_PRICE_SESSION] = 0;
                        TempData["Message"] = "Đặt hàng thành công. Hóa đơn được gửi vào email của bạn";
                        return RedirectToAction("index", "cart");
                    }
                    catch (Exception)
                    {
                        return RedirectToAction("index", "error");
                    }
                }
                else if (hash.ContainsKey(0))
                {
                    string msg = "Có sản phẩm đã hết hàng: ";
                    msg += hash[0][0];
                    for (int i = 1; i < hash[0].Count; i++)
                    {
                        msg += ", " + hash[0][i];
                    }
                    TempData["Message"] = msg;
                }
                else
                {
                    TempData["Message"] = "Lỗi đặt hàng!";
                }
            }
            return View("index");
        }
    }
}