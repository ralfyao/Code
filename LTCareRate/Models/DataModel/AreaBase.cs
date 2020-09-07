using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 縣市代碼檔
    /// </summary>
    public class AreaBase
    {
        /// <summary>
        /// 縣市代碼
        /// </summary>
        [Key]
        public string AreaCode { get; set; }
        /// <summary>
        /// 縣市名稱
        /// </summary>
        public string AreaName { get; set; }
        /// <summary>
        /// 縣市英文名稱
        /// </summary>
        public string AreaEName { get; set; }
        public string AreaFName { get; set; }
        public string AreaFEName { get; set; }
        public string CityCode { get; set; }
    }
}
