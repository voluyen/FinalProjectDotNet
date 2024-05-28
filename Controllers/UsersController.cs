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
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using System.IO;

namespace FinalProjectDotNet.Controllers
{
    public class UsersController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<User> passwordHasher = new PasswordHasher<User>();

        // GET: Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.Candidate).Include(u => u.Recruiter);
            return View(users.ToList());
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> Login(string username, string password)
        {
            var user = await db.Users
                .FirstOrDefaultAsync(u => u.username == username);

            if (user == null || passwordHasher.VerifyHashedPassword(user, user.password, password) != PasswordVerificationResult.Success)
            {
                ModelState.AddModelError("", "Invalid login attempt.");
                return View();
            }

            // Code to handle successful login
            // For example, setting up session or authentication

            return RedirectToAction("Index", "Home");
        }

        public ActionResult Signup()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Signup(RegisterModel model)
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

                var user = new User
                {
                    username = model.username,
                    full_name = model.full_name,
                    avt = avt_path,
                    role = model.role,
                    email = model.email,
                    date_create = DateTime.Now
                };
                user.password = passwordHasher.HashPassword(user, model.password);
                db.Users.Add(user);
                await  db.SaveChangesAsync();

                if (model.role == 1)
                {
                    var candidate = new Candidate
                    {
                        id = user.id
                    };
                    db.Candidates.Add(candidate);
                    await db.SaveChangesAsync();
				}
				else
				{
                    var recruiter = new Recruiter
                    {
                        id = user.id
                    };
                    db.Recruiters.Add(recruiter);
                    await db.SaveChangesAsync();
                }
                return RedirectToAction("Login");
            }
            
            return View(model);
        }

    }
}
