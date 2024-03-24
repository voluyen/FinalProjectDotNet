namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BannerBottom")]
    public partial class BannerBottom
    {
        public int id { get; set; }

        [Required]
        public string img { get; set; }

        [Required]
        public string description { get; set; }
    }
}
