using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class UnitAMeeting
    {
        [Key]
        public int? MSerialNo { get; set; }
        public string Year { get; set; }
        public string INSTNO { get; set; }
        public string MType { get; set; }
        public string MDate { get; set; }
        public string Topic { get; set; }
        public int? AttendNum { get; set; }
        public int? ProfCnt { get; set; }
        public string CreateDate { get; set; }
        public string ModifyDate { get; set; }
    }
}