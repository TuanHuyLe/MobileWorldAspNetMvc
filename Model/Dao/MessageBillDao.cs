using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Model.Dao
{
    public class MessageBillDao
    {
        private readonly MobileWorldDbContext db;
        public MessageBillDao()
        {
            db = new MobileWorldDbContext();
        }

        public int[] GetMessage()
        {
            int countChoDuyet = db.Bills.Count(x => x.status == 0); // cho duyet
            int countDaHuy = db.Bills.Count(x => x.status == -1); // da huy
            int[] arr = new int[2];
            if (db.MessageBills.Count() == 0)
            {
                var model = new MessageBill()
                {
                    countChoDuyet = countChoDuyet,
                    countDaHuy = countDaHuy
                };
                db.MessageBills.Add(model);
                db.SaveChanges();
                arr[0] = -2; arr[1] = -2;
                return arr;
            }
            int countCD = db.MessageBills.Find(1).countChoDuyet;
            int countDH = db.MessageBills.Find(1).countDaHuy;
            if (countChoDuyet > countCD)
            {
                arr[0] = 0;
            }
            else
            {
                arr[0] = -2;
            }
            if (countDaHuy > countDH)
            {
                arr[1] = -1;
            }
            else
            {
                arr[1] = -2;
            }
            return arr;
        }

        public List<DateTimeOffset> GetTimeBill()
        {
            var timeCD = db.MessageBills.Find(1).updateChoDuyetAt;
            var timeDH = db.MessageBills.Find(1).updateDaHuyAt;
            List<DateTimeOffset> lstDt = new List<DateTimeOffset>
            {
                (DateTimeOffset)timeCD,
                (DateTimeOffset)timeDH
            };
            return lstDt;
        }

        public bool SeenMessage(int typeMsg)
        {
            try
            {
                var msg = db.MessageBills.Find(1);
                if (typeMsg == 0)
                {
                    msg.countChoDuyet = db.Bills.Count(x => x.status == typeMsg);
                } else
                {
                    msg.countDaHuy = db.Bills.Count(x => x.status == typeMsg);
                }
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
