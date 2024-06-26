namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        [Required]
        public string link { get; set; }

        [Required]
        [StringLength(50)]
        public string meta { get; set; }

        public bool hide { get; set; }

        public int order { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime datebegin { get; set; }
    }
}
