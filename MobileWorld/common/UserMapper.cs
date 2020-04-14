using MobileWorld.areas.Admin.Models;
using Model.Dao;
using Model.EF;
using System;

namespace MobileWorld.common
{
    public class UserMapper
    {
        public static User mapper(RegisterModel model)
        {
            var user = new User();
            user.username = model.UserName;
            user.password = Hashing.HashPassword(model.Password);
            user.fullname = model.Fullname;
            user.status = true;
            user.phonenumber = model.PhoneNumber;
            user.email = model.Email;
            user.gender = model.gender;
            user.address = model.Address;
            user.createdAt = DateTimeOffset.Now;
            user.updatedAt = DateTime.Now;
            user.modifiedby = model.UserName;
            user.createdby = model.UserName;
            return user;
        }
    }
}