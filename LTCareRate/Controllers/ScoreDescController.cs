using LTCareRate.Models.DataModel;
using LTCareRate.Models.ViewModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class ScoreDescController : Controller
    {
        // GET: ScoreDesc
        public ActionResult Index(string ItemNo)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                //Log.Error(ex + ex.StackTrace);
                TempData["SessionExipred"] = "true";
                //TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Login", null);
            }
            ScoreDescView view = new ScoreDescView();
            view.scoreDesc = string.Empty;
            try
            {
                MysqlDBA<ScoreDesc> mysqlDBA = new MysqlDBA<ScoreDesc>(FunctionController.CONNSTR);
                ScoreDesc queryCrit = new ScoreDesc();
                queryCrit.EvalYear = (DateTime.Now.Year - 1911).ToString();
                queryCrit.EvalType = "A";
                queryCrit.ItemNo = ItemNo;
                List<ScoreDesc> scoreDescs = (List<ScoreDesc>)mysqlDBA.getDataList(queryCrit);
                if (scoreDescs.Count > 0)
                {
                    view.scoreDesc = scoreDescs[0].Description;
                    view.scoreTitle = Utility.Utility.getScoreTitle(ItemNo);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SelfRate", null);
            }
            return View(view);
        }
    }
}