using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.ViewModel
{
    public class BasicData
    {
        public string INSTNO { get; set; }
        public string INSTName { get; set; }
        public string INSTTel { get; set; }
        public string city { get; set; }
        public string area { get; set; }
        public string address { get; set; }
        public string AttrMed { get; set; }
        public string ResignNum { get; set; }
        public string CMDBegYearNum { get; set; }
        public string CMDPeriodAddNum { get; set; }
        //public string AttrLC { get; set; }
        //public string AttrOther { get; set; }
        public string EstabDate { get; set; }
        public string SpecialArea { get; set; }
        public string Contact { get; set; }
        public string ContactTel { get; set; }
        public string EMail { get; set; }
        /// <summary>
        /// 人力配置
        /// </summary>
        public List<HRAlloc> hrAlloc { get; set; } = new List<HRAlloc>();
        /// <summary>
        /// 合作服務提供單位
        /// </summary>
        public List<UnitAToBSum> unitAToBSums { get; set; } = new List<UnitAToBSum>();
        /// <summary>
        /// 個管服務量
        /// </summary>
        public List<CaseSvr> caseSvrs { get; set; } = new List<CaseSvr>();
        /// <summary>
        /// 個案服務時效
        /// </summary>
        public List<CaseSvrEff> caseSvrsEff { get; set; } = new List<CaseSvrEff>();
        public List<CaseSvrEffView> caseSvrsEffView { get; set; } = new List<CaseSvrEffView>();
        public List<AttrBase> AttrMedList { get; set; } = new List<AttrBase>();
        public List<AttrBase> AttrLCList { get; set; } = new List<AttrBase>();
        public List<AttrBase> AttrOtherList { get; set; } = new List<AttrBase>();
    }
}