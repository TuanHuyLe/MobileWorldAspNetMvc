using MobileWorld.common;
using Model.Dao;
using System;
using System.Web.Mvc;
using Model.Models;
using Model.EF;

namespace MobileWorld.areas.Admin.Controllers
{
    [Serializable]
    public class UsersController : AuthController
    {
        // GET: Admin/Users
        public ActionResult Index(string search, int page = 1, int pageSize = 5, int role = 1)
        {
            TempData.Keep();
            var dao = new UserDao();
            var model = dao.ListAllPaging(search, page, pageSize, role);
            ViewBag.search = search;
            return View(model);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            TempData.Keep();
            var dao = new UserDao();
            var entity = dao.findById(id);
            var roleId = dao.getRoleId(entity);
            UserSession userSession = (UserSession)Session[CommonConstant.USER_SESSION];
            ViewBag.RoleId = userSession.Role;
            var user = new UserModel()
            {
                id = entity.id,
                fullname = entity.fullname,
                phonenumber = entity.phonenumber,
                email = entity.email,
                address = entity.address,
                role = roleId,
                gender = entity.gender
            };
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(UserModel user)
        {
            var dao = new UserDao();
            if (ModelState.IsValid)
            {
                try
                {
                    UserSession userSession = (UserSession)Session[CommonConstant.USER_SESSION];
                    dao.Update(user, userSession.UserName);
                    return RedirectToAction("index");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("error", ex);
                    return View("edit");
                }
            }
            return View("edit");
        }

        [HttpPost]
        public ActionResult Lockup(int id)
        {
            try
            {
                var result = new UserDao().lockup(id);
                return Json(new
                {
                    status = result
                });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex);
            }
            return RedirectToAction("index");
        }

        [HttpGet]
        public ActionResult Detail(int id)
        {
            TempData.Keep();
            var user = new UserDao().findById(id);
            return View(user);
        }

        [HttpGet]
        public ActionResult Add()
        {
            TempData.Keep();
            return View();
        }

        [HttpPost]
        public ActionResult Add(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                UserSession userSession = (UserSession)Session[CommonConstant.USER_SESSION];
                var user2 = dao.findByUsername(user.username);
                if (user2 != null)
                {
                    ModelState.AddModelError("", "Tên tài khoản đã tồn tại");
                    return View("add");
                }
                dao.add(user, userSession.UserName);
                return RedirectToAction("index");
            }
            return View("add");
        }

        [HttpGet]
        public ActionResult DetailAdmin()
        {
            TempData.Keep();
            UserSession userSession = (UserSession)Session[CommonConstant.USER_SESSION];
            int id = userSession.UserId;
            var user = new UserDao().findById(id);
            return View("detail", user);
        }

    }
}