using System.Web;
using System.ComponentModel.DataAnnotations;
using System;

namespace FinalProjectDotNet.Models
{
    public class RegisterModel
    {

        [Required]
        public string username { get; set; }
        
        [Required]
        public string full_name { get; set; }

        public string avt { get; set; }

        [Required]
        public int role { get; set; }

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
    }
}
