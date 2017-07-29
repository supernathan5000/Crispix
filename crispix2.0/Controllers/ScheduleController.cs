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

            return View(model);
        }
    }
}