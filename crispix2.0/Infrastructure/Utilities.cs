using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace crispix2._0.Infrastructure
{
    

    public class Utilities
    {


        private bool _pixLocked
        {
            get
            {
                //get pixLocked from the database
                return true;
            }
        }

        private int _numberOfWeeks
        {
            get
            {
                //get numberOfWeeks from the database
                return 14;
            }
        }

        public bool PixLocked()
        {
            return _pixLocked;
        }

        public int GetNumberOfWeeks()
        {
            return _numberOfWeeks;
        }

    }
}