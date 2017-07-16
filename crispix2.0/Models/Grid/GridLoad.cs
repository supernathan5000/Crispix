using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.SqlServer.Server;

namespace crispix2._0.Models.Grid
{
    public class GridLoad
    {
        public List<GridRow> GridList { get; set; }
    }

    public class GridRow
    {
        string username;
        string record;
        string[] pix = new string[10];

        public GridRow(string _username, string _record, string[] _pix)
        {
            username = _username;
            record = _record;
            pix = _pix;
        }
    }
}