using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProjectDotNet.Areas.admin.Controllers
{
    public class bannersController : Controller
    {
        // GET: admin/banners
        public ActionResult Index()
        {
            return View();
        }
    }
}