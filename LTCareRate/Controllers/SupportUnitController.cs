using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class SupportUnitController : Controller
    {
        private int defaultPageSize = 5;
        // GET: SupportUnit
        public ActionResult Index(int page = 1)
        {
            List<UnitAToBSum> listData = new List<UnitAToBSum>();
            SupportUnitAdd model = new SupportUnitAdd();
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
                MysqlDBA<UnitAToBSum> dbaHRAlloc = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = (DateTime.Now.Year - 1911).ToString();
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    TempData["SessionExipred"] = "true";
                    return RedirectToAction("Index", "Login", null);
                }
                queryCrit.INSTNO = Session["INSTNO"].ToString();
                listData = (List<UnitAToBSum>)dbaHRAlloc.getDataList(queryCrit);
                model.SupportUnits = listData.OrderBy(p => p.TrSeialNo).ToPagedList(page, defaultPageSize);
                List<CodeBase> codeBaseData = new List<CodeBase>();
                codeBaseData = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                //TempData["UnitAToBSumList"] = listData;
                TempData["CodeBase"] = codeBaseData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(FormCollection data)
        {
            return RedirectToAction("Index", "SelfRate", null);
        }
        public ActionResult Edit(string year, string INSTNO, string TrSeialNo1)
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
                List<UnitAToBSum> listData = new List<UnitAToBSum>();
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.TrSeialNo = int.Parse(TrSeialNo1);
                MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                DataSet ds = mysqlDBA.getDataSet(string.Format("SELECT * FROM UnitAToBSum WHERE Year='{0}' AND INSTNO='{1}' AND TrSeialNo = '{2}'", queryCrit.Year, queryCrit.INSTNO, queryCrit.TrSeialNo));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UnitAToBSum data = new UnitAToBSum();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.TrSeialNo = int.Parse(row["TrSeialNo"].ToString());
                    data.LCareType = row["LCareType"].ToString();
                    data.UnitBNo = row["UnitBNo"].ToString();
                    data.UnitBName = row["UnitBName"].ToString();
                    data.TrCaseNum = row["TrCaseNum"].ToString();
                    listData.Add(data);
                }
                TempData["UnitAToBSum"] = listData;
                List<CodeBase> codeBaseData = new List<CodeBase>();
                codeBaseData = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                TempData["CodeBase"] = codeBaseData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return RedirectToAction("Index", "SupportUnitAdd", null);
        }
        public ActionResult Delete(string year, string INSTNO, string TrSeialNo)
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
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.TrSeialNo = int.Parse(TrSeialNo);
                MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                mysqlDBA.Delete(queryCrit);
                TempData["success"] = "OK";
                TempData["parentreload"] = "OK";
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return RedirectToAction("Index", "SupportUnit", null);
        }
    }
}