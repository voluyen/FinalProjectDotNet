namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Banner
    {
        public int id { get; set; }

        [Required]
        public string img { get; set; }

        public int order { get; set; }
    }
}
