using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace FinalProjectDotNet.Models.EF
{
	public partial class HRAgencyDbContext : DbContext
	{
		public HRAgencyDbContext()
			: base("name=HRAgencyDbContext")
		{
		}

		public virtual DbSet<AboutU> AboutUs { get; set; }
		public virtual DbSet<Application> Applications { get; set; }
		public virtual DbSet<BannerBottom> BannerBottoms { get; set; }
		public virtual DbSet<Banner> Banners { get; set; }
		public virtual DbSet<Candidate> Candidates { get; set; }
		public virtual DbSet<Category> Categorys { get; set; }
		public virtual DbSet<Contact> Contacts { get; set; }
		public virtual DbSet<Event> Events { get; set; }
		public virtual DbSet<Follow> Follows { get; set; }
		public virtual DbSet<Job> Jobs { get; set; }
		public virtual DbSet<Menu> Menus { get; set; }
		public virtual DbSet<MidService> MidServices { get; set; }
		public virtual DbSet<News> News { get; set; }
		public virtual DbSet<Recruiter> Recruiters { get; set; }
		public virtual DbSet<Service> Services { get; set; }
		public virtual DbSet<Testimonial> Testimonials { get; set; }
		public virtual DbSet<VietnamProvince> VietnamProvinces { get; set; }

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			modelBuilder.Entity<Candidate>()
				.HasOptional(e => e.Application)
				.WithRequired(e => e.Candidate);

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

			modelBuilder.Entity<VietnamProvince>()
				.HasMany(e => e.Jobs)
				.WithRequired(e => e.VietnamProvince)
				.HasForeignKey(e => e.location)
				.WillCascadeOnDelete(false);
		}
	}
}
