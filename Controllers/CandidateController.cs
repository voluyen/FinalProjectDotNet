using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
using FinalProjectDotNet.Models;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using System.Data.Entity;
using System.IO;

namespace FinalProjectDotNet.Controllers
{
    public class CandidateController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<Candidate> passwordHasher = new PasswordHasher<Candidate>();
        // GET: Candidate
        public ActionResult Index()
        {
            Candidate user_candidate = (Candidate)Session["user_candidate"];
            if (user_candidate != null)
            {
                return View(new { user = user_candidate });
            }

            return RedirectToAction("Home", "Default");
        }

        public ActionResult GetApplication()
        {
            Candidate user_candidate = (Candidate)Session["user_candidate"];
            if (user_candidate == null)
                return RedirectToAction("Home", "Default");
            var applications = db.Applications.Where(j => j.candidate_id == user_candidate.id);

            return View(applications.ToList());
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(Login model)
        {
            var user = await db.Candidates.FirstOrDefaultAsync(u => u.username == model.username);

            if (user == null || passwordHasher.VerifyHashedPassword(user, user.password, model.password) != PasswordVerificationResult.Success)
            {
                ModelState.AddModelError("", "Sai username hoặc password.");
                return View(model);
            }
            Session["user_candidate"] = user;
            Session["full_name"] = user.full_name;
            Console.WriteLine("full_name: " + user.full_name);

            return RedirectToAction("Home", "Default");
        }

        public ActionResult Signup()
        {
            var location_name = (from t in db.VietnamProvinces select t).ToList();

            ViewBag.location_name = new SelectList(location_name, "ProvinceID", "ProvinceName");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Signup(RegisterCandidate model)
        {
            if (ModelState.IsValid)
            {
                if (db.Candidates.Any(r => r.username == model.username))
                {
                    ModelState.AddModelError("username", "Username already exists. Please choose a different username.");
                    return View(model);
                }

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
                return RedirectToAction("Login");
            }

            return View(model);
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "User");
        }
    }
}