using LTCareRate.Models.DataModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.ViewModel
{
    public class CommitteeMember
    {
        public IPagedList<CommINSTYear> INSTList { get; set; }
    }
}