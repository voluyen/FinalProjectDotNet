using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FinalProjectDotNet.Models.EF;
namespace FinalProjectDotNet.Controllers
{
    public class DataController : Controller
    {
        public HRAgencyDbContext db = new HRAgencyDbContext();
        // GET: Data
    }
}