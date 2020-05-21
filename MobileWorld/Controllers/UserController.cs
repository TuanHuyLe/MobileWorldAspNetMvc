using Model.Dao;
using System.Web.Mvc;
using System.Web;
using System.IO;
using Model.Models;
using MobileWorld.common;
using EmailService;
using System.Configuration;
using System;

namespace MobileWorld.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public new ActionResult Profile(int id)
        {
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            if (session == null || session.UserId != id)
            {
                return RedirectToAction("index", "error");
            }
            var user = new UserDao().findById(id);
            UserModel model = new UserModel()
            {
                fullname = user.fullname,
                address = user.address,
                email = user.email,
                gender = user.gender,
                id = user.id,
                phonenumber = user.phonenumber,
                username = user.username,
                createdAt = user.createdAt
            };
            ViewBag.urlavatar = string.IsNullOrEmpty(user.avatar) ? @"http://placehold.it/380x500" : user.avatar;
            return View(model);
        }

        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase file, int id)
        {
            if (file != null)
            {
                if (Path.GetExtension(file.FileName).ToLower() == ".jpg"
                    || Path.GetExtension(file.FileName).ToLower() == ".png"
                    || Path.GetExtension(file.FileName).ToLower() == ".gif"
                    || Path.GetExtension(file.FileName).ToLower() == ".jpeg")
                {
                    string path = Path.Combine(Server.MapPath("~/Public/Images"), file.FileName);
                    string path2 = "\\Public\\Images\\" + file.FileName;
                    file.SaveAs(path);
                    new UserDao().changeAvatar(id, path2);
                    var session = (UserSession)Session[CommonConstant.USER_SESSION];
                    session.PictureUri = path2;
                }
            }
            TempData["Message"] = "Cập nhật ảnh đại diện thành công";
            TempData["TypeAlert"] = "alert-success";

            return RedirectToAction("Profile", new { id });
        }

        [HttpPost]
        public ActionResult UpdateInfo(UserModel entity)
        {
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            entity.role = 1;
            new UserDao().Update(entity, session.UserName);
            TempData["Message"] = "Cập nhật thông tin thành công";
            TempData["TypeAlert"] = "alert-success";
            return RedirectToAction("Profile", new { entity.id });
        }

        [HttpPost]
        public ActionResult changePassword(int id, string email, string oldpass, string newpass, string repass)
        {
            if (newpass.Equals(repass))
            {
                var username = new UserDao().findById(id).username;
                if (username != null)
                {
                    try
                    {
                        string content = "<p style=\"color: black; \">Tài khoản <b>" + username + "</b> đã được thay đổi mật khẩu vào lúc " + DateTime.Now + ".</p>";
                        content += "<p style = \"color: black;\" > Hãy chắc chắn rằng đó là bạn và liên hệ tới hòm thư " + ConfigurationManager.AppSettings["FromEmailAddress"] + " để biết thêm thông tin chi tiết.</p>;";
                        new MailHelper().SendEmail(email, "Xác thực thay đổi mật khẩu!", content);
                        bool check = new UserDao().changePassword(id, oldpass, newpass);
                        if (check)
                        {
                            TempData["Message"] = "Đổi mật khẩu thành công";
                            TempData["TypeAlert"] = "alert-success";
                        }
                        else
                        {
                            TempData["Message"] = "Mật khẩu cũ không đúng";
                            TempData["TypeAlert"] = "alert-danger";
                        }
                    }
                    catch (Exception)
                    {
                        TempData["Message"] = "Đổi mật khẩu thất bại";
                        TempData["TypeAlert"] = "alert-danger";
                    }
                }
                else
                {
                    TempData["Message"] = "Tài khoản không tồn tại";
                    TempData["TypeAlert"] = "alert-danger";
                }
            }
            else
            {
                TempData["Message"] = "Mật khẩu không trùng nhau";
                TempData["TypeAlert"] = "alert-danger";
            }
            return RedirectToAction("Profile", new { id });
        }
    }
}