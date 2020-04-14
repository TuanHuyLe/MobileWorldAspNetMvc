namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class OrderItem
    {
        public int id { get; set; }

        public decimal? unitprice { get; set; }

        public int? unit { get; set; }

        public int catalogid { get; set; }

        public string pictureuri { get; set; }

        [StringLength(50)]
        public string catalogname { get; set; }

        public DateTimeOffset? createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int orderid { get; set; }

        public virtual Order Order { get; set; }
    }
}
