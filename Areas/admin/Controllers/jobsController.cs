using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
using EntityState = System.Data.Entity.EntityState;

namespace FinalProjectDotNet.Areas.admin.Controllers
{
    public class JobsController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();

        // GET: admin/Jobs1
        public ActionResult Index()
        {
            var jobs = db.Jobs.Include(j => j.Category).Include(j => j.Recruiter);
            return View(jobs.ToList());
        }

        // GET: admin/Jobs1/Details/5
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

        // GET: admin/Jobs1/Create
        public ActionResult Create()
        {
            ViewBag.id_category = new SelectList(db.Categorys, "id", "name");
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "name");
            return View();
        }

        // POST: admin/Jobs1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,title,description,id_category,location,salary,date_posted,is_active,id_recruiter")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.Jobs.Add(job);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.id_category = new SelectList(db.Categorys, "id", "name", job.id_category);
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "name", job.id_recruiter);
            return View(job);
        }

        // GET: admin/Jobs1/Edit/5
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
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "name", job.id_recruiter);
            return View(job);
        }

        // POST: admin/Jobs1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,title,description,id_category,location,salary,date_posted,is_active,id_recruiter")] Job job)
        {
            if (ModelState.IsValid)
            {
                db.Entry(job).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_category = new SelectList(db.Categorys, "id", "name", job.id_category);
            ViewBag.id_recruiter = new SelectList(db.Recruiters, "id", "name", job.id_recruiter);
            return View(job);
        }

        // GET: admin/Jobs1/Delete/5
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

        // POST: admin/Jobs1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Job job = db.Jobs.Find(id);
            db.Jobs.Remove(job);
            db.SaveChanges();
            return RedirectToAction("Index");
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
