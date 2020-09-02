using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class CommitteeMemberController : Controller
    {
        // GET: CommitteeMember
        public ActionResult Index()
        {
            try
            {
                MysqlDBA<CommitteeBase> mysqlDBA = new MysqlDBA<CommitteeBase>(FunctionController.CONNSTR);
            }
            catch (Exception ex)
            {
                
            }
            TempData["action"] = "committee";
            return View();
        }
    }
}