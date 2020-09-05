﻿using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using PagedList;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class CommitteeMemberController : Controller
    {
        int DefaultPageSize = 5;
        // GET: CommitteeMember
        public ActionResult Index(int page = 1)
        {
            CommitteeMember cm = new CommitteeMember();
            try
            {
                MysqlDBA<CommINSTYear> mysqlDBA = new MysqlDBA<CommINSTYear>(FunctionController.CONNSTR);
                cm.INSTList = mysqlDBA.getDataList(new CommINSTYear()).ToPagedList(page, DefaultPageSize).OrderBy(p => p.INSTNO).ToPagedList(page, DefaultPageSize);
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "committee";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "CommitteeMember", null);
            }
            TempData["action"] = "committee";
            return View(cm);
        }
    }
}