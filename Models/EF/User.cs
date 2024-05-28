namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public int id { get; set; }

        [Required]
        public string username { get; set; }

        [Required]
        public string password { get; set; }

        [Required]
        public string full_name { get; set; }

        [Required]
        public string avt { get; set; }

        public int role { get; set; }

        [Required]
        public string email { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime date_create { get; set; }

        public virtual Candidate Candidate { get; set; }

        public virtual Recruiter Recruiter { get; set; }
    }
}
