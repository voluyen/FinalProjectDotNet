using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;

namespace FinalProjectDotNet.Controllers
{
    public class DefaultController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Default
        public ActionResult Home()
        {
            //ViewBag.category_select = id;
            ViewBag.category = db.Categorys.ToList();
            ViewBag.location = db.VietnamProvinces.ToList();

            return View();
        }
        public ActionResult Jobs(string search,int? id, int? id_location, string salary)
        {
            var jobs = db.Jobs.AsQueryable();
            if (!String.IsNullOrEmpty(search))
            {
                jobs = jobs.Where(j => j.title.Contains(search));
            }
           
            ViewBag.category_select = id;
            ViewBag.category = db.Categorys.ToList();
            ViewBag.location_select = id_location;
            ViewBag.location = db.VietnamProvinces.ToList();
            if (id.HasValue)
            {
                jobs = jobs.Where(j => j.Category.id == id.Value);
            }
            if (id_location.HasValue)
            {
                jobs = jobs.Where(j => j.VietnamProvince.ProvinceID == id_location.Value);
            }
            if (!String.IsNullOrEmpty(salary))
            {
                string[] parts = salary.Split(';');
                int max = Int32.Parse(parts[1]);
                int min = Int32.Parse(parts[0]);
                jobs = jobs.Where(j => j.salary >= min && j.salary <= max);
            }

            return View(jobs.ToList());
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