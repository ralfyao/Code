using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 三碼區域碼
    /// </summary>
    public class Area3Base
    {
        /// <summary>
        /// 縣市代碼
        /// </summary>
        [Key]
        public string Area3Code { get; set; }
        /// <summary>
        /// 縣市名稱
        /// </summary>
        public string Area3Name { get; set; }
        /// <summary>
        /// 縣市名稱
        /// </summary>
        public string Area3EName { get; set; }
        /// <summary>
        /// 縣市名稱
        /// </summary>
        public string Area3FName { get; set; }
        /// <summary>
        /// 縣市英文名
        /// </summary>
        public string Area3FEName { get; set; }
    }
}
