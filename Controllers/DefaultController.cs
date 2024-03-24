using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProjectDotNet.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Default
        public ActionResult Home()
        {
            return View();
        }
        public ActionResult Jobs()
        {
            return View();
        }
        public ActionResult Professionals()
        {
            return View();
        }
        public ActionResult Events()
        {
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}