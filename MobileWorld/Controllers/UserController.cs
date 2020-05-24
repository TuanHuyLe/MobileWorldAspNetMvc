using System.Web.Mvc;
using System.Web;
using System.IO;
using Model.Models;
using MobileWorld.common;
using EmailService;
using System.Configuration;
using System;
using System.Web.Script.Serialization;
using UserDao = Model.Dao.UserDao;
using BillDao = MobileWorld.areas.Admin.Models.Dao.BillDao;
using MobileWorld.areas.Admin.Models.DTO;

namespace MobileWorld.Controllers
{
    public class UserController : Controller
    {
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
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            if (session == null || session.UserId != id)
            {
                return RedirectToAction("index", "error");
            }
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
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            if (session == null || session.UserId != id)
            {
                return RedirectToAction("index", "error");
            }
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

        public ActionResult HistoryOrder(int id)
        {
            var session = (UserSession)Session[CommonConstant.USER_SESSION];
            if (session == null || session.UserId != id)
            {
                return RedirectToAction("index", "error");
            }
            return View();
        }

        [HttpGet]
        public JsonResult LoadData(int uid, string seach, int status, int month, int page, int pageSize)
        {
            var result = new BillDao().LoadData(uid, seach, status, month, page, pageSize);
            return Json(new
            {
                totalRow = result.TotalRecord,
                data = result.Items
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult CancelBill(int id)
        {
            var check = new BillDao().UpdateBill(id, -1);
            return Json(new
            {
                status = check
            }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult ReceivedBill(int id)
        {
            var check = new BillDao().UpdateBill(id, 2);
            return Json(new
            {
                status = check
            }, JsonRequestBehavior.AllowGet);
        }
    }
}