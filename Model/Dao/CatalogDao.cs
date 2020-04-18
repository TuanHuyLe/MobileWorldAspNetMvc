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

        public Catalog detail(int id)
        {
            return db.Catalogs.Where(x => x.id == id).FirstOrDefault();
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
    }
}
