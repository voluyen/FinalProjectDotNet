using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProjectDotNet.Models
{
	public class Login
	{
		[Required]
		public string username { get; set; }

		[Required]
		[DataType(DataType.Password)]
		public string password { get; set; }
	}
}