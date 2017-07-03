using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class RulesController : Controller
    {
        // GET: Rules
        public ActionResult Index()
        {
            //ViewBag.Title = "Crispix - Rules";
            return View("Rules");
        }
    }
}