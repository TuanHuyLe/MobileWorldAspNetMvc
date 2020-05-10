using MobileWorld.common;
using Model.Dao;
using Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace MobileWorld.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CommonConstant.CART_SESSION];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        [ChildActionOnly]
        public ActionResult TableProduct(List<CartItem> list)
        {
            ViewBag.cartTotalPrice = Session[CommonConstant.CART_TOTAL_PRICE_SESSION];
            return PartialView(list);
        }

        public ActionResult AddItem(int id, int quantity = 1)
        {
            var catalog = new CatalogDao().findById(id);
            var cart = Session[CommonConstant.CART_SESSION];
            if (quantity > 10) quantity = 10;
            if (quantity < 1) quantity = 1;
            if (cart != null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.catalog.id == id))
                {
                    foreach (var item in list)
                    {
                        if (item.catalog.id == id && (item.quantity + quantity) <= 10)
                        {
                            item.quantity += quantity;
                        }
                    }
                }
                else
                {
                    // tao moi doi tuong cart item
                    var item = new CartItem
                    {
                        catalog = catalog,
                        quantity = quantity
                    };
                    // gan vao session
                    list.Add(item);
                }
                // gan vao session
                Session[CommonConstant.CART_SESSION] = list;
            }
            else
            {
                // tao moi doi tuong cart item
                var item = new CartItem
                {
                    catalog = catalog,
                    quantity = quantity
                };
                var list = new List<CartItem>
                {
                    item
                };
                // gan vao session
                Session[CommonConstant.CART_SESSION] = list;
            }
            return RedirectToAction("index");
        }

        [HttpPost]
        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CommonConstant.CART_SESSION];
            foreach (var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.catalog.id == item.catalog.id);
                if (jsonItem != null)
                {
                    item.quantity = jsonItem.quantity;
                }
            }
            Session[CommonConstant.CART_SESSION] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        public JsonResult DeleteCart(int catalogid)
        {
            var sessionCart = (List<CartItem>)Session[CommonConstant.CART_SESSION];
            sessionCart.RemoveAll(x => x.catalog.id == catalogid);
            Session[CommonConstant.CART_SESSION] = sessionCart;
            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        public JsonResult UpdateTotalPrice(string totalPrice)
        {
            Session[CommonConstant.CART_TOTAL_PRICE_SESSION] = totalPrice;
            return Json(new
            {
                status = true
            });
        }

        [ChildActionOnly]
        public ActionResult InterestedProduct()
        {
            var interested = new CatalogUserDao().GetCatalogs(1, 3);
            return PartialView(interested);
        }

    }
}