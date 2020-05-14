using MobileWorld.areas.Admin.Models.DTO;
using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MobileWorld.areas.Admin.Models.Util
{
    public static class UserMapper
    {
        public static User toUser(UserDTO model, User user)
        {
            if (model.id == 0)
            {
                user.createdAt = DateTime.Now;
            }
            if(model.password != null)
            {
                user.password = Hashing.HashPassword(model.password);
            }
            user.username = model.username;
            user.email = model.email;
            user.phonenumber = model.phonenumber;
            user.address = model.address;
            user.status = model.status;
            user.updatedAt = DateTime.Now;
            return user;
        }
        public static UserDTO toDTO(User user)
        {
            var dto = new UserDTO
            {
                id = user.id,
                username = user.username,
                fullname = user.fullname,
                phonenumber = user.phonenumber,
                email = user.email,
                address = user.address,
                status = user.status
            };
            return dto;
        }
    }
}
