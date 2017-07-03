using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class LinksController : Controller
    {
        // GET: Links
        public ActionResult Index()
        {
            ViewBag.Title = "Crispix - Links";
            return View("Links");
        }

        public ActionResult Links()
        {
            return Redirect("http://sports.espn.go.com/ncf/rankingsindex");
        }
    }
}