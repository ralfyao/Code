using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class HRAddController : Controller
    {
        // GET: HRAdd
        public ActionResult Index()
        {
            try
            {
                MysqlDBA<CodeBase> mysqlDBA = new MysqlDBA<CodeBase>(FunctionController.CONNSTR);
                CodeBase queryCrit = new CodeBase();
                queryCrit.CodeTable = "HRAlloc";
                queryCrit.CodeField = "ProfBack";
                List<CodeBase> objLst = (List<CodeBase>)mysqlDBA.getDataList(queryCrit);
                TempData["CodeBase"] = objLst;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "HRAdd", null);
            }
            return View();
        }
        [HttpPost]
        public ActionResult Add(HRData data)
        {
            try
            {
                MysqlDBA<HRAlloc> mysqlDBA = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
                HRAlloc alloc = new HRAlloc();
                alloc.Year = (DateTime.Now.Year - 1911).ToString();
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    //Log.Error(ex + ex.StackTrace);
                    TempData["SessionExipred"] = "true";
                    //TempData["error"] = ex + ex.StackTrace;
                    //tran.Rollback();
                    return RedirectToAction("Index", "Login", null);
                }
                alloc.INSTNO = Session["INSTNO"].ToString();
                //-1代表新增，取新流水號
                if (data.HRAllocSerNo1 == "-1")
                {
                    alloc.HRAllocSerNo = Utility.Utility.getHRAllocSerNo(mysqlDBA);
                    alloc.HRAllocSerNo++;
                }
                else
                {
                    //不是-1表修改，帶原來流水號
                    alloc.HRAllocSerNo = int.Parse(data.HRAllocSerNo1);
                }
                
                alloc.JobType = data.personadmin;
                alloc.PROBG = data.ProfBackSelect;
                alloc.FullTimeNum = int.Parse(data.ProfCount);
                alloc.PartTimeNum = int.Parse(data.BeitCount);
                alloc.Modifydate = DateTime.Now.ToString("yyyy-MM-dd");
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
                return RedirectToAction("Index", "HRAdd", null);
            }
            return RedirectToAction("Index", "HRAdd", null);
        }

        //private int getHRAllocSerNo(MysqlDBA<HRAlloc> mysqlDBA)
        //{
            
        //}
    }
}