using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _2012dev4good;
using iTextSharp;

namespace _2012dev4good.Controllers
{ 
    public class UserController : Controller
    {
        private CMEntities db = new CMEntities();


        public ActionResult Logon(string id, string Password)
        {
            int user = (from us in db.Users where us.LoginName == id & us.Extra1 == Password select us.UserId).SingleOrDefault();
            if(user != null)
                return RedirectToAction("MyPage", new { id = user });
            else
                return RedirectToAction("Index","Home");
        }

        //
        // GET: /User/Edit/5
 
        public ActionResult Edit(int id)
        {
            User user = db.Users.Single(u => u.UserId == id);
            return View(user);
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Attach(user);
                db.ObjectStateManager.ChangeObjectState(user, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(user);
        }
         [HttpGet]
        public ActionResult Registration()
        {
            return View();
        }

        
        [HttpPost]
        public ActionResult Registration(User user)
        {
            user.Extra4 = string.Empty;
            if (ModelState.IsValid)
            {
                db.Users.AddObject(user);
                db.SaveChanges();
                return RedirectToAction("Index","Home");
            }

            return View(user);
        }
        public ActionResult MyPage(string id)
        {
            IEnumerable<CreativeDetail> obj = from cd in db.CreativeDetails where cd.UserId == id.ToString() select cd;
            return View();
        }
        public ActionResult ActionResultePDFDownload(int id )
        {
            CreativeDetail OBJ = db.CreativeDetails.Single(e => e.CDid == id);
            CreatePdf.Execute(OBJ);
            return RedirectToAction("MyPage", new { id = OBJ.UserId });
        }
        public ActionResult Authorise(int CDid)
        {
            CreativeDetail cd = (from crdata in db.CreativeDetails where crdata.CDid == CDid select crdata).Single();
            cd.Extra3 = "1";
            db.ObjectStateManager.ChangeObjectState(cd, EntityState.Modified);
            db.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
    
}