using Model.EF;

namespace Model.Models
{
    public class JoinTableCatalog
    {
        public Catalog Catalog { get; set; }
        public CatalogBrand CatalogBrand { get; set; }
        public CatalogType CatalogType { get; set; }
    }
}
