using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace crispix2._0.Controllers
{
    public class EnterController : Controller
    {
        // GET: Entry
        public ActionResult Enter()
        {
            //if EnterMain return View("EnterMain");
            //else return View("EnterPix");
            return View();
        }
    }
}