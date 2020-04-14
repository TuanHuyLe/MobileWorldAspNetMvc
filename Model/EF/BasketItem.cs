namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BasketItem
    {
        public int id { get; set; }

        public int catalogitemid { get; set; }

        public int quantity { get; set; }

        public decimal unitprice { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int basketid { get; set; }

        public virtual Basket Basket { get; set; }
    }
}
