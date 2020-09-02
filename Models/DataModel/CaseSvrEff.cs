using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class CaseSvrEff
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
        /// 年月
        /// </summary>
        [Key]
        public string YM { get; set; }
        /// <summary>
        /// 01:新案;02-訪案及擬定天數;03-ToB第一次服務天數
        /// </summary>
        [Key]
        public string SvrType { get; set; }
        /// <summary>
        /// 案量
        /// </summary>
        public int? CaseSum { get; set; }
        /// <summary>
        /// 總天數
        /// </summary>
        public int? CaseDays { get; set; }
        /// <summary>
        /// 達標案量
        /// </summary>
        public int? CaseUpNum { get; set; }
        /// <summary>
        /// 達標總天數
        /// </summary>
        public int? CaseUpDays { get; set; }
        /// <summary>
        /// 達標平均天數
        /// </summary>
        public decimal? UpAvgDays { get; set; }
        /// <summary>
        /// 達標完成率
        /// </summary>
        public decimal? UpCasePer { get; set; }
        /// <summary>
        /// CreateDate
        /// </summary>
        public string CreateDate { get; set; }
    }
}