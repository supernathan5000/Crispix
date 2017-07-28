using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using crispix2._0.Models.Standings;
using crispix2._0.Models;

namespace crispix2._0.Controllers
{
    public class StandingsController : Controller
    {
        // GET: Standings
        public ActionResult Standings()
        {

            StandingsLoad model = new StandingsLoad();

            model.StandingsList = Queries.GetStandingsList();

            model.weekNames = Queries.GetWeekNames();

            return View(model);
        }
    }
}