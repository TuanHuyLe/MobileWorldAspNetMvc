using MobileWorld.Models;
using MobileWorld.common;
using Model.Dao;
using System;
using System.Web.Mvc;
using EmailService;

namespace MobileWorld.Controllers
{
    [Serializable]
    public class RegisterController : Controller
    {
        // GET: /Register
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var user = dao.findByUsername(model.UserName);
                if (model.Password != model.RePassword)
                {
                    ModelState.AddModelError("", "Mật khẩu không trùng khớp");
                } else if (user != null)
                {
                    ModelState.AddModelError("", "Tên tài khoản đã tồn tại");
                }
                else
                {
                    try
                    {
                        var userMapper = UserMapper.mapper(model);
                        var content = "Chúc mừng bạn đã đăng ký thành công tài khoản <b>" + userMapper.username + "</b>";
                        new MailHelper().SendEmail(model.Email, "Mobile World - Đăng ký tài khoản", content);
                        var username = dao.Register(userMapper);
                        return RedirectToAction("index", "login");
                    }
                    catch (Exception)
                    {
                        return RedirectToAction("index", "error");
                    }
                }
            }
            return View("index");
        }
    }
}