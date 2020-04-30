using Model.EF;
using Model.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CatalogUserDao
    {
        private readonly MobileWorldDbContext db;
        public CatalogUserDao()
        {
            db = new MobileWorldDbContext();
        }

        public List<Catalog> GetCatalogs(int page, int pageSize)
        {
            return db.Catalogs.OrderByDescending(x => x.createdAt).Skip((page - 1) * pageSize).Take(pageSize).ToList();
        }

        public IQueryable<CatalogUser> loadData(string brand, int typeid = 1, decimal minP = -1, decimal maxP = -1)
        {
            IQueryable<CatalogUser> model = from c in db.Catalogs
                                            where c.catalogtypeid == typeid
                                            orderby c.createdAt descending
                                            select new CatalogUser
                                            {
                                                id = c.id,
                                                name = c.name,
                                                pictureuri = c.pictureuri,
                                                price = c.price,
                                                description = c.description,
                                                content = c.content,
                                                quantity = c.quantity,
                                                brandid = c.catalogbrandid
                                            };
            if (!brand.Equals("[]"))
            {
                brand = Regex.Replace(brand, @"\D+", " ");
                model = model.Where(m => brand.Contains(m.brandid.ToString()));
                /*string[] brands = brand.Split(' ');
                IQueryable<CatalogUser> temp = null;
                foreach (var item in brands)
                {
                    if (Int32.TryParse(item, out int bid) && bid != 0)
                    {
                        temp = from m in model
                                where m.brandid != bid
                                select m;
                    }
                }*/
                /*if(temp != null)
                {
                    model = from m in model
                            join te in temp
                            on m.id equals te.id into g
                            from te in g.DefaultIfEmpty()
                            where m.brandid != null && te.brandid == null
                            select m;
                }*/
            }
            if (minP > -1 && maxP > -1)
            {
                minP *= 1000000;
                maxP *= 1000000;
                model = from m in model
                        where m.price >= minP && m.price < maxP
                        select m;
            }
            return model;
        }

        public Catalog getCatalog(int id)
        {
            return db.Catalogs.Find(id);
        }

        public IEnumerable<Catalog> GetAllProductByType(int typeId, int brandId, int id)
        {
            return db.Catalogs.Where(x => x.catalogtypeid == typeId && x.catalogbrandid == brandId && x.id != id).OrderByDescending(x => x.createdAt);
        }

        public CatalogDTO GetCatalogById(int id)
        {
            var model = db.Catalogs.Find(id);
            if (model.catalogtypeid == 1)
            {
                var query = from c in db.Catalogs
                            join t in db.CatalogTypes on c.catalogtypeid equals t.id
                            join b in db.CatalogBrands on c.catalogbrandid equals b.id
                            join sp in db.Specifications on c.id equals sp.catalogid
                            join sm in db.SpecificationsMobiles on c.id equals sm.catalogid
                            where c.id == id
                            select new { c, t, b, sp, sm };
                MobileDTO catalog = new MobileDTO();
                foreach (var item in query)
                {
                    catalog.id = item.c.id;
                    catalog.name = item.c.name;
                    catalog.pictureuri = item.c.pictureuri;
                    catalog.price = item.c.price;
                    catalog.description = item.c.description;
                    catalog.content = item.c.content;
                    catalog.quantity = item.c.quantity;
                    catalog.catalogbrandid = item.c.catalogbrandid;
                    catalog.catalogtypeid = item.c.catalogtypeid;
                    catalog.cpu = item.sp.cpu;
                    catalog.ram = item.sp.ram;
                    catalog.screen = item.sp.screen;
                    catalog.os = item.sp.os;
                    catalog.brand = item.b.brand;
                    catalog.type = item.t.type;
                    catalog.backcamera = item.sm.backcamera;
                    catalog.frontcamera = item.sm.frontcamera;
                    catalog.internalmemory = item.sm.internalmemory;
                    catalog.memorystick = item.sm.memorystick;
                    catalog.sim = item.sm.sim;
                    catalog.batery = item.sm.batery;
                }
                return catalog;
            }
            else
            {
                var query = from c in db.Catalogs
                            join t in db.CatalogTypes on c.catalogtypeid equals t.id
                            join b in db.CatalogBrands on c.catalogbrandid equals b.id
                            join sp in db.Specifications on c.id equals sp.catalogid
                            join sl in db.SpecificationsLaptops on c.id equals sl.catalogid
                            where c.id == id
                            select new { c, t, b, sp, sl };
                LaptopDTO catalog = new LaptopDTO();
                foreach (var item in query)
                {
                    catalog.id = item.c.id;
                    catalog.name = item.c.name;
                    catalog.pictureuri = item.c.pictureuri;
                    catalog.price = item.c.price;
                    catalog.description = item.c.description;
                    catalog.content = item.c.content;
                    catalog.quantity = item.c.quantity;
                    catalog.catalogbrandid = item.c.catalogbrandid;
                    catalog.catalogtypeid = item.c.catalogtypeid;
                    catalog.cpu = item.sp.cpu;
                    catalog.ram = item.sp.ram;
                    catalog.screen = item.sp.screen;
                    catalog.os = item.sp.os;
                    catalog.brand = item.b.brand;
                    catalog.type = item.t.type;
                    catalog.cardscreen = item.sl.cardscreen;
                    catalog.connector = item.sl.connector;
                    catalog.harddrive = item.sl.harddrive;
                    catalog.design = item.sl.design;
                    catalog.size = item.sl.size;
                    catalog.release = item.sl.release;
                }
                return catalog;
            }
        }

        public IEnumerable<CatalogBrand> getAllCatalogBrand(int typeId)
        {

            var result = from c in db.Catalogs
                         join b in db.CatalogBrands on c.catalogbrandid equals b.id
                         where c.catalogtypeid == typeId
                         select b;
            return result.GroupBy(c => c.id)
                  .Select(grp => grp.FirstOrDefault())
                  .ToList();
        }

    }
}
