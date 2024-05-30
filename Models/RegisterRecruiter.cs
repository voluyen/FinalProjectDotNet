using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProjectDotNet.Models
{
	public class RegisterRecruiter
	{

        [Required]
        public string username { get; set; }

        [Required]
        public string full_name { get; set; }

        public string avatar { get; set; }

        [Required]
        [EmailAddress]
        public string email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string password { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Compare("password", ErrorMessage = "The password and confirmation password do not match.")]
        public string confirm_password { get; set; }

        [DataType(DataType.Upload)]
        public HttpPostedFileBase avatar_file { get; set; }

        public DateTime birthdate { get; set; }

        public string phone_number { get; set; }

        public string address { get; set; }

        public string company_name { get; set; }

        public string website { get; set; }
    }
}