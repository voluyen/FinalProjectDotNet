using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalDotNet.Models
{
    public abstract class CommonAbstract
    {
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}