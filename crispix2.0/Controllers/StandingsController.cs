using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class StandingsController : Controller
    {
        // GET: Standings
        public ActionResult Standings()
        {
            return View("Standings");
        }
    }
}