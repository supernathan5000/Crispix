using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.SqlServer.Server;
using crispix2._0.Infrastructure;

namespace crispix2._0.Models.Standings
{
    public class StandingsLoad
    {
        public List<StandingsRow> StandingsList { get; set; }
        public int NumberOfWeeks = new Utilities().GetNumberOfWeeks();
    }

    public class StandingsRow
    {
        public string username;
        public string record;
        public List<string> winLoss;
        public bool userPaid;

        public StandingsRow(string _username, string _record, string[] winsLosses, bool _userPaid)
        {
            username = _username;
            record = _record;
            winLoss = new List<string>(winsLosses);
            userPaid = _userPaid;
        }
    }
}