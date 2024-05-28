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
    public class ApplicationsController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();

        // GET: admin/Applications1
        public ActionResult Index()
        {
            var applications = db.Applications.Include(a => a.Candidate).Include(a => a.Job);
            return View(applications.ToList());
        }

        // GET: admin/Applications1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        // GET: admin/Applications1/Create
        public ActionResult Create()
        {
            ViewBag.candidate_id = new SelectList(db.Candidates, "id", "name");
            ViewBag.job_id = new SelectList(db.Jobs, "id", "title");
            return View();
        }

        // POST: admin/Applications1/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,job_id,candidate_id,cover_letter,date")] Application application)
        {
            if (ModelState.IsValid)
            {
                db.Applications.Add(application);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.candidate_id = new SelectList(db.Candidates, "id", "name", application.candidate_id);
            ViewBag.job_id = new SelectList(db.Jobs, "id", "title", application.job_id);
            return View(application);
        }

        // GET: admin/Applications1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            ViewBag.candidate_id = new SelectList(db.Candidates, "id", "name", application.candidate_id);
            ViewBag.job_id = new SelectList(db.Jobs, "id", "title", application.job_id);
            return View(application);
        }

        // POST: admin/Applications1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,job_id,candidate_id,cover_letter,date")] Application application)
        {
            if (ModelState.IsValid)
            {
                db.Entry(application).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.candidate_id = new SelectList(db.Candidates, "id", "name", application.candidate_id);
            ViewBag.job_id = new SelectList(db.Jobs, "id", "title", application.job_id);
            return View(application);
        }

        // GET: admin/Applications1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Application application = db.Applications.Find(id);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        // POST: admin/Applications1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Application application = db.Applications.Find(id);
            db.Applications.Remove(application);
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
