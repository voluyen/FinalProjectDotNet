namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Candidate
    {
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string username { get; set; }

        [Required]
        public string password { get; set; }

        [Required]
        public string full_name { get; set; }

        [Required]
        public string avatar { get; set; }

        [Required]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime date_create { get; set; }

        [Column(TypeName = "date")]
        public DateTime? birthdate { get; set; }

        [StringLength(50)]
        public string phone_number { get; set; }

        public string address { get; set; }

        public string resume { get; set; }

        public string skills { get; set; }

        public string experience { get; set; }

        public virtual Application Application { get; set; }
    }
}
