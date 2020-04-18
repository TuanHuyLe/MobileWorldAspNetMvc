using Model.EF;
using System;

namespace Model.Mapper
{
    public class CatalogMapper
    {
        public static Catalog Mapper(Catalog catalog, Catalog entity)
        {
            catalog.name = entity.name;
            catalog.pictureuri = entity.pictureuri;
            catalog.price = entity.price;
            catalog.quantity = entity.quantity;
            catalog.updatedAt = DateTime.Now;
            catalog.catalogbrandid = entity.catalogbrandid;
            catalog.catalogtypeid = entity.catalogtypeid;
            catalog.description = entity.description;
            catalog.content = entity.content;
            return catalog;
        }
    }
}
