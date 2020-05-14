using MobileWorld.areas.Admin.Controllers;
using MobileWorld.areas.Admin.Models.Dao;
using MobileWorld.areas.Admin.Models.DTO;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace MobileWorld.Areas.Admin.Controllers
{
    public class UsersController : AuthController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string name, string status, int page, int pageSize)
        {
            var userDao = new UserDao();
            var model = userDao.ListAllPaging(name, status, page, pageSize);
            return Json(new
            {
                status = true,
                totalRow = model.TotalRecord,
                data = model.Items
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Save(string model)
        {
            if (model != null)
            {
                var userDao = new UserDao();
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                var userDTO = serializer.Deserialize<UserDTO>(model);
                bool check;
                if (userDTO.id != 0)
                {
                    check = userDao.Update(userDTO);
                }
                else
                {
                    check = userDao.Insert(userDTO);
                }
                if (check)
                {
                    return Json(new
                    {
                        status = true
                    });
                }
                else
                {
                    return Json(new
                    {
                        status = false
                    });
                }
            }
            else
            {
                return Json(new
                {
                    status = false
                });
            }
        }
        [HttpPost]
        public JsonResult ChangeStatus(int id)
        {
            var result = new UserDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var model = new UserDao().GetUserById(id);
            return Json(new
            {
                status = true,
                data = model
            }, JsonRequestBehavior.AllowGet);
        }
    }
}