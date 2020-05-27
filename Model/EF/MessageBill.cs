namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MessageBill")]
    public partial class MessageBill
    {
        public int id { get; set; }

        public int countChoDuyet { get; set; }

        public int countDaHuy { get; set; }

        public DateTimeOffset? updateChoDuyetAt { get; set; }

        public DateTimeOffset? updateDaHuyAt { get; set; }
    }
}
