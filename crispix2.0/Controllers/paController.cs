using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class paController : Controller
    {
        // GET: pa
        public ActionResult Index()
        {
            return View("pa");
        }


        public ActionResult changeGames ()
        {
            return PartialView("_changeGames");
        }


        public PartialViewResult getPartialView(string viewName)
        {
            if (viewName.Equals("changeGames"))
                return PartialView("_changeGames");

            if (viewName.Equals("editUser"))
                return PartialView("_editUser");

            if (viewName.Equals("enterGameResults"))
                return PartialView("_enterGameResults");

            if (viewName.Equals("listUsers"))
                return PartialView("_listUsers");

            if (viewName.Equals("showGrid"))
                return PartialView("_showGrid");

            return null;

        }
    }
}