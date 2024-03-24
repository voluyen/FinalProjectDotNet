
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
namespace FinalProjectDotNet.Controllers
{
    public class JobController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Job
        public ActionResult getCategory()
        {
            var v = from t in db.Categorys
                    select t;

            return PartialView(v.ToList());
        }
    }
}