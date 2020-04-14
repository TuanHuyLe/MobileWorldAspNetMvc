namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MobileWorldDbContext : DbContext
    {
        public MobileWorldDbContext()
            : base("name=MobileWorld")
        {
        }

        public virtual DbSet<BasketItem> BasketItems { get; set; }
        public virtual DbSet<Basket> Baskets { get; set; }
        public virtual DbSet<CatalogBrand> CatalogBrands { get; set; }
        public virtual DbSet<Catalog> Catalogs { get; set; }
        public virtual DbSet<CatalogType> CatalogTypes { get; set; }
        public virtual DbSet<OrderItem> OrderItems { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Specification> Specifications { get; set; }
        public virtual DbSet<SpecificationsLaptop> SpecificationsLaptops { get; set; }
        public virtual DbSet<SpecificationsMobile> SpecificationsMobiles { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
