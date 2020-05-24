using Model.DTO;
using Model.EF;
using Model.Models;
using System;
using System.Collections.Generic;

namespace Model.Dao
{
    public class BillDao
    {
        private readonly MobileWorldDbContext db;
        public BillDao()
        {
            db = new MobileWorldDbContext();
        }

        public Dictionary<int, List<string>> AddBill(List<CartItem> carts, BillDTO model, int userid)
        {
            Dictionary<int, List<string>> hash = new Dictionary<int, List<string>>();
            List<string> lst = new List<string>();
            using (var dbContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    foreach (var item in carts)
                    {
                        var bill = new Bill
                        {
                            unit = item.quantity,
                            name = item.catalog.name,
                            price = item.catalog.price * item.quantity,
                            pictureuri = item.catalog.pictureuri,
                            catalogid = item.catalog.id,
                            status = 0,
                            userid = userid,
                            shiptoaddress = model.shiptoaddress,
                            notebuy = model.notebuy,
                            createdAt = DateTime.Now,
                            updatedAt = DateTime.Now,
                            phone = model.phone,
                            username = model.username
                        };
                        db.Bills.Add(bill);
                        var catalog = db.Catalogs.Find(item.catalog.id);
                        if (catalog.quantity >= item.quantity)
                            catalog.quantity -= item.quantity;
                        else
                        {
                            lst.Add(catalog.name);
                        }
                    }
                    if(lst.Count > 0)
                    {
                        hash.Add(0, lst);
                        return hash;
                    }
                    db.SaveChanges();
                    hash.Add(1, null);
                    dbContextTransaction.Commit();
                    return hash;
                }
                catch (Exception)
                {
                    dbContextTransaction.Rollback();
                    hash.Add(-1, null);
                    return hash;
                }
            }

        }
    }
}
