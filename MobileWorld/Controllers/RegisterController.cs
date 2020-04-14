using MobileWorld.areas.Admin.Models;
using MobileWorld.common;
using Model.Dao;
using System;
using System.Web.Mvc;

namespace MobileWorld.areas.Admin.Controllers
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
                    var userMapper = UserMapper.mapper(model);
                    var username = dao.Register(userMapper);
                    return RedirectToAction("index", "login", new { username  });
                }
            }
            return View("index");
        }
    }
}