using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace FinalDotNet.Models.EF
{
    [Table("Category")]
    public class Category : CommonAbstract
        
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
       public int id { get; set; }
       public string Title { get; set; }
       public string Description { get; set; }
       public int Position { get; set; }
       public string SeoTitle { get; set; }
       public string SeoDescription { get; set; }
       public string SeoKeywords { get; set; }


    }
}