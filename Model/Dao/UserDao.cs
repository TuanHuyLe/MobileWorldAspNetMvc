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
                var role = db.UserRoles.Where(x => x.userid == entity.id).ToList();
                var oldRoleId = getRoleId(user.id);
                var newRoleId = entity.role;
                if (oldRoleId != newRoleId)
                {
                    if (oldRoleId > newRoleId)
                    {
                        db.UserRoles.Remove(role[role.Count - 1]);
                    }
                    else
                    {
                        var newRole = new UserRole
                        {
                            updatedAt = DateTime.Now,
                            roleid = newRoleId,
                            userid = entity.id
                        };
                        db.UserRoles.Add(newRole);
                    }
                }
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
                if (getRoleId(u.id) == role)
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
                    var roleId = getRoleId(user.id);
                    if (user.status)
                    {
                        if (roleId == 3)
                        {
                            hash.Add(3, user); // success - superadmin
                        }
                        else if (roleId == 2)
                        {
                            hash.Add(2, user); // success - admin
                        }
                        else
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

        public int getRoleId(int id)
        {
            var role = db.UserRoles.Where(x => x.userid == id).ToList();
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

        public int forgotPassword(string UserName, string PhoneNumber, string NewPassword)
        {
            var user = db.Users.SingleOrDefault(x => x.username == UserName);
            if (user != null)
            {
                var check = user.phonenumber == PhoneNumber ? 1 : 0;
                if (check == 1)
                {
                    user.password = NewPassword;
                    db.SaveChanges();
                    return 1;
                }
                return 0;
            }
            return -1;
        }

        public int insertFacebook(User entity)
        {
            var user = db.Users.SingleOrDefault(x => x.username == entity.username);

            if (user == null)
            {
                using (var dbContextTransaction = db.Database.BeginTransaction())
                {
                    try
                    {
                        entity.createdAt = DateTime.Now;
                        entity.updatedAt = DateTime.Now;
                        entity.createdby = entity.username;
                        entity.password = Hashing.HashPassword(entity.id.ToString());
                        entity.gender = 2;
                        db.Users.Add(entity);
                        db.SaveChanges();
                        var role = new UserRole()
                        {
                            userid = entity.id,
                            roleid = 1,
                            createdAt = DateTime.Now,
                            updatedAt = DateTime.Now
                        };
                        db.UserRoles.Add(role);
                        db.SaveChanges();
                        dbContextTransaction.Commit();
                        return entity.id;
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        return 0;
                    }
                }
            }
            return -1;
        }

    }

}
