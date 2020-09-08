using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class SelfRateController : Controller
    {
        // GET: SelfRate
        public ActionResult Index()
        {
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    //Log.Error(ex + ex.StackTrace);
                    TempData["SessionExipred"] = "true";
                    //TempData["error"] = ex + ex.StackTrace;
                    //tran.Rollback();
                    return RedirectToAction("Index", "Login", null);
                }
                MysqlDBA<ScoreItem> mysqlDBA = new MysqlDBA<ScoreItem>(FunctionController.CONNSTR);
                //MysqlDBA<InstScoreTable> mysqlDBAInstScoreTable = new MysqlDBA<InstScoreTable>(FunctionController.CONNSTR);
                List<ScoreItem> lstScoreItem = new List<ScoreItem>();
                DataSet scoreItemsdateSet = mysqlDBA.getDataSet(string.Format("SELECT * FROM ScoreItem WHERE ItemParentNo='-1'"));
                List<InstScoreTable> instScoreTables = new List<InstScoreTable>();
                foreach (DataRow scoreItem in scoreItemsdateSet.Tables[0].Rows)
                {
                    ScoreItem score_Item = new ScoreItem();
                    score_Item.ItemNo = scoreItem["ItemNo"].ToString();
                    score_Item.ItemParentNo = scoreItem["ItemParentNo"].ToString();
                    score_Item.ItemDesc = scoreItem["ItemDesc"].ToString();
                    score_Item.ItemGrade = scoreItem["ItemGrade"].ToString();
                    score_Item.ItemScore = scoreItem["ItemScore"].ToString();
                    score_Item.EvalYear = scoreItem["EvalYear"].ToString();
                    score_Item.EvalType = scoreItem["EvalType"].ToString();
                    score_Item.CreateDate = scoreItem["CreateDate"].ToString();
                    if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                    {
                        //Log.Error(ex + ex.StackTrace);
                        TempData["SessionExipred"] = "true";
                        //TempData["error"] = ex + ex.StackTrace;
                        //tran.Rollback();
                        return RedirectToAction("Index", "Login", null);
                    }
                    score_Item.getChildItem(mysqlDBA, instScoreTables, Session["INSTNO"].ToString());
                    lstScoreItem.Add(score_Item);
                    if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                    {
                        TempData["SessionExipred"] = "true";
                        return RedirectToAction("Index", "Login", null);
                    }
                    //List<InstScoreTable> instScoreList = Utility.Utility.getInstScore(Session["INSTNO"].ToString(), score_Item.ItemNo, score_Item.EvalYear);
                    //if (instScoreList.Count > 0)
                    //{
                    //    instScoreTables.Add(instScoreList[0]);
                    //}
                }
                TempData["ScoreItems"] = lstScoreItem;
                TempData["InstScores"] = instScoreTables;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "SelfRate", null);
            }
            return View();
        }
        public ActionResult Calc(FormCollection formData)
        {
            MysqlDBA<InstScoreTable> mysqlDBA = new MysqlDBA<InstScoreTable>(FunctionController.CONNSTR);
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    TempData["SessionExipred"] = "true";
                    return RedirectToAction("Index", "Login", null);
                }
                string accountNo = Session["INSTNO"].ToString();
                string year = (DateTime.Now.Year - 1911).ToString();
                InstScoreTable instScore = new InstScoreTable();
                foreach (var key in formData.AllKeys)
                {
                    if (key.IndexOf("Score") != -1)
                    {
                        string value = formData[key].ToString();
                        if (!string.IsNullOrEmpty(value))
                        {
                            double score = double.Parse(value);
                            instScore = new InstScoreTable();
                            instScore.EvalYear = year;
                            instScore.INSTNO = accountNo;
                            instScore.ItemNo = key.Replace("Score", "");
                            instScore.SelfScore = score.ToString();
                            instScore.SelfDate = DateTime.Now.ToString("yyyy-MM-dd");
                            instScore.EvalScore = "0";
                            instScore.EvalDate = "1900-01-01";
                            mysqlDBA.InsertOrUpdate(instScore);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "SelfRate", null);
            }
            return RedirectToAction("Index", "Meeting");
        }
    }
}