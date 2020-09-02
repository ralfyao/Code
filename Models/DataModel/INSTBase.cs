using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 機構基本資料
    /// </summary>
    public class INSTBase
    {
        /// <summary>
        /// 機構代碼
        /// </summary>
        [Key]
        public string INSTNO { get; set; }
        /// <summary>
        /// 機構名稱
        /// </summary>
        public string INSTName { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string CityCode { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string AreaCode { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string INSTAddress { get; set; }
        /// <summary>
        /// 電話
        /// </summary>
        public string INSTTel { get; set; }
        /// <summary>
        /// 成立日期
        /// </summary>
        public string IncDate { get; set; } 
        /// <summary>
        /// 醫事機構屬性
        /// </summary>
        public string AttrMed { get; set; }
        /// <summary>
        /// 長照機構屬性
        /// </summary>
        public string AttrLC { get; set; }
        /// <summary>
        /// 其他屬性
        /// </summary>
        public string AttrOther { get; set; }
    }
}
