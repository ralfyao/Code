using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class ScoreDesc
    {
        [Key]
        public string EvalYear { get; set; }
        [Key]
        public string EvalType { get; set; }
        [Key]
        public string ItemNo { get; set; }
        public string Description { get; set; }
        public string CreateDate { get; set; }
    }
}