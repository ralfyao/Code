using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 個案服務統計
    /// </summary>
    public class CaseSvr
    {
        /// <summary>
        /// 年度
        /// </summary>
        [Key]
        public string Year { get; set; }
        /// <summary>
        /// 縣市碼(1)+三碼流水號
        /// </summary>
        [Key]
        public string INSTNO { get; set; }
        /// <summary>
        /// 年月
        /// </summary>
        [Key]
        public string YM { get; set; }
        /// <summary>
        /// 舊案量(AA01)
        /// </summary>
        public int? OldCaseNum { get; set; }
        /// <summary>
        /// 持續追蹤量(AA02)
        /// </summary>
        public int? TraceCaseTotal { get; set; }
        /// <summary>
        /// 多元服務個案數
        /// </summary>
        public int? MultSvrCaseNum { get; set; }
        public int? Svr01CaseRenum { get; set; }
        /// <summary>
        /// 持續追蹤量(AA02)
        /// </summary>
        public int? Svr02CaseRenum { get; set; }
        /// <summary>
        /// 多元服務個案數
        /// </summary>
        public int? Svr03CaseRenum { get; set; }
        /// <summary>
        /// 自行轉介個案數
        /// </summary>
        public int? SelfReferral { get; set; }
        public int? FullPeoNum { get; set; }
        public int? PartPeoNum { get; set; }
        public string CreateDate { get; set; }
    }
}
