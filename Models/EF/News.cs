namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class News
    {
        public int id { get; set; }

        [Required]
        public string content { get; set; }

        public int order { get; set; }

        public bool hide { get; set; }

        [Required]
        public string link { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime date { get; set; }
    }
}
