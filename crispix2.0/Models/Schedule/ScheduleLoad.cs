using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.SqlServer.Server;

namespace crispix2._0.Models.Schedule
{
    public class ScheduleLoad
    {
        public List<ScheduleWeek> weeklyGames { get; set; }
    }

    public class ScheduleWeek
    {
        public List<Tuple<string, string>> games;

        public ScheduleWeek(List<Tuple<string, string>> matches)
        {
            games = matches;
        }
    }
}