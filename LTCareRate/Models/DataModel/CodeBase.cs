using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class CodeBase
    {
        [Key]
        public string CodeTable { get; set; }
        [Key]
        public string CodeField { get; set; }
        [Key]
        public string CodeValue { get; set; }
        public string CodeText { get; set; }
    }
}