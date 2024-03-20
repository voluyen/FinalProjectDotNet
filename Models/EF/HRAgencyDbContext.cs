using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FinalProjectDotNet.Models.EF
{
	public partial class HRAgencyDbContext : DbContext
	{
		public HRAgencyDbContext()
			: base("name=HRAgencyDbContext1")
		{
		}

		public virtual DbSet<Application> Applications { get; set; }
		public virtual DbSet<Candidate> Candidates { get; set; }
		public virtual DbSet<Category> Categorys { get; set; }
		public virtual DbSet<Job> Jobs { get; set; }
		public virtual DbSet<Menu> Menus { get; set; }
		public virtual DbSet<Recruiter> Recruiters { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Candidate>()
				.HasMany(e => e.Applications)
				.WithRequired(e => e.Candidate)
				.HasForeignKey(e => e.candidate_id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Category>()
				.HasMany(e => e.Jobs)
				.WithRequired(e => e.Category)
				.HasForeignKey(e => e.id_category)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Job>()
				.Property(e => e.salary)
				.HasPrecision(18, 0);

			modelBuilder.Entity<Job>()
				.HasMany(e => e.Applications)
				.WithRequired(e => e.Job)
				.HasForeignKey(e => e.job_id)
				.WillCascadeOnDelete(false);

			modelBuilder.Entity<Recruiter>()
				.HasMany(e => e.Jobs)
				.WithRequired(e => e.Recruiter)
				.HasForeignKey(e => e.id_recruiter)
				.WillCascadeOnDelete(false);
		}
	}
}
