namespace FinalProjectDotNet.Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Application
    {
        public int id { get; set; }

        public int job_id { get; set; }

        public int candidate_id { get; set; }

        public string cover_letter { get; set; }

        public DateTime? date { get; set; }

        public virtual Candidate Candidate { get; set; }

        public virtual Job Job { get; set; }
    }
}
