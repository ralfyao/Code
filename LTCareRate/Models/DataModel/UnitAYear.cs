using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 年度A單位機構評鑑
    /// </summary>
    public class UnitAYear
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
        /// 縣市代碼
        /// </summary>
        public string AreaCode { get; set; }
        /// <summary>
        /// 機構名稱
        /// </summary>
        public string INSTName { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string INSTAddress { get; set; }
        /// <summary>
        /// 電話
        /// </summary>
        public string INSTTel { get; set; }
        /// <summary>
        /// 主服務地區
        /// </summary>
        public string MainAreas { get; set; }
        /// <summary>
        /// 次服務地區
        /// </summary>
        public string SecAreas { get; set; }
        /// <summary>
        /// 聯絡人
        /// </summary>
        public string Contact { get; set; }
        /// <summary>
        /// 聯絡人電話
        /// </summary>
        public string ContactTel { get; set; }
        /// <summary>
        /// 電子信箱
        /// </summary>
        public string EMail { get; set; }
        /// <summary>
        /// 受評日期
        /// </summary>
        public string EvalDate { get; set; } 
        public string CreateDate { get; set; }
        public string CreateUser { get; set; }
        public string Modifydate { get; set; }
        public string ModifyUser { get; set; }
    }
}
