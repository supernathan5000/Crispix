using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using crispix2._0.Models;
using crispix2._0.Infrastructure;

namespace crispix2._0.Controllers
{
    public class ScheduleController : Controller
    {
        // GET: Schedule
        public ActionResult Schedule()
        {
            var model = new Models.Schedule.ScheduleLoad();

            model.weeklyGames = Queries.GetSchedule();

            if (model.weeklyGames.Count < 5)
            {
                model.numRows = 1;
            }
            else if (model.weeklyGames.Count < 9)
            {
                model.numRows = 2;
            }
            else if (model.weeklyGames.Count < 13)
            {
                model.numRows = 3;
            }
            else
            {
                model.numRows = 4;
            }

            ViewBag.currentWeek = Utilities.GetCurrentWeek();

            return View(model);
        }
    }
}