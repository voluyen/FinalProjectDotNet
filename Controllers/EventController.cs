using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;

namespace FinalProjectDotNet.Controllers
{
    public class EventController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Event
        //public ActionResult Index()
        //{
        //    return View();
        //}

        public ActionResult getEvent()
		{
            var v = from t in db.Events
                    where t.hide == false
                    orderby t.order
                    select t;

            return PartialView(v.Take(6).ToList());
		}
    }
}