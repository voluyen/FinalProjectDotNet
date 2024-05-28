using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace FinalProjectDotNet.Models
{
	public class CandidatesView
	{
        public int id { get; set; }
        public string username { get; set; }
        public string full_name { get; set; }
        public string avt { get; set; }
        public string email { get; set; }
        public DateTime birthdate { get; set; }
        public string phone_number { get; set; }
        public string address { get; set; }
        public string resume { get; set; }
        public string skills { get; set; }
        public string experience { get; set; }
        public DateTime date_create { get; set; }
    }
}