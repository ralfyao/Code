using LongtermCare.DataModel.LongtermCare.DataModel;
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
    public class HRController : Controller
    {
        private const int DefaultPageSize = 5;
        // GET: HR
        public ActionResult Index(int page = 1)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                //Log.Error(ex + ex.StackTrace);
                TempData["SessionExipred"] = "true";
                //TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Login", null);
            }
            MysqlDBA<HRAlloc> dbaHRAlloc = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
            MysqlDBA<UnitAYear> dbaUnitAYear = new MysqlDBA<UnitAYear>(FunctionController.CONNSTR);
            List<HRAlloc> listData = new List<HRAlloc>();
            HRData hrData = new HRData();
            try
            {
                UnitAYear queryCritUAY = new UnitAYear();
                queryCritUAY.INSTNO = Session["INSTNO"].ToString();
                queryCritUAY.Year = (DateTime.Now.Year - 1911).ToString();
                List<UnitAYear> UAYS = (List<UnitAYear>)dbaUnitAYear.getDataList(queryCritUAY);

                HRAlloc queryCrit = new HRAlloc();
                queryCrit.Year = (DateTime.Now.Year - 1911).ToString();
                queryCrit.INSTNO = Session["INSTNO"].ToString();
                DataSet ds = dbaHRAlloc.getDataSet(string.Format("SELECT * FROM HRAlloc WHERE Year='{0}' AND INSTNO='{1}'", queryCrit.Year, queryCrit.INSTNO));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    HRAlloc data = new HRAlloc();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.HRAllocSerNo = int.Parse(row["HRAllocSerNo"].ToString());
                    data.JobType = row["JobType"].ToString();
                    data.PROBG = row["PROBG"].ToString();
                    data.FullTimeNum = int.Parse(row["FullTimeNum"].ToString());
                    data.PartTimeNum = int.Parse(row["PartTimeNum"].ToString());
                    listData.Add(data);
                }
                List<CodeBase> codeBaseData = new List<CodeBase>();
                codeBaseData = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                hrData.hrDataList = listData.OrderBy(p => p.HRAllocSerNo).ToPagedList(page == 0 ? 1 : page, DefaultPageSize);
                if (UAYS.Count > 0)
                {
                    hrData.YearLeaveCnt = UAYS[0].ResignNum;
                    hrData.YearStartCnt = UAYS[0].CMDBegYearNum;
                    hrData.RateAddCnt = UAYS[0].CMDPeriodAddNum;
                }
                TempData["CodeBase"] = codeBaseData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "HR", null);
            }
            return View(hrData);
        }
        [HttpPost]
        public ActionResult Index(HRData data)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                //Log.Error(ex + ex.StackTrace);
                TempData["SessionExipred"] = "true";
                //TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Login", null);
            }
            UnitAYear unitAYear = new UnitAYear();

            MysqlDBA<UnitAYear> mysqlDBA = new MysqlDBA<UnitAYear>(FunctionController.CONNSTR);
            try
            {
                unitAYear.INSTNO = Session["INSTNO"].ToString();
                unitAYear.Year = (DateTime.Now.Year - 1911).ToString();
                List<UnitAYear> unitAYears = (List<UnitAYear>)mysqlDBA.getDataList(unitAYear);
                if (unitAYears.Count > 0)
                {
                    unitAYear = unitAYears[0];
                }
                unitAYear.ResignNum = data.YearLeaveCnt;
                unitAYear.CMDBegYearNum = data.YearStartCnt;
                unitAYear.CMDPeriodAddNum = data.RateAddCnt;
                unitAYear.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                unitAYear.EvalDate = DateTime.Parse(unitAYear.EvalDate).ToString("yyyy-MM-dd");
                unitAYear.Modifydate = DateTime.Parse(unitAYear.EvalDate).ToString("yyyy-MM-dd");
                unitAYear.ModifyUser = Session["AccountNo"].ToString();
                mysqlDBA.InsertOrUpdate(unitAYear);
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "HR", null);
            }
            return RedirectToAction("Index", "CaseListCount", null);
        }

        public ActionResult Edit(string year, string INSTNO, string HRAllocSerNo)
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
                List<HRAlloc> listData = new List<HRAlloc>();
                HRAlloc queryCrit = new HRAlloc();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.HRAllocSerNo = int.Parse(HRAllocSerNo);
                MysqlDBA<HRAlloc> mysqlDBA = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
                DataSet ds = mysqlDBA.getDataSet(string.Format("SELECT * FROM HRAlloc WHERE Year='{0}' AND INSTNO='{1}' AND HRAllocSerNo = '{2}'", queryCrit.Year, queryCrit.INSTNO, queryCrit.HRAllocSerNo));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    HRAlloc data = new HRAlloc();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.HRAllocSerNo = int.Parse(row["HRAllocSerNo"].ToString());
                    data.JobType = row["JobType"].ToString();
                    data.PROBG = row["PROBG"].ToString();
                    data.FullTimeNum = int.Parse(row["FullTimeNum"].ToString());
                    data.PartTimeNum = int.Parse(row["PartTimeNum"].ToString());
                    listData.Add(data);
                }
                TempData["HRAlloc"] = listData;
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
                return RedirectToAction("Index", "HR", null);
            }
            return RedirectToAction("Index", "HRAdd", null);
        }
        public ActionResult Delete(string year, string INSTNO, string HRAllocSerNo)
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
                HRAlloc queryCrit = new HRAlloc();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.HRAllocSerNo = int.Parse(HRAllocSerNo);
                MysqlDBA<HRAlloc> mysqlDBA = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
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
                return RedirectToAction("Index", "HRAdd", null);
            }
            return RedirectToAction("Index", "HRAdd", null);
        }
    }
}