using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _2012dev4good.Models
{
    public class CreativeDetailsViewModel
    {
        public string UserId { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public string Footer { get; set; }
        public string Extra1 { get; set; }
        public string Extra2 { get; set; }
        public string Extra3 { get; set; }
        public string Extra4 { get; set; }
        public string Tag1 { get; set; }
        public string Tag2 { get; set; }
        public DateTime? AddedDate { get; set; }
        public DateTime? UpdateDate { get; set; }
    }
}