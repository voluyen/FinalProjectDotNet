using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Mvc;

namespace FinalDotnet.Controllers
{
    public class MenuController : Controller
    {
        // GET: Menu
        FinalDotnetEntities _db = new FinalDotnetEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult getMenu()
        {
            var v = from t in _db.menu
                    where t.hide = true
                    orderby t.order ascending
                    select t;
            return PartialView(v.ToList());
        }
    }
}