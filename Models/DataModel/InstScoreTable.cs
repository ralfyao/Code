using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class InstScoreTable
    {
        [Key]
        public string EvalYear { get; set; }
        [Key]
        public string INSTNO { get; set; }
        [Key]
        public string ItemNo { get; set; }
        public string SelfScore { get; set; }
        public string SelfDate { get; set; }
        public string EvalScore { get; set; }
        public string EvalDate { get; set; }
        public string EvalDesc { get; set; }
    }
}