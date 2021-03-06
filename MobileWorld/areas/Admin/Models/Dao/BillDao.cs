﻿using MobileWorld.areas.Admin.Models.DTO;
using Model.EF;
using System;
using System.Linq;

namespace MobileWorld.areas.Admin.Models.Dao
{
    public class BillDao
    {
        MobileWorldDbContext _context = null;
        public BillDao()
        {
            _context = new MobileWorldDbContext();
        }
        public bool UpdateBill(int id, int status)
        {
            var bill = _context.Bills.Find(id);
            bill.status = status;
            _context.SaveChanges();
            if(status == -1)
            {
                var catalog = _context.Catalogs.Find(bill.catalogid);
                catalog.quantity += bill.unit;
                _context.SaveChanges();
                var msgBill = _context.MessageBills.Find(1);
                msgBill.updateDaHuyAt = DateTime.Now;
                _context.SaveChanges();
            }
            if(status == 1)
            {
                var notifi = new Notification()
                {
                    billid = bill.id,
                    userid = bill.userid,
                    title = "Đơn hàng đã được xác nhận.",
                    content = "Đơn hàng mã số " + bill.id.ToString() + " đã được xác nhận.",
                    status = 1,
                    createdAt = DateTime.Now,
                    updatedAt = DateTime.Now
                };
                try
                {
                    _context.Notifications.Add(notifi);
                    _context.SaveChanges();
                }
                catch (Exception)
                {
                    return false;
                }
            }
            return true;
        }
        public bool DeleteBill(int id)
        {
            var bill = _context.Bills.Find(id);
            _context.Bills.Remove(bill);
            try
            {
                _context.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
        public PagedResult<BillDTO> LoadData(int? uid, string seach, int status, int month, int page, int pageSize)
        {
            var query = from b in _context.Bills
                        join u in _context.Users on b.userid equals u.id
                        /*join ur in _context.UserRoles on u.id equals ur.userid
                        where ur.roleid == 1*/
                        select new { b, u.username };
            if(uid != null)
            {
                query = query.Where(x => x.b.userid == uid);
            }
            if (!string.IsNullOrEmpty(seach))
            {
                query = query.Where(x => x.username.Contains(seach));
            }
            if(status == 1 && uid != null)
            {
                query = query.Where(x => x.b.status == status || x.b.status == 2);
            }
            else
            {
                query = query.Where(x => x.b.status == status);
            }
            if(month > 0)
            {
                query = query.Where(x => x.b.createdAt.Month == month);
            }
            var result = new PagedResult<BillDTO>();
            result.TotalRecord = query.Count();
            result.Items = query.OrderByDescending(x => x.b.createdAt)
                .Skip((page - 1) * pageSize).Take(pageSize)
                .Select(x => new BillDTO()
                {
                    id = x.b.id,
                    receivername = x.b.username,
                    sendername = x.username,
                    name = x.b.name,
                    price = x.b.price,
                    unit = x.b.unit,
                    status = x.b.status,
                    shiptoaddress = x.b.shiptoaddress,
                    createdAt = x.b.createdAt.Day.ToString()
                    + "/" + x.b.createdAt.Month.ToString()
                    + "/" + x.b.createdAt.Year.ToString()
                }).ToList();
            return result;
        }

    }
}
