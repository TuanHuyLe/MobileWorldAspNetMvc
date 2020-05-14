using Model.EF;
using Model.Mapper;
using Model.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace Model.Dao
{
    public class CatalogDao
    {
        private readonly MobileWorldDbContext db;
        public CatalogDao()
        {
            db = new MobileWorldDbContext();
        }

        public IQueryable<T> GetJoinedCatalog<T>(Expression<Func<JoinTableCatalog, T>> selector)
        {
            return db.Set<Catalog>()
                    .Join(db.Set<CatalogType>(),
                          c => c.catalogtypeid,
                          ct => ct.id,
                          (c, ct) => new { C = c, Ct = ct })
                    .Join(db.Set<CatalogBrand>(),
                          cct => cct.C.catalogbrandid,
                          cb => cb.id,
                          (cct, cb) => new JoinTableCatalog
                          {
                              Catalog = cct.C,
                              CatalogType = cct.Ct,
                              CatalogBrand = cb
                          })
                     .Select(selector);
        }

        public IEnumerable<JoinTableCatalog> ListAllPaging(string search, string brand, string type, int page, int pageSize, int price)
        {
            IQueryable<JoinTableCatalog> model2 = GetJoinedCatalog(x => x);
            if (!string.IsNullOrEmpty(search))
            {
                model2 = from m in model2
                         where m.Catalog.name.Contains(search)
                         select m;
            }
            if (!string.IsNullOrEmpty(type))
            {
                model2 = from m in model2
                         where m.CatalogType.type.Contains(type)
                         select m;
            }
            if (!string.IsNullOrEmpty(brand))
            {
                model2 = from m in model2
                         where m.CatalogBrand.brand.Contains(brand)
                         select m;
            }
            if (price > 0)
            {
                model2 = model2.Where(x => x.Catalog.price > price - 1000000 && x.Catalog.price < price + 1000000);
            }
            return model2.OrderByDescending(x => x.Catalog.createdAt).ToPagedList(page, pageSize);
        }

        public Catalog findById(int id)
        {
            return db.Catalogs.Find(id);
        }

        public CatalogType getTypeById(int id)
        {
            return db.CatalogTypes.Where(x => x.id == id).FirstOrDefault();
        }

        public void Update(Catalog entity)
        {
            try
            {
                var catalog = db.Catalogs.Find(entity.id);
                CatalogMapper.Mapper(catalog, entity);
                db.SaveChanges();
            }
            catch (Exception)
            {
                throw new Exception("Lỗi cập nhật sản phẩm");
            }
        }

        public List<CatalogBrand> getAllBrand()
        {
            var query = from cb in db.CatalogBrands select cb;
            return query.ToList();
        }

        public void delete(int id)
        {
            var catalog = db.Catalogs.Find(id);
            db.Catalogs.Remove(catalog);
            db.SaveChanges();
        }

        public SpecificationMobile getSpecificationMobile(int id)
        {
            var model = db.Specifications.Where(x => x.catalogid == id).FirstOrDefault();
            var model2 = db.SpecificationsMobiles.Where(x => x.catalogid == id).FirstOrDefault();
            return new SpecificationMobile { id = id, Specification = model, SpecificationsMobile = model2 };
        }

        public SpecificationLaptop getSpecificationLaptop(int id)
        {
            var model = db.Specifications.Where(x => x.catalogid == id).FirstOrDefault();
            var model2 = db.SpecificationsLaptops.Where(x => x.catalogid == id).FirstOrDefault();
            return new SpecificationLaptop { id = id, Specification = model, SpecificationsLaptop = model2 };
        }

        public void editSpecificationMobile(SpecificationMobile entity)
        {
            try
            {
                var mobile = db.Specifications.Where(x => x.catalogid == entity.id).FirstOrDefault();
                var smobile = db.SpecificationsMobiles.Where(x => x.catalogid == entity.id).FirstOrDefault();
                SpecificationsMapper.mobileMapper(mobile, smobile, entity);
                db.SaveChanges();
            }
            catch (Exception)
            {
                throw new Exception("Cập nhật thông số kĩ thuật điện thoại lỗi");
            }
        }

        public void editSpecificationLaptop(SpecificationLaptop entity)
        {
            try
            {
                var laptop = db.Specifications.Where(x => x.catalogid == entity.id).FirstOrDefault();
                var slaptop = db.SpecificationsLaptops.Where(x => x.catalogid == entity.id).FirstOrDefault();
                SpecificationsMapper.laptopMapper(laptop, slaptop, entity);
                db.SaveChanges();
            }
            catch (Exception)
            {
                throw new Exception("Cập nhật thông số kĩ thuật laptop lỗi");
            }
        }

        public bool addMobileDTO(MobileDTO catalogDTO)
        {
            using (var dbContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var catalog = new Catalog()
                    {
                        name = catalogDTO.name,
                        pictureuri = catalogDTO.pictureuri,
                        price = catalogDTO.price,
                        description = catalogDTO.description,
                        content = catalogDTO.content,
                        quantity = catalogDTO.quantity,
                        catalogbrandid = catalogDTO.catalogbrandid,
                        catalogtypeid = catalogDTO.catalogtypeid,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now
                    };
                    db.Catalogs.Add(catalog);
                    db.SaveChanges();

                    var id = catalog.id;

                    //specifications
                    var spe = new Specification()
                    {
                        cpu = catalogDTO.cpu,
                        ram = catalogDTO.ram,
                        screen = catalogDTO.screen,
                        os = catalogDTO.os,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now,
                        catalogid = id
                    };
                    db.Specifications.Add(spe);
                    db.SaveChanges();

                    //mobile
                    var speM = new SpecificationsMobile()
                    {
                        backcamera = catalogDTO.backcamera,
                        frontcamera = catalogDTO.frontcamera,
                        internalmemory = catalogDTO.internalmemory,
                        memorystick = catalogDTO.memorystick,
                        sim = catalogDTO.sim,
                        batery = catalogDTO.batery,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now,
                        catalogid = id
                    };
                    db.SpecificationsMobiles.Add(speM);
                    db.SaveChanges();

                    dbContextTransaction.Commit();
                }
                catch (Exception)
                {
                    dbContextTransaction.Rollback();
                    return false;
                }
            }
            return true;
        }

        public bool addLaptopDTO(LaptopDTO catalogDTO)
        {
            using (var dbContextTransaction = db.Database.BeginTransaction())
            {
                try
                {
                    var catalog = new Catalog()
                    {
                        name = catalogDTO.name,
                        pictureuri = catalogDTO.pictureuri,
                        price = catalogDTO.price,
                        description = catalogDTO.description,
                        content = catalogDTO.content,
                        quantity = catalogDTO.quantity,
                        catalogbrandid = catalogDTO.catalogbrandid,
                        catalogtypeid = catalogDTO.catalogtypeid,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now
                    };
                    db.Catalogs.Add(catalog);
                    db.SaveChanges();

                    var id = catalog.id;

                    //specifications
                    var spe = new Specification()
                    {
                        cpu = catalogDTO.cpu,
                        ram = catalogDTO.ram,
                        screen = catalogDTO.screen,
                        os = catalogDTO.os,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now,
                        catalogid = id
                    };
                    db.Specifications.Add(spe);
                    db.SaveChanges();

                    //laptop
                    var speL = new SpecificationsLaptop()
                    {
                        cardscreen = catalogDTO.cardscreen,
                        connector = catalogDTO.connector,
                        harddrive = catalogDTO.harddrive,
                        design = catalogDTO.design,
                        size = catalogDTO.size,
                        release = catalogDTO.release,
                        createdAt = DateTime.Now,
                        updatedAt = DateTime.Now,
                        catalogid = id
                    };
                    db.SpecificationsLaptops.Add(speL);
                    db.SaveChanges();

                    dbContextTransaction.Commit();
                }
                catch (Exception)
                {
                    dbContextTransaction.Rollback();
                    return false;
                }
            }
            return true;
        }

        // catalog brand
        public int AddNewBrand(CatalogBrand entity)
        {
            try
            {
                entity.createdAt = DateTime.Now;
                entity.updatedAt = DateTime.Now;
                var sl = db.CatalogBrands.Where(x => x.brand == entity.brand).Count();
                if (sl > 0) return 0;
                db.CatalogBrands.Add(entity);
                db.SaveChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        public CatalogBrand findCatalogBrandById(int id)
        {
            return db.CatalogBrands.Find(id);
        }

        public int UpdateCatalogBrand(CatalogBrand entity)
        {
            try
            {
                var brand = db.CatalogBrands.Find(entity.id);
                brand.updatedAt = DateTime.Now;
                brand.brand = entity.brand;
                brand.pictureurl = entity.pictureurl;
                db.SaveChanges();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int DeleteBrand(int id)
        {
            try
            {
                var check = db.Catalogs.Count(x => x.catalogbrandid == id);
                if (check > 0)
                {
                    return 0;
                }
                var brand = db.CatalogBrands.Find(id);
                db.CatalogBrands.Remove(brand);
                db.SaveChanges();
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
            /*var test = from c in db.Catalogs
                       join b in db.Bills on c.id equals b.catalogid
                       join h in db.Histories on c.id equals h.catalogid
                       select new { c, b, h };
            var groupby = from t in test
                          group t by t.c.id into g
                          select new
                          {
                              catalogid = g.Key,
                              catalogname = g.Select(x => x.c.name),
                              brand = g.Select(x => x.b.name),
                              price = g.Select(x => x.c.price),
                              unitprice = g.Select(x => x.h.inputprice),
                              quantity = g.Select(x => x.c.name),
                              unit = g.Select(x => x.b.unit)
                          };
*/

        }

    }
}
