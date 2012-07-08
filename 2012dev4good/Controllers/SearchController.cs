using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _2012dev4good.Models;
namespace _2012dev4good.Controllers
{
    public class SearchController : Controller
    {
        private CMEntities db = new CMEntities();

        
        //
        // GET: /Search/

        public ActionResult Index(string id)
        {
            List<SearchData> Listdata = new List<SearchData>();
            var SearchDetails = from data in db.CreativeDetails join c in db.Users on data.UserId equals c.UserId.ToString() where data.Title.Contains(id) | c.LoginName.Contains(id) select new { data.Title, data.Extra1, c.LoginName, c.UserId,data.CDid};
            SearchData test = null;
            foreach (var r in SearchDetails)
            {
                test = new SearchData();
                test.PublishedDate = r.Extra1;
                test.Title = r.Title;
                test.UserName = r.LoginName;
                test.userId = r.UserId;
                test.cdID = r.CDid;
                Listdata.Add(test);

            }
            return View(test);
        }

    }
}
