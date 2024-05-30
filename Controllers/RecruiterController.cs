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

namespace FinalProjectDotNet.Controllers
{
    public class RecruiterController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<Recruiter> passwordHasher = new PasswordHasher<Recruiter>();

        // GET: Recruiter
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(Login model)
        {
            var user = await db.Recruiters.FirstOrDefaultAsync(u => u.username == model.username);

            if (user == null || passwordHasher.VerifyHashedPassword(user, user.password, model.password) != PasswordVerificationResult.Success)
            {
                ModelState.AddModelError("", "Sai username hoặc password.");
                return View(model);
            }

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Signup(RegisterRecruiter model)
        {
            if (ModelState.IsValid)
            {
                if (db.Recruiters.Any(r => r.username == model.username))
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

                var recruiter = new Recruiter
                {
                    username = model.username,
                    full_name = model.full_name,
                    avatar = avt_path,
                    email = model.email,
                    date_create = DateTime.Now,
                    company_name = model.company_name,
                    phone = model.phone_number,
                    address = model.address,
                    website =  model.website
                };
                recruiter.password = passwordHasher.HashPassword(recruiter, model.password);
                db.Recruiters.Add(recruiter);
                await db.SaveChangesAsync();
                return RedirectToAction("Login");
            }

            return View(model);
        }
    }
}