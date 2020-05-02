using MobileWorld.Models;
using MobileWorld.common;
using Model.Dao;
using System;
using System.Web.Mvc;

namespace MobileWorld.Controllers
{
    [Serializable]
    public class LoginController : Controller
    {
        // GET: /Home
        public ActionResult Index()
        {
            Session.Remove(CommonConstant.USER_SESSION);
            return View();
        }

        [HttpPost]
        public JsonResult Logout()
        {
            Session.Remove(CommonConstant.USER_SESSION);
            return Json(new
            {
                status = true
            });
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var hash = dao.Login(model.UserName, model.Password);
                if (hash.ContainsKey(3))
                {
                    var userSession = new UserSession
                    {
                        UserName = hash[3].username,
                        UserId = hash[3].id,
                        Role = 3
                    };
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    return RedirectToAction("index", "home", new { area = "admin" });
                }
                else if (hash.ContainsKey(2))
                {

                    var userSession = new UserSession
                    {
                        UserName = hash[2].username,
                        UserId = hash[2].id,
                        Role = 2
                    };
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    return RedirectToAction("index", "home", new { area = "admin" });
                }
                else if (hash.ContainsKey(1))
                {
                    var userSession = new UserSession
                    {
                        UserName = hash[1].username,
                        UserId = hash[1].id,
                        Role = 1
                    };
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    return RedirectToAction("index", "homeshop", new { area = "" });
                }
                else if (hash.ContainsKey(-1))
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (hash.ContainsKey(0))
                {
                    ModelState.AddModelError("", "Tài khoản không đúng");
                }
                else if (hash.ContainsKey(-2))
                {
                    ModelState.AddModelError("", "Tài khoản bị khóa");
                }
            }
            return View("index");
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ForgotPassword(ForgotPasswordModel entity)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var check = dao.forgotPassword(entity.UserName, entity.PhoneNumber, entity.NewPassword);
                if (check == 1)
                {
                    return RedirectToAction("index", "login");
                }
                else if (check == -1)
                    ModelState.AddModelError("", "Tài khoản không đúng");
                else if (check == 0)
                    ModelState.AddModelError("", "Số điện thoại không đúng");
            }
            return View("ForgotPassword");
        }


    }
}