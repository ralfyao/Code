using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class UnitAToBSum
    {
        [Key]
        public string Year { get; set; }
        [Key]
        public string INSTNO { get; set; }
        [Key]
        public int? TrSeialNo { get; set; }
        public string LCareType { get; set; }
        public string UnitBNo { get; set; }
        public string UnitBName { get; set; }
        public string TrCaseNum { get; set; }
        public string CreateDate { get; set; }
    }
}