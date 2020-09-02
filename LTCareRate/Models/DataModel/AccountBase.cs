using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 帳號資料
    /// </summary>
    public class AccountBase
    {
        /// <summary>
        /// 帳號
        /// </summary>
        [Key]
        public string AccountNo { get; set; }
        /// <summary>
        /// 帳號密碼
        /// </summary>
        public string AcntPwd { get; set; }
        /// <summary>
        /// 帳號名稱
        /// </summary>
        public string AcoountName { get; set; }
        /// <summary>
        /// 帳號類別
        /// </summary>
        public string AccountType { get; set; }
        public string AcntTypeNo { get; set; }
        /// <summary>
        /// 失效日
        /// </summary>
        public string CloseDate { get; set; }
        public string CreateDate { get; set; }
        public string CreateUser { get; set; }
        public string INSTNO { get; set; }
    }
}
