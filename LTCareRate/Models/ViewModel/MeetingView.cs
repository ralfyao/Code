using LTCareRate.Models.DataModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.ViewModel
{
    public class MeetingView 
    {
        public string year { get; set; }
        public string date { get; set; }
        public string topic { get; set; }
        public string attend { get; set; }
        public string profcnt { get; set; }
        public string MSerial { get; set; }
        public IPagedList<UnitAMeeting> meetingList { get; set; }
    }
}