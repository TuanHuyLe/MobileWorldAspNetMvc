using Model.EF;
using System.Collections.Generic;
using System.Linq;
using PagedList;
using System;
using Model.Models;

namespace Model.Dao
{
    public class UserDao
    {
        private readonly MobileWorldDbContext db;
        public UserDao()
        {
            db = new MobileWorldDbContext();
        }
        public string Register(User entity)
        {
            db.Users.Add(entity);
            UserRole userRole = new UserRole()
            {
                userid = entity.id,
                roleid = 1,
                createdAt = DateTime.Now
            };
            db.UserRoles.Add(userRole);
            db.SaveChanges();
            return entity.username;
        }

        public void Update(UserModel entity, string by)
        {
            try
            {
                var user = db.Users.Find(entity.id);
                user.fullname = entity.fullname;
                user.phonenumber = entity.phonenumber;
                user.email = entity.email;
                user.address = entity.address;
                user.updatedAt = DateTime.Now;
                user.modifiedby = by;
                user.gender = entity.gender;
                var role = db.UserRoles.SingleOrDefault(x => x.userid == entity.id);
                role.roleid = entity.role;
                db.SaveChanges();
            }
            catch (Exception)
            {
                throw new Exception("Cập nhật thất bại");
            }

        }

        public IEnumerable<User> ListAllPaging(string search, int page, int pageSize, int role)
        {
            IQueryable<User> model = db.Users;

            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.username.Contains(search) || x.fullname.Contains(search) || x.phonenumber.Contains(search));
            }

            var listAll = model.OrderByDescending(x => x.createdAt);
            List<User> listUser = new List<User>();
            foreach (User u in listAll)
            {
                if (getRoleId(u) == role)
                {
                    listUser.Add(u);
                }
            }
            
            return listUser.ToPagedList(page, pageSize);
        }

        public User findByUsername(string username)
        {
            return db.Users.SingleOrDefault(x => x.username == username);
        }

        public User findById(int id)
        {
            return db.Users.SingleOrDefault(x => x.id == id);
        }

        public Dictionary<int, User> Login(string username, string password)
        {
            Dictionary<int, User> hash = new Dictionary<int, User>();
            var user = db.Users.SingleOrDefault(x => x.username == username);
            if (user != null)
            {
                if (Hashing.ValidatePassword(password, user.password))
                {
                    var roleId = getRoleId(user);
                    if (user.status)
                    {
                        if (roleId == 3)
                        {
                            hash.Add(3, user); // success - superadmin
                        }
                        else if(roleId == 2)
                        {
                            hash.Add(2, user); // success - admin
                        } else
                        {
                            hash.Add(1, user); // sucess - user
                        }
                    }
                    else
                    {
                        hash.Add(-2, user); // inactive
                    }
                }
                else
                {
                    hash.Add(-1, user); // mat khau sai
                }
            }
            else
            {
                hash.Add(0, null); // tai khoan sai
            }
            return hash;
        }

        public int getRoleId(User entity)
        {
            var role = db.UserRoles.Where(x => x.userid == entity.id).ToArray();
            var roleId = 1;
            foreach (UserRole userRole in role)
            {
                if (userRole.roleid > roleId)
                {
                    roleId = userRole.roleid;
                }
            }
            return roleId;
        }

        public bool lockup(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                user.status = !user.status;
                db.SaveChanges();
                return !user.status;
            }
            catch (Exception)
            {
                throw new Exception("Chức năng khóa đang bị lỗi");
            }
        }

        public void add(User entity, string by)
        {
            entity.createdAt = DateTime.Now;
            entity.createdby = by;
            entity.modifiedby = by;
            entity.updatedAt = DateTime.Now;
            entity.password = Hashing.HashPassword(entity.password);
            entity.status = true;
            db.Users.Add(entity);
            var role = new UserRole()
            {
                userid = entity.id,
                roleid = 1,
                createdAt = DateTime.Now,
                updatedAt = DateTime.Now
            };
            db.UserRoles.Add(role);
            db.SaveChanges();
        }

    }

}
