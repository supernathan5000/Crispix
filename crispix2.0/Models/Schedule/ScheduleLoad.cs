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
        public int numRows { get; set; }
    }

    public class ScheduleWeek
    {
        public string weekName;
        public List<ScheduleGame> games;

        public ScheduleWeek(string _weekName, List<ScheduleGame> _games)
        {
            weekName = _weekName;
            games = _games;
        }
    }

    public class ScheduleGame
    {
        public string home;
        public string away;
        public string winner;
        public string loser;
        public int winScore;
        public int loseScore;

        public ScheduleGame(string _home, string _away, string _winner, string _loser, int _winScore, int _loseScore)
        {
            home = _home;
            away = _away;
            winner = _winner;
            loser = _loser;
            winScore = _winScore;
            loseScore = _loseScore;
        }
    }
}