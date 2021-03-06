﻿using System;
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
            CMEntities cm = new CMEntities();
            var myCreativeDetails = cm.CreativeDetails.AsQueryable().OrderByDescending(c => c.UpdateDate).Take(10);
            var returnoitems = new List<CreativeDetailsViewModel>();
            foreach (var item in myCreativeDetails)
            {
                var cdviewModel = new CreativeDetailsViewModel();
                cdviewModel.CDId = item.CDId;
                cdviewModel.Title = item.Title;
                cdviewModel.Body = item.Body;
                cdviewModel.UpdateDate = item.UpdateDate;
                returnoitems.Add(cdviewModel);
            }
            return View(returnoitems);
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
            cd.UserId = 1;
            cd.Title = "title";
            cd.Body = "Body";
            cd.Footer = "Footer";
            CMEntities cm = new CMEntities(connString.ConnectionString);
            cm.AddToCreativeDetails(cd);
            cm.SaveChanges();
            return View();
        }

       
        [HttpGet]
        public ActionResult MyHistory()
        {
            CMEntities cm = new CMEntities();
            var myCreativeDetails = cm.CreativeDetails.AsQueryable().OrderByDescending(c=>c.UpdateDate);
            var returnoitems = new List<CreativeDetailsViewModel>();
            foreach (var item in myCreativeDetails)
            {
                var cdviewModel = new CreativeDetailsViewModel();
                cdviewModel.Title = item.Title;
                cdviewModel.Body = item.Body;
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
            cd.UserId = 1;
            cd.Title = creativeDetailsViewModel.Title;
            cd.Body = creativeDetailsViewModel.Body;
            cd.Footer = "Footer";
            cd.AddedDate = DateTime.UtcNow;
            cd.UpdateDate = DateTime.UtcNow;
            CMEntities cm = new CMEntities(connString.ConnectionString);
            cm.AddToCreativeDetails(cd);
            cm.SaveChanges();

            //send email to moderator
            SendModeratorEmail(cd);

            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult DisplayArticle(int id) // acept user Id here
        {
            CMEntities cm = new CMEntities();
            var myCreativeDetails = cm.CreativeDetails.Where(c => c.CDId == id);
            var returnoitems = new List<CreativeDetailsViewModel>();
            foreach (var item in myCreativeDetails)
            {
                var cdviewModel = new CreativeDetailsViewModel();
                cdviewModel.CDId = item.CDId;
                cdviewModel.Title = item.Title;
                cdviewModel.Body = item.Body;
                cdviewModel.UpdateDate = item.UpdateDate;
                returnoitems.Add(cdviewModel);
            }
            return View("MyHistory", returnoitems);
        }

        private void SendModeratorEmail(CreativeDetail cd)
        {
            //replace these with values from the Model (cd)
            var MyUserName = User.Identity.Name;  //cd.UserName, cd.UserRealName
            var ModeratorName = "ModeratorName";  //cd.ModeratorName
            var ModeratorAddress = "dev4good2012@gmail.com";  //cd.ModeratorEmail
            var ContentID = System.Guid.NewGuid().ToString();//cd.CID

            //the link that the moderator will click on to view the content and approve it
            var ModeratorLink = String.Format(System.Configuration.ConfigurationManager.AppSettings["Link"], ContentID);

            //email text
            var Subject = "New MyBook Story Submitted for review";
            var Body = String.Format("<html><body><h1>Hello {0},</h1>You have recieved this email because {1} has published a story and has nominated you to check it's content.<br/>"
                                        + "<br/>Please click on this link --> {2} to go and see the story.  Thank you!</body></html>", ModeratorName, MyUserName, ModeratorLink);

            //send the email
            bool bSuccess = Services.Email.SendEmail(ModeratorName, ModeratorAddress, Subject, Body);
        }

    }
}
