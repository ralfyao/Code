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
        [DisplayName("年分")]
        public string Year { get; set; }
        [Key]
        [DisplayName("機構代號")]
        public string INSTNO { get; set; }
        [Key]
        [DisplayName("流水序號")]
        public int? TrSeialNo { get; set; }
        [DisplayName("服務類別")]
        public string LCareType { get; set; }
        [DisplayName("機構代號")]
        public string UnitBNo { get; set; }
        [DisplayName("機構名稱")]
        public string UnitBName { get; set; }
        [DisplayName("轉介個案數")]
        public string TrCaseNum { get; set; }
        public string CreateDate { get; set; }
    }
}