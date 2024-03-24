using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;

namespace FinalProjectDotNet.Controllers
{
    public class ContactController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Contact
        //public ActionResult Index()
        //{
        //    return View();
        //}
        public ActionResult getContact()
		{
            var v = from t in db.Contacts
                    where t.hide == false
                    orderby t.order
                    select t;

            return PartialView(v.ToList());
        }
    }
}