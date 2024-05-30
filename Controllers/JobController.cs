
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
namespace FinalProjectDotNet.Controllers
{
    public class JobController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Job
        public ActionResult getCategory()
        {
            var v = from t in db.Categorys
                    select t;

            return PartialView(v.ToList());
        }

        public ActionResult getJob()
        {
            var v = from t in db.Jobs
                    select t;

            return PartialView(v.ToList());
        }
        public ActionResult addJob()
        {

            var category_name = (from t in db.Categorys select t).ToList();
            var location_name = (from t in db.VietnamProvinces select t).ToList();

            ViewBag.category_name = new SelectList(category_name, "id", "name");
            ViewBag.location_name = new SelectList(location_name, "ProvinceID", "ProvinceName");
            return View();
        }
        [HttpPost]
        public ActionResult addJob(Job job)
        {
            job.date_posted = DateTime.Now;
            job.is_active = true;
            Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];

            job.id_recruiter = user_recruiter.id;

            db.Jobs.Add(job);
            db.SaveChanges();
            return RedirectToAction("Jobs", "Default");
        }
        public ActionResult getDetail(int? id)
        {
            var jobs = db.Jobs.Where(j => j.id == id.Value);
            return PartialView(jobs.ToList());
        }
    }
}