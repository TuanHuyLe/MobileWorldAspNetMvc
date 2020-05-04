using MobileWorld.Models;
using MobileWorld.common;
using Model.Dao;
using System;
using System.Web.Mvc;
using Facebook;
using System.Configuration;
using Model.EF;
using EmailService;

namespace MobileWorld.Controllers
{
    [Serializable]
    public class LoginController : Controller
    {
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url)
                {
                    Query = null,
                    Fragment = null,
                    Path = Url.Action("FacebookCallback")
                };
                return uriBuilder.Uri;
            }
        }

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
                string newPass = GeneratePassword.Generate();
                int check = dao.changePassword(entity.UserName, entity.Email, newPass);
                if (check == 1)
                {
                    string content = "Mật khẩu mới của bạn là: <b>" + newPass + "</b>";
                    new MailHelper().SendEmail(entity.Email, "Mobile World - Quên mật khẩu", content);
                    //ModelState.AddModelError("", "Mật khẩu mới đã được gửi vào email của bạn");
                    string message = "Mật khẩu mới đã được gửi vào email của bạn";
                    TempData["Message"] = message;
                    return RedirectToAction("index", "login");
                }
                else if (check == -2)
                {
                    ModelState.AddModelError("", "Email không đúng");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản không đúng");
                }
            }
            return View("ForgotPassword");
        }

        public ActionResult Facebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email"
            });
            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = ConfigurationManager.AppSettings["FbAppId"],
                client_secret = ConfigurationManager.AppSettings["FbAppSecret"],
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });
            var accessToken = result.access_token;
            if (!string.IsNullOrEmpty(accessToken))
            {
                fb.AccessToken = accessToken;
                dynamic me = fb.Get("me?fields=first_name,middle_name,last_name,id,email");
                string id = me.id;
                string email = me.email;
                string firstname = me.first_name;
                string middlename = me.middle_name;
                string lastname = me.last_name;

                string fullname = firstname + " " + middlename + " " + lastname;
                var user = new User
                {
                    id = 0,
                    username = id,
                    fullname = fullname,
                    status = true,
                    email = email
                };

                var dao = new UserDao();
                var idUserFb = dao.insertFacebook(user);

                if (idUserFb > 0)
                {
                    var userFb = dao.findById(idUserFb);
                    var userSession = new UserSession
                    {
                        UserName = userFb.fullname,
                        UserId = userFb.id,
                        Role = dao.getRoleId(userFb.id)
                    };
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    if (userSession.Role > 1) return RedirectToAction("index", "home", new { area = "admin" });
                }
                else if (idUserFb == 0)
                {
                    ModelState.AddModelError("", "Đăng nhập bằng facebook lỗi!");
                    return View("index");
                }
                else
                {
                    var userFb = dao.findByUsername(id);
                    var userSession = new UserSession
                    {
                        UserName = userFb.fullname,
                        UserId = userFb.id,
                        Role = dao.getRoleId(userFb.id)
                    };
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    if (userSession.Role > 1) return RedirectToAction("index", "home", new { area = "admin" });
                }
            }
            return Redirect("/");
        }
    }
}