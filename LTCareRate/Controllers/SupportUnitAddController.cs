using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class SupportUnitAddController : Controller
    {
        // GET: SupportUnitAdd
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
                //MysqlDBA<HRAlloc> dbaHRAlloc = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
                MysqlDBA<CodeBase> mysqlDBA = new MysqlDBA<CodeBase>(FunctionController.CONNSTR);
                CodeBase queryCrit = new CodeBase();
                List<CodeBase> objLst = (List<CodeBase>)mysqlDBA.getDataList(queryCrit);
                TempData["CodeBase"] = objLst;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnitAdd", null);
            }
            return View();
        }
        [HttpPost]
        public ActionResult Add(SupportUnitAdd data)
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
                MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                UnitAToBSum alloc = new UnitAToBSum();
                alloc.Year = (DateTime.Now.Year - 1911).ToString();
                alloc.INSTNO = Session["INSTNO"].ToString();
                //-1代表新增，取新流水號
                if (data.TrSeialNo1 == "-1")
                {
                    alloc.TrSeialNo = Utility.Utility.getUnitAToBSumSerNo(mysqlDBA);
                    alloc.TrSeialNo++;
                }
                else
                {
                    //不是-1表修改，帶原來流水號
                    alloc.TrSeialNo = int.Parse(data.TrSeialNo1);
                }
                alloc.INSTNO = Session["INSTNO"].ToString();
                alloc.LCareType = data.ServiceType;
                alloc.UnitBNo = data.INSTNO;
                alloc.UnitBName = data.INSTName;
                alloc.TrCaseNum = data.CaseNo;
                //alloc.Modifydate = DateTime.Now.ToString("yyyy-MM-dd");
                alloc.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                mysqlDBA.InsertOrUpdate(alloc);
                TempData["success"] = "OK";
                TempData["parentreload"] = "OK";
                //alloc
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnitAdd", null);
            }
            return RedirectToAction("Index", "SupportUnit", null);
        }
    }
}