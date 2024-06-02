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
    public class CandidatesController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        private readonly PasswordHasher<Candidate> passwordHasher = new PasswordHasher<Candidate>();
        // GET: Candidate
        public ActionResult Index()
        {
            Candidate user_candidate = (Candidate)Session["user_candidate"];

            Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];
            if (user_candidate != null)
            {
                return View(new { user = user_candidate });
            }
            if (user_recruiter != null)
            {
                return View(new { user = user_recruiter });
            }

            return View();
        }


    }
}