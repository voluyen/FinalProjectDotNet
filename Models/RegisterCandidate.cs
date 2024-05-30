using System.Web;
using System.ComponentModel.DataAnnotations;
using System;

namespace FinalProjectDotNet.Models
{
    public class RegisterCandidate
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

        [DataType(DataType.Upload)]
        public HttpPostedFileBase resume { get; set; }

        public string skills { get; set; }

        public string experience { get; set; }

    }
}
