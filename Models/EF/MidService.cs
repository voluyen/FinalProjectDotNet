namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MidService")]
    public partial class MidService
    {
        public int id { get; set; }

        [Required]
        public string title { get; set; }

        [Required]
        public string description { get; set; }

        public int order { get; set; }

        public bool hide { get; set; }
    }
}
