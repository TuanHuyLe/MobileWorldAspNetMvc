using MobileWorld.Models;
using Model.Dao;
using Model.EF;
using System;

namespace MobileWorld.common
{
    public class UserMapper
    {
        public static User mapper(RegisterModel model)
        {
            var user = new User
            {
                username = model.UserName,
                password = Hashing.HashPassword(model.Password),
                fullname = model.Fullname,
                status = true,
                email = model.Email,
                gender = model.gender,
                createdAt = DateTimeOffset.Now,
                updatedAt = DateTime.Now,
                modifiedby = model.UserName,
                createdby = model.UserName
            };
            return user;
        }
    }
}