using MobileWorld.areas.Admin.Models.DTO;
using Model.Dao;
using Model.EF;
using System;

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
            user.address = model.address;
            user.status = model.status;
            user.updatedAt = DateTime.Now;
            user.phonenumber = model.phonenumber;
            return user;
        }
        public static UserDTO toDTO(User user)
        {
            var dto = new UserDTO();
            dto.id = user.id;
            dto.username = user.username;
            dto.fullname = user.fullname;
            dto.phonenumber = user.phonenumber;
            dto.email = user.email;
            dto.address = user.address;
            dto.status = user.status;
            return dto;
        }
    }
}
