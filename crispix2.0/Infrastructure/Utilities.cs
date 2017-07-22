using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using crispix2._0.Models.Grid;

namespace crispix2._0.Infrastructure
{


    public static class Utilities
    {


        private static bool _pixLocked
        {
            get
            {
                //get pixLocked from the database
                return true;
            }
        }

        private static int _numberOfWeeks
        {
            get
            {
                //get numberOfWeeks from the database
                return int.Parse(ConfigurationManager.AppSettings["numberOfWeeks"]);
            }
        }

        public static int GetNumberOfWeeks()
        {
            return _numberOfWeeks;
        }

        public static bool PixLocked()
        {
            return _pixLocked;
        }

        public static string GetCurrentWeek()
        {
            return ConfigurationManager.AppSettings["currentWeek"];
        }

    }
        
}