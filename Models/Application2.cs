using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FinalProjectDotNet.Models
{
	public class Application2
	{
		[Required]
		public int job_id { get; set; }

		[Required]
		public int candidate_id { get; set; }

		[DataType(DataType.Upload)]
		public HttpPostedFileBase cover_letter { get; set; }
	}
}