using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 個案服務資料
    /// </summary>
    public class CaseSvrRec
    {
        /// <summary>
        /// 年度
        /// </summary>
        [Key]
        public string Year { get; set; }
        /// <summary>
        /// 機構代碼
        /// </summary>
        [Key]
        public string INSTNO { get; set; }
        /// <summary>
        /// 個案序號
        /// </summary>
        [Key]
        public int? CaseSerNo { get; set; }
        /// <summary>
        /// 個案代號
        /// </summary>
        public string CaseNo { get; set; }
        /// <summary>
        /// 新案評估日
        /// </summary>
        public string StartDate { get; set; }
        /// <summary>
        /// 照專員簽審日期
        /// </summary>
        public string SignDate { get; set; }
        /// <summary>
        /// 新案照會B單位
        /// </summary>
        public string CFDate { get; set; }
        /// <summary>
        /// 新案照會B單位
        /// </summary>
        public string AToBDate { get; set; }
        /// <summary>
        /// 第一次服務日
        /// </summary>
        public string FirstSvrDate { get; set; }
        public string CreateDate { get; set; }
    }
}
