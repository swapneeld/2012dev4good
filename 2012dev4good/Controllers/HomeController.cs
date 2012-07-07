using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _2012dev4good.Models;
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



            //BEGIN EMAIL

            //replace these with values from the Model (CD)
            var UserName = User.Identity.Name;  //Model.UserName, Model.UserRealName
            var ModeratorName = "ModeratorName";  //Model.ModeratorName
            var ModeratorAddress = "goodall@gmail.com";  //Model.ModeratorEmail
            var ContentID = System.Guid.NewGuid().ToString();//Model.CID

            //the link that the moderator will click on to view the content and approve it
            var ModeratorLink = String.Format(System.Configuration.ConfigurationManager.AppSettings["Link"], ContentID);

            //email text
            var Subject = "New MyBook Story Submitted for review";
            var Body = String.Format("<html><body><h1>Hello {0},</h1>You have recieved this email because {1} has published a story and has nominated you to check it's content.<br/>"
                                        + "<br/>Please click on this link --> {2} to go and see the story.  Thank you!</body></html>", ModeratorName, UserName, ModeratorLink);
         
            //send the email
            Services.Email.SendEmail(ModeratorName, ModeratorAddress, Subject, Body);
            
            //END EMAIL




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
        [HttpGet]
        public ActionResult DisplayFeed()
        {

            CMEntities cm = new CMEntities();
            var myCreativeDetails = cm.CreativeDetails.AsQueryable();
            var returnoitems = new List<CreativeDetailsViewModel>();
            foreach (var item in myCreativeDetails)
            {
                var cdviewModel = new CreativeDetailsViewModel();
                cdviewModel.Title = item.Title;
                cdviewModel.Body = item.Body.Length > 140 ? item.Body.Substring(0,140) : item.Body  ;
                cdviewModel.UpdateDate = item.UpdateDate;
                returnoitems.Add(cdviewModel);
            }
            return View(returnoitems);

        }

        [HttpGet]
        public ActionResult CreateNew() // acept user Id here
        {
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult CreateNew(CreativeDetailsViewModel creativeDetailsViewModel)
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
            cd.Title = creativeDetailsViewModel.Title;
            cd.Body = creativeDetailsViewModel.Body;
            cd.Footer = "Footer";
            CMEntities cm = new CMEntities(connString.ConnectionString);
            cm.AddToCreativeDetails(cd);
            cm.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}
