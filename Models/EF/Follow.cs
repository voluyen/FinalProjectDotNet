namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Follow
    {
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string type { get; set; }

        [Required]
        public string link { get; set; }

        public int order { get; set; }

        public bool hide { get; set; }

        [Required]
        public string icon { get; set; }
    }
}
