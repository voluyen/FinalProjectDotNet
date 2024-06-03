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
    public class UserController : Controller
    {
        private HRAgencyDbContext db = new HRAgencyDbContext();
        public ActionResult Index()
        {
            Candidate user_candidate = (Candidate)Session["user_candidate"];

            Recruiter user_recruiter = (Recruiter)Session["user_recruiter"];
            if (user_candidate != null)
            {
                return RedirectToAction("Home", "Default", new { user = user_candidate });
            }
            if (user_recruiter != null)
            {
                return RedirectToAction("Home", "Default", new { user = user_recruiter });
            }
            return View();
        }
        
    }
}