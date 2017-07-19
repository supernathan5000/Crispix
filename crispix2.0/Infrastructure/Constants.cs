using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace crispix2._0.Infrastructure
{
    public class Constants
    {
        
        //public readonly string espnTop25 = "http://sports.espn.go.com/ncf/rankingsindex";

        public static string espnTop25
        {
            get { return "http://sports.espn.go.com/ncf/rankingsindex"; }
        }
        
        public static string GetGamesTableName
        {
            get { return ConfigurationManager.AppSettings["GamesTable"]; }
        }

        public static string GetPixTableName
        {
            get { return ConfigurationManager.AppSettings["PixTable"]; }
        }

        public static string GetPlayersTableName
        {
            get { return ConfigurationManager.AppSettings["PlayersTable"]; }
        }

        public static string GetRankingsTableName
        {
            get { return ConfigurationManager.AppSettings["RankingsTable"]; }
        }

        public static string GetSettingsTableName
        {
            get { return ConfigurationManager.AppSettings["SettingsTable"]; }
        }

        public static string GetTeamsTableName
        {
            get { return ConfigurationManager.AppSettings["TeamsTable"]; }
        }


    }
}