﻿namespace Model.EF
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public partial class Bill
    {
        public int id { get; set; }
        public decimal price { get; set; }
        public int unit { get; set; }

        public int catalogid { get; set; }

        public string pictureuri { get; set; }

        [StringLength(255)]
        public string name { get; set; }

        public int status { get; set; }

        public DateTimeOffset createdAt { get; set; }

        public DateTimeOffset? updatedAt { get; set; }

        public int userid { get; set; }

        [StringLength(255)]
        public string shiptoaddress { get; set; }

        [StringLength(255)]
        public string notebuy { get; set; }

        [StringLength(12)]
        public string phone { get; set; }

        [StringLength(50)]
        public string username { get; set; }

        public virtual User User { get; set; }

        public virtual Notification Notification { get; set; }
    }
}
