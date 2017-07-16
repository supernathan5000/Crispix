using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using crispix2._0.Models.Grid;

namespace crispix2._0.Controllers
{
    public class GridController : Controller
    {
        // GET: Grid
        public ActionResult Grid()
        {

            GridLoad model = new GridLoad();

            //GetGrid(model);
            

            return View(model);
        }

        //private void GetGrid(GridLoad model)
        //{
        //    //create the sql to get the grid from the database
        //    /*
        //    select (username, record) as player, P0, P1, P2, P3, P4, P5, P6, P7, P8, P9
        //    FROM players, pix
        //    WHERE players.username = pix.username
        //    */

        //    //get the grid from the database
        //    /*
        //    var results = executeSQL();
        //    */

        //    //fill the model with the grid
        //    foreach (var result in results)
        //    {
        //        GridRow row = new GridRow(result.Username, result.Record, new string[result.P0, result.P1, result.P2, result.P3, result.P4,
        //                                                                             result.P5, result.P6, result.P7, result.P8, result.P9]);
        //    }
        //}
    }
}