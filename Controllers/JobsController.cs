
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
using FinalProjectDotNet.Models;
using System.Threading.Tasks;

namespace FinalProjectDotNet.Controllers
{
    public class JobsController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
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
            return View(jobs.ToList());
        }

        public ActionResult Apply(int? id)
		{
            Candidate user_candidate = (Candidate)Session["user_candidate"];
            Application2 application = new Application2();
            application.candidate_id = user_candidate.id;
            application.job_id = (int)id;
            return View(application);
		}

		[HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Apply(Application2 model)
		{
            if (ModelState.IsValid)
            {
                string cover_letter_path = "";
                if (model.cover_letter != null && model.cover_letter.ContentLength > 0)
                {
                    string fileName = Path.GetFileName(model.cover_letter.FileName);
                    string filePath = Path.Combine(Server.MapPath("~/Resume/"), fileName);
                    model.cover_letter.SaveAs(filePath);
                    cover_letter_path = filePath;
                }
                var application = new Application
                {
                    candidate_id = model.candidate_id,
                    job_id = model.job_id,
                    cover_letter = cover_letter_path,
                    date = DateTime.Now

                };
                db.Applications.Add(application);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(model);
        }
	}
}