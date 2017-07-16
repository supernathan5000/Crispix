using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using crispix2._0.Models.Standings;

namespace crispix2._0.Controllers
{
    public class StandingsController : Controller
    {
        // GET: Standings
        public ActionResult Standings()
        {
            StandingsLoad standings = new StandingsLoad();

            GetStandings(standings);

            return View(standings);
        }

        private void GetStandings(StandingsLoad standings)
        {
            //build the query to get the standings

            //foreach result create a StandingsRow and add it to the standings.StandingsList
        }
    }
}