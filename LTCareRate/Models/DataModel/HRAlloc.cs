using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 人力配置表
    /// </summary>
    public class HRAlloc
    {
        /// <summary>
        /// 年度
        /// </summary>
        [Key]
        public string Year { get; set; }
        /// <summary>
        /// 人力配置流水號
        /// </summary>
        [Key]
        public string INSTNO { get; set; }
        /// <summary>
        /// 人力配置流水號
        /// </summary>
        [Key]
        public int HRAllocSerNo { get; set; }
        /// <summary>
        /// 人員類別
        /// </summary>
        public string JobType { get; set; }
        /// <summary>
        /// 專業背景
        /// </summary>
        public string PROBG { get; set; }
        /// <summary>
        /// 專任人數
        /// </summary>
        public int FullTimeNum { get; set; }
        /// <summary>
        /// 兼任人數
        /// </summary>
        public int PartTimeNum { get; set; }
        /// <summary>
        /// 專任附檔
        /// </summary>
        public string FullAtth { get; set; }
        /// <summary>
        /// 兼任附件
        /// </summary>
        public string PartAtth { get; set; }
        public string CreateDate { get; set; } 
        public string Modifydate { get; set; }
    }
}
