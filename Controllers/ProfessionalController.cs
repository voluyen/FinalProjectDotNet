using FinalProjectDotNet.Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProjectDotNet.Controllers
{
    public class ProfessionalController : Controller
    {
        // GET: Professional
        public HRAgencyDbContext db = new HRAgencyDbContext();
        public ActionResult getCandidate()
        {
            var v = from t in db.Candidates
                    select t;

            return PartialView(v.ToList());
        }
        public ActionResult getDetail(int? id)
        {
            var candidate = db.Candidates.Where(j => j.id == id.Value);
            return PartialView(candidate.ToList());
        }

    }
}