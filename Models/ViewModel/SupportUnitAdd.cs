using LTCareRate.Models.DataModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.ViewModel
{
    public class SupportUnitAdd
    {
        public string TrSeialNo1 { get; set; }
        public string ServiceType { get; set; }
        public string INSTNO { get; set; }
        public string INSTName { get; set; }
        public string CaseNo { get; set; }
        public IPagedList<UnitAToBSum> SupportUnits { get; set; }
    }
}