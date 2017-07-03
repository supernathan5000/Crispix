using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

namespace crispix2._0.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Crispix - Home";
            
            SetMain();

            return View();
        }

        private void SetMain()
        {
            //load the settings from the config file
            var pixLocked = bool.Parse(ConfigurationManager.AppSettings["pixLocked"]);
            var currentWeek = int.Parse(ConfigurationManager.AppSettings["currentWeek"]);
            var currentWeekName = ConfigurationManager.AppSettings["currentWeekName"];

            //set the default home page view
            

            //if the pix are not locked
            if (!pixLocked)
            {
                //if it's the last week
                if (currentWeekName.ToUpper().Equals("END"))
                {
                    ViewBag.Main = "FINAL";
                    //return View("_Final");
                }
                //if it's before the first week
                else if (currentWeek == 1)
                {
                    ViewBag.Main = "PRESEASON";
                    //return View("_Preseason");
                }
                //otherwise pix are unlocked
                else
                {
                    ViewBag.Main = "UNLOCKED";
                    //return View("_Unlocked");
                }
            }
            else
            {
                ViewBag.Main = "LOCKED";
                ViewBag.HeaderText = "";
                
            }

            //if pix are locked show the locked page
            //return View("_Locked");
        }
    }
}