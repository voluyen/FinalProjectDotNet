using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
using FinalProjectDotNet.Models;
using Microsoft.AspNetCore.Identity;
using System.Data.Entity;
using System.IO;
using EntityState = System.Data.Entity.EntityState;
using System.Net;


namespace FinalProjectDotNet.Controllers
{
    public class RecruiterController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<Recruiter> passwordHasher = new PasswordHasher<Recruiter>();

        // GET: Recruiter
        public ActionResult Index()
        {
            Candidate user_candidate = (Candidate)Session["user_candidate"];

            Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];
            if (user_candidate != null)
            {
                return View( new { user = user_candidate });
            }
            if (user_recruiter != null)
            {
                return View(new {user = user_recruiter });
            }

            return View();
        }
        public ActionResult GetJob()    
        {

            Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];
            var jobs = db.Jobs.Where(j => j.id_recruiter == user_recruiter.id);

            return View(jobs.ToList());
        }


        // GET: admin/Jobs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // GET: admin/Jobs/Create
        public ActionResult Create()
        {
            ViewBag.id_category = new SelectList(db.Categorys, "id", "name");
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "username");
            ViewBag.location = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName");
            return View();
        }

        // POST: admin/Jobs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_recruiter,title,description,requirements,id_category,location,salary,is_active")] Job job)
        {
            if (ModelState.IsValid)
            {
                Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];
                job.id_recruiter = user_recruiter.id;
                job.date_posted = DateTime.Now;
                db.Jobs.Add(job);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_category = new SelectList(db.Categorys, "id", "name", job.id_category);
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "username", job.id_recruiter);
            ViewBag.location = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", job.location);
            return RedirectToAction("GetJob","Recruiter");
        }

        // GET: admin/Jobs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            ViewBag.id_category = new SelectList(db.Categorys, "id", "name", job.id_category);
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "username", job.id_recruiter);
            ViewBag.location = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", job.location);
            return View(job);
        }

        // POST: admin/Jobs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,description,requirements,id_category,location,salary,date_posted,is_active")] Job job)
        {
            if (ModelState.IsValid)
            {

                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_category = new SelectList(db.Categorys, "id", "name", job.id_category);
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "username", job.id_recruiter);
            ViewBag.location = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", job.location);
            return RedirectToAction("GetJob", "Recruiter");
        }

        // GET: admin/Jobs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Job job = db.Jobs.Find(id);
            if (job == null)
            {
                return HttpNotFound();
            }
            return View(job);
        }

        // POST: admin/Jobs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
            db.SaveChanges();
            return RedirectToAction("GetJob", "Recruiter");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


    }
}