using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProjectDotNet.Areas.admin.Controllers
{
    public class applicationsController : Controller
    {
        // GET: admin/applications
        public ActionResult Index()
        {
            return View();
        }
    }
}