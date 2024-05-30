using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;

namespace FinalProjectDotNet.Controllers
{
	public class HomeController : Controller
	{
		public HRAgencyDbContext db = new HRAgencyDbContext();

        public ActionResult getMenu()
		{
			var v = from t in db.Menus
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.ToList());
		}

		public ActionResult getNews()
		{
			var v = from t in db.News
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.ToList());
		}

		public ActionResult getContact()
		{
			var v = from t in db.Contacts
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.ToList());
		}

		public ActionResult getFollow()
		{
			var v = from t in db.Follows
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.ToList());
		}

		public ActionResult getAboutUs()
		{
			var v = db.AboutUs.FirstOrDefault();
			return PartialView(v);
		}

		public ActionResult getBannerBottom()
		{
			var v = db.BannerBottoms.FirstOrDefault();
			return PartialView(v);
		}

		public ActionResult getService()
		{
			var v = from t in db.Services
					orderby t.order
					select t;
			return PartialView(v.ToList());
		}

		public ActionResult getMidService()
		{
			var v = from t in db.MidServices
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.ToList());
		}

		public ActionResult getTestimonial()
		{
			var v = from t in db.Testimonials
					where t.hide == false
					orderby t.order
					select t;

			return PartialView(v.Take(3).ToList());
		}

	}
}