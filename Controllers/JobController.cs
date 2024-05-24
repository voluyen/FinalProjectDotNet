
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


            ViewBag.category_name = new SelectList(category_name, "id", "name");
            return View();
        }
        [HttpPost]
        public ActionResult addJob(Job job)
        {
            job.date_posted = DateTime.Now;
            job.is_active = true;
            job.id_recruiter = 31;
            db.Jobs.Add(job);
            db.SaveChanges();
            return RedirectToAction("Jobs", "Default");
        }
    }
}