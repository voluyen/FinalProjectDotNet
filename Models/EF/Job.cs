namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Job
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Job()
        {
            Applications = new HashSet<Application>();
        }

        public int id { get; set; }

        public int id_recruiter { get; set; }

        [Required]
        public string title { get; set; }

        [Required]
        public string description { get; set; }

        [Required]
        public string requirements { get; set; }

        public int id_category { get; set; }

        public int location { get; set; }

        public decimal salary { get; set; }

        [Column(TypeName = "date")]
        public DateTime date_posted { get; set; }

        public bool is_active { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Application> Applications { get; set; }

        public virtual Category Category { get; set; }

        public virtual Recruiter Recruiter { get; set; }

        public virtual VietnamProvince VietnamProvince { get; set; }
    }
}
