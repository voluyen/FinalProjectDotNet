namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Recruiter
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Recruiter()
        {
            Jobs = new HashSet<Job>();
        }

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

        public string company_name { get; set; }

        [StringLength(50)]
        public string phone { get; set; }

        public int? address { get; set; }

        public string website { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Job> Jobs { get; set; }

        public virtual VietnamProvince VietnamProvince { get; set; }
    }
}
