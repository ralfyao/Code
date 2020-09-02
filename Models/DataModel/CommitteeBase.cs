using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class CommitteeBase
    {
        [Key]
        public string COMMNO { get; set; }
        public string COMMName { get; set; }
        public string COMMType { get; set; }
        public string CityCode { get; set; }
        public string AreaCode { get; set; }
        public string COMMAddress { get; set; }
        public string COMMTel { get; set; }
    }
}