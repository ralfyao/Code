using LongtermCare.DataModel.LongtermCare.DataModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.ViewModel
{
    public class HRData
    {
        public string YearLeaveCnt { get; set; }
        public string YearStartCnt { get; set; }
        public string RateAddCnt { get; set; }
        public string personadmin { get; set; }
        public string ProfBackSelect { get; set; }
        public string ProfCount { get; set; }
        public string BeitCount { get; set; }
        public string HRAllocSerNo1 { get; set; }
        //製作分頁用
        public IPagedList<HRAlloc> hrDataList { get; set; }
        public int Page { get; set; }
        public HRData() 
        {
            personadmin = string.Empty;
            ProfBackSelect = string.Empty;
            ProfCount = string.Empty;
            BeitCount = string.Empty;
            HRAllocSerNo1 = string.Empty;
            Page = 0;
        }
        //製作分頁用
    }
}