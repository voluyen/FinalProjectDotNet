using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
using FinalProjectDotNet.Models;
using EntityState = System.Data.Entity.EntityState;
using System.IO;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;

namespace FinalProjectDotNet.Areas.admin.Controllers
{
    public class CandidatesController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<Candidate> passwordHasher = new PasswordHasher<Candidate>();

        // GET: admin/Candidates
        public ActionResult Index()
        {
            var candidates = db.Candidates;
            return View(candidates.ToList());
        }

        // GET: admin/Candidates/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candidate candidate = db.Candidates.Find(id);
            if (candidate == null)
            {
                return HttpNotFound();
            }
            return View(candidate);
        }

        // GET: admin/Candidates/Create
        public ActionResult Create()
        {
            ViewBag.address = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName");
            return View();
        }

        // POST: admin/Candidates/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(RegisterCandidate model)
        {
            if (ModelState.IsValid)
            {
                string avt_path = "/Avatars/avt.png";
                if (model.avatar_file != null && model.avatar_file.ContentLength > 0)
                {
                    string fileName = Path.GetFileName(model.avatar_file.FileName);
                    string filePath = Path.Combine(Server.MapPath("~/Avatars/"), fileName);
                    model.avatar_file.SaveAs(filePath);
                    avt_path = "/Avatars/" + fileName;
                }

                string resume_path = "";
                if (model.resume != null && model.resume.ContentLength > 0)
                {
                    string fileName = Path.GetFileName(model.resume.FileName);
                    string filePath = Path.Combine(Server.MapPath("~/Resume/"), fileName);
                    model.resume.SaveAs(filePath);
                    resume_path = filePath;
                }

                var candidate = new Candidate
                {
                    username = model.username,
                    full_name = model.full_name,
                    avatar = avt_path,
                    email = model.email,
                    date_create = DateTime.Now,
                    birthdate = model.birthdate,
                    phone_number = model.phone_number,
                    address = model.address,
                    resume = resume_path,
                    skills = model.skills,
                    experience = model.experience,
                };
                candidate.password = passwordHasher.HashPassword(candidate, model.password);
                db.Candidates.Add(candidate);
                await db.SaveChangesAsync();
                ViewBag.address = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", candidate.address);
                return RedirectToAction("Index");
            }

            return View(model);
        }

        // GET: admin/Candidates/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candidate candidate = db.Candidates.Find(id);
            if (candidate == null)
            {
                return HttpNotFound();
            }
            ViewBag.address = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", candidate.address);
            return View(candidate);
        }

        // POST: admin/Candidates/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
		public ActionResult Edit([Bind(Include = "id,full_name,avatar,email,date_create,birthdate,phone_number,address,resume,skills,experience")] Candidate candidate)
        {
            if (ModelState.IsValid)
            {
                db.Entry(candidate).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.address = new SelectList(db.VietnamProvinces, "ProvinceID", "ProvinceName", candidate.address);
            return View(candidate);
        }

        // GET: admin/Candidates/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Candidate candidate = db.Candidates.Find(id);
            if (candidate == null)
            {
                return HttpNotFound();
            }
            return View(candidate);
        }

        // POST: admin/Candidates/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Candidate candidate = db.Candidates.Find(id);
            db.Candidates.Remove(candidate);
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
