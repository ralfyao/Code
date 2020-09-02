using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LongtermCare.DataModel.LongtermCare.DataModel
{
    /// <summary>
    /// 最新消息
    /// </summary>
    public class MessageRec
    {
        /// <summary>
        /// 流水號
        /// </summary>
        [Key]
        public int MsgSerialNo { get; set; }
        /// <summary>
        /// 訊息主題
        /// </summary>
        public string MsgSub { get; set; }
        /// <summary>
        /// 訊息內容
        /// </summary>
        public string MsgData { get; set; }
        /// <summary>
        /// 發佈日期
        /// </summary>
        public string MsgPushDate { get; set; }
        /// <summary>
        /// 附件內容
        /// </summary>
        public string Attachs { get; set; }
        /// <summary>
        /// 關閉日期
        /// </summary>
        public string CloseDate { get; set; }
        public string CreateDate { get; set; }
        public string CreateUser { get; set; }
        public string Modifydate { get; set; }
        public string ModifyUser { get; set; }
    }
}
