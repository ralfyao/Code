using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult BasicData(string accountNo)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            MysqlDBA<INSTBase> instBaseDBA = new MysqlDBA<INSTBase>(FunctionController.CONNSTR);
            MysqlDBA<UnitAYear> mysqlDBAUAY = new MysqlDBA<UnitAYear>(FunctionController.CONNSTR);
            if (accountNo == null)
            {
                TempData["SessionExipred"] = "true";
                return View("Index", "Login", null);
            }
            string INSTNO = accountNo;//((string[)accountNo)[0].ToString();
            BasicData basicData = new BasicData();
            INSTBase instBase = new INSTBase();
            UnitAYear queryCrit = new UnitAYear();
            queryCrit.Year = (DateTime.Now.Year - 1911).ToString();
            queryCrit.INSTNO = INSTNO;
            List<UnitAYear> listResult = (List<UnitAYear>)mysqlDBAUAY.getDataList(queryCrit);
            UnitAYear result = new UnitAYear();
            if (listResult.Count > 0)
            {
                result = listResult[0];
            }
            try
            {
                instBase.INSTNO = INSTNO;
                List<INSTBase> objInstList = (List<INSTBase>)instBaseDBA.getDataList(instBase);
                if (objInstList.Count > 0)
                {
                    basicData.INSTNO = objInstList[0].INSTNO;
                    basicData.INSTName = objInstList[0].INSTName;
                    basicData.INSTTel = result.ContactTel;
                    basicData.address = objInstList[0].INSTAddress;
                    basicData.Contact = result.Contact;
                    basicData.AttrMed = Utility.Utility.getBaseAttr(objInstList[0].AttrMed);;
                    if (objInstList.Count > 0 && objInstList[0] != null && !string.IsNullOrEmpty(objInstList[0].IncDate))
                    {
                        basicData.EstabDate = (DateTime.Parse(objInstList[0].IncDate).Year - 1911).ToString() + "年"
                                             + DateTime.Parse(objInstList[0].IncDate).Month + "月"
                                             + DateTime.Parse(objInstList[0].IncDate).Day + "日";
                    }
                    basicData.SpecialArea = result.MainAreas;
                    basicData.EMail = result.EMail;
                    basicData.ResignNum = result.ResignNum;
                    basicData.CMDBegYearNum = result.CMDBegYearNum;
                    basicData.CMDPeriodAddNum = result.CMDPeriodAddNum;
                    HRAlloc hRAlloc = new HRAlloc();
                    hRAlloc.INSTNO = INSTNO;
                    hRAlloc.Year = (DateTime.Now.Year - 1911).ToString();
                    //人力配置
                    basicData.hrAlloc = Utility.Utility.getHRAlloc(hRAlloc);
                    foreach (HRAlloc alloc in basicData.hrAlloc)
                    {
                        alloc.JobType = Utility.Utility.getCodeBaseText((List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getDataList(new CodeBase()), "HRAlloc", "JobType", alloc.JobType);
                        alloc.PROBG = Utility.Utility.getCodeBaseText((List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getDataList(new CodeBase()), "HRAlloc", "ProfBack", alloc.PROBG);
                        alloc.FullTimeNum = alloc.FullTimeNum;
                        alloc.PartTimeNum = alloc.PartTimeNum;
                    }
                    //合作提供服務單位
                    List<UnitAToBSum> list = new List<UnitAToBSum>();
                    MysqlDBA<UnitAToBSum> mysqlDBA_UAB = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                    UnitAToBSum queryCritUAB = new UnitAToBSum();
                    queryCrit.Year = (DateTime.Now.Year - 1911).ToString();
                    queryCrit.INSTNO = INSTNO;
                    list = (List<UnitAToBSum>)mysqlDBA_UAB.getDataList(queryCritUAB);
                    basicData.unitAToBSums = list;
                    //個管服務量
                    List<CaseSvr> listCaseSvr = new List<CaseSvr>();
                    MysqlDBA<CaseSvr> mysqlDBA_CaseSvr = new MysqlDBA<CaseSvr>(FunctionController.CONNSTR);
                    CaseSvr queryCritCaseSvr = new CaseSvr();
                    queryCritCaseSvr.Year = (DateTime.Now.Year - 1911).ToString();
                    queryCritCaseSvr.INSTNO = INSTNO;
                    listCaseSvr = (List<CaseSvr>)mysqlDBA_CaseSvr.getDataList(queryCritCaseSvr);
                    basicData.caseSvrs = listCaseSvr;
                    //個管服務時效
                    List<CaseSvrEff> listCaseSvrEff = new List<CaseSvrEff>();
                    MysqlDBA<CaseSvrEff> mysqlDBA_CaseSvrEff = new MysqlDBA<CaseSvrEff>(FunctionController.CONNSTR);
                    CaseSvrEff queryCritCaseSvrEff = new CaseSvrEff();
                    queryCritCaseSvrEff.Year = (DateTime.Now.Year - 1911).ToString();
                    queryCritCaseSvrEff.INSTNO = INSTNO;
                    listCaseSvrEff = (List<CaseSvrEff>)mysqlDBA_CaseSvrEff.getDataList(queryCritCaseSvrEff);
                    basicData.caseSvrsEff = listCaseSvrEff;
                    CaseSvrEffView obj = null;
                    foreach (CaseSvrEff eff in basicData.caseSvrsEff)
                    {
                        var viewObj = from vo in basicData.caseSvrsEffView
                                      where vo.Year == eff.Year && vo.YM == eff.YM && vo.INSTNO == eff.INSTNO 
                                      select vo;
                        if (viewObj.ToList().Count > 0)
                        {
                            obj = (CaseSvrEffView)viewObj.ToList()[0];
                        }
                        else
                        {
                            obj = new CaseSvrEffView();
                            obj.Year = eff.Year;
                            obj.YM = eff.YM;
                            obj.INSTNO = eff.INSTNO;
                            basicData.caseSvrsEffView.Add(obj);
                        }
                        if (eff.SvrType == "01")
                        {
                            obj._01UpAvgDays = eff.UpAvgDays;
                        }
                        if (eff.SvrType == "02")
                        {
                            obj._02UpCasePer = eff.UpCasePer;
                        }
                        if (eff.SvrType == "03")
                        {
                            obj._03UpCasePer = eff.UpCasePer;
                        }
                    }
                    if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                    {
                        TempData["SessionExipred"] = "true";
                        return RedirectToAction("Index", "Login", null);
                    }
                    //社區資源網絡會議
                    List<UnitAMeeting> lstCommResMeeting = (List<UnitAMeeting>)new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR).getDataListNoKey(
                        new UnitAMeeting() { INSTNO = Session["INSTNO"].ToString(), MType = "1"}
                        );
                    lstCommResMeeting.ForEach(o => o.MDate = Utility.Utility.convertUDT2ROCDateFormat(o.MDate));
                    basicData.commResMeeting = lstCommResMeeting;
                    //區域跨專業個案討論會
                    List<UnitAMeeting> lstAreaProfMeeting = (List<UnitAMeeting>)new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR).getDataListNoKey(
                        new UnitAMeeting() { INSTNO = Session["INSTNO"].ToString(), MType = "2" }
                        );
                    lstAreaProfMeeting.ForEach(o => o.MDate = Utility.Utility.convertUDT2ROCDateFormat(o.MDate));
                    basicData.areaProfMeeting = lstAreaProfMeeting;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "query";
                TempData["error"] = ex + ex.StackTrace;
                return View("Index", "Function", null);
            }
            return View(basicData);
        }

        //public ActionResult CaseServiceCount(string accountNo)
        //{
        //    try
        //    {

        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(ex + ex.StackTrace);
        //        TempData["action"] = "query";
        //        TempData["error"] = ex + ex.StackTrace;
        //        return View("Index", "Function", null);
        //    }
        //    return View();
        //}

        //public ViewResult ServiceUnit(string accountNo)
        //{
            
        //    try
        //    {
                
        //    }
        //    catch (Exception ex)
        //    {
        //        Log.Error(ex + ex.StackTrace);
        //        TempData["action"] = "query";
        //        TempData["error"] = ex + ex.StackTrace;
        //        return View("Index", "Function", null);
        //    }
        //    return View();
        //}
    }
}