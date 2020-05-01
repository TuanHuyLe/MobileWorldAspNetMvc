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

        public List<CatalogBrand> getAllCatalogBrand(int typeId = -1)
        {
            var result = from c in db.Catalogs
                         join b in db.CatalogBrands on c.catalogbrandid equals b.id
                         select new { b, c };
            if (typeId > 0)
            {
                result = from rs in result
                         where rs.c.catalogtypeid == typeId
                         select rs;
            }
            return result.Select(x => x.b).GroupBy(c => c.id)
                  .Select(grp => grp.FirstOrDefault())
                  .ToList();
        }

    }
}
