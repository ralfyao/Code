using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class CommINSTYear
    {
        [Key]
        public string Year { get; set; }
        [Key]
        public string INSTNO { get; set; }
        public string ACommNo { get; set; }
        public string BCommNo { get; set; }
        public string EvalDate { get; set; }
        public string EvalPeriod { get; set; }
        public string COMMTel { get; set; }
    }
}