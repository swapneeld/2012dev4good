using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _2012dev4good.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Welcome...";

            return View();
        }

        public ActionResult About()
        {
            System.Configuration.Configuration rootWebConfig =
				System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/2012dev4good");
			System.Configuration.ConnectionStringSettings connString = null;
			if (rootWebConfig.ConnectionStrings.ConnectionStrings.Count > 0)
			{
				connString =
					rootWebConfig.ConnectionStrings.ConnectionStrings["CMEntities"];
				if (connString != null)
					Console.WriteLine("CMEntities connection string = \"{0}\"",
						connString.ConnectionString);
				else
					Console.WriteLine("No CMEntities connection string");
			}

            CreativeDetail cd = new CreativeDetail();
            cd.UserId = "100";
            cd.Title = "title";
            cd.Body = "Body";
            cd.Footer = "Footer";
            CMEntities cm = new CMEntities(connString.ConnectionString);
            cm.AddToCreativeDetails(cd);
            cm.SaveChanges();
            return View();
        }

        //public Action DisplayFeed()
        //{

        //}
    }
}
