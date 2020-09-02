using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 組織屬性資料檔
    /// </summary>
    public class AttrBase
    {
        /// <summary>
        /// 屬性代碼
        /// </summary>
        [Key]
        public string AttrCode { get; set; }
        /// <summary>
        /// 屬性名稱
        /// </summary>
        public string AttrName { get; set; }
        /// <summary>
        /// 1-醫事機構;2-長照機構;3-其他
        /// </summary>
        public string AttrType { get; set; }
        /// <summary>
        /// 備註
        /// </summary>
        public string AttrRem { get; set; }
    }
}
