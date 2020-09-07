using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class FunctionController : Controller
    {
        public static readonly string CONNSTR = ConfigurationManager.ConnectionStrings["MysqlConn"].ConnectionString;
        // GET: Function
        public ActionResult Index()
        {
            MysqlDBA<AccountBase> mysqlDBA_AccountBase = new MysqlDBA<AccountBase>(CONNSTR);
            MysqlDBA<INSTBase> mysqlDBA_INSTBase = new MysqlDBA<INSTBase>(CONNSTR);
            MysqlDBA<CityBase> mysqlDBA_CityBase = new MysqlDBA<CityBase>(CONNSTR);
            MysqlDBA<AreaBase> mysqlDBA_AreaBase = new MysqlDBA<AreaBase>(CONNSTR);
            
            MysqlDBA<UnitAYear> mysqlDBA_UnitAYear = new MysqlDBA<UnitAYear>(CONNSTR);
            BasicData model = new BasicData();
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    TempData["SessionExipred"] = "true";
                    return RedirectToAction("Index", "Login", null);
                }
                string accountNo = Session["AccountNo"].ToString();
                
                AccountBase accountBase = new AccountBase();
                accountBase.AccountNo = accountNo;
                INSTBase baseData = null;
                List <AccountBase> listdataAccount = (List<AccountBase>)mysqlDBA_AccountBase.getDataList(accountBase);
                if (listdataAccount.Count > 0)
                {
                    INSTBase inst = new INSTBase();
                    inst.INSTNO = listdataAccount[0].AcntTypeNo;
                    List<INSTBase> listdataInst = (List<INSTBase>)mysqlDBA_INSTBase.getDataList(inst);
                    if (listdataInst.Count > 0)
                    {
                        baseData = listdataInst[0];
                        model.INSTName = baseData.INSTName;
                        model.INSTTel = baseData.INSTTel;
                        model.EstabDate = Utility.Utility.convertUDT2ROCDateFormat(baseData.IncDate);
                        model.city = Utility.Utility.getCityCode(baseData.INSTAddress.Substring(0, 3));
                        model.area = Utility.Utility.getAreaCode(baseData.INSTAddress.Substring(3, 3));
                        model.address = baseData.INSTAddress.Substring(6);
                        model.AttrMed = baseData.AttrMed;
                        if (baseData.IncDate != null)
                        {
                            model.EstabDate = Utility.Utility.convertUDT2ROCDateFormat(baseData.IncDate.ToString());
                        }
                        //model.AttrLC = baseData.AttrLC;
                        //model.AttrOther = baseData.AttrOther;
                        ViewBag.city = (List<CityBase>)mysqlDBA_CityBase.getAllDataList(new CityBase());
                        ViewBag.area = (List<AreaBase>)mysqlDBA_AreaBase.getAllDataList(new AreaBase());
                        UnitAYear unitAYear = new UnitAYear();
                        unitAYear.Year = (DateTime.Now.Year - 1911).ToString();
                        unitAYear.INSTNO = baseData.INSTNO;
                        List<UnitAYear> uaYList = (List<UnitAYear>)mysqlDBA_UnitAYear.getDataList(unitAYear);
                        if (uaYList.Count > 0)
                        {
                            ViewBag.uaYList = uaYList[0];
                            model.SpecialArea = uaYList[0].MainAreas;
                            
                        }
                        model.AttrMedList = Utility.Utility.getAttrList(AttrBase.TypeList.Medical);
                        model.AttrMedList.AddRange(Utility.Utility.getAttrList(AttrBase.TypeList.Longterm));
                        model.AttrMedList.AddRange(Utility.Utility.getAttrList(AttrBase.TypeList.Other));
                        //model.AttrLCList = Utility.Utility.getAttrList(AttrBase.TypeList.Longterm);
                        //model.AttrOtherList = Utility.Utility.getAttrList(AttrBase.TypeList.Other);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "query";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "Login", null);
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(BasicData post)
        {
            //MySqlTransaction tran = null;
            try
            {
                MysqlDBA<UnitAYear> mysqlDBA_UAY = new MysqlDBA<UnitAYear>(ConfigurationManager.ConnectionStrings["MysqlConn"].ConnectionString);
                MysqlDBA<INSTBase> mysqlDBA_InstBase = new MysqlDBA<INSTBase>(ConfigurationManager.ConnectionStrings["MysqlConn"].ConnectionString);
                //年度A單位機構評鑑
                UnitAYear uaY = new UnitAYear();
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    TempData["SessionExipred"] = "true";
                    return RedirectToAction("Index", "Login", null);
                }
                string instNo = Session["INSTNO"].ToString();
                string areaCode = post.area;
                string cityName = Utility.Utility.getCityBase(post.city);
                string areaName = Utility.Utility.getAreaBase(post.area);
                uaY.Year = (DateTime.Now.Year - 1911).ToString();
                uaY.INSTNO = instNo;
                uaY.INSTName = post.INSTName;
                uaY.INSTTel = post.INSTTel;
                uaY.CityCode = post.city;
                uaY.INSTAddress = cityName + areaName + post.address;
                uaY.MainAreas = post.SpecialArea;
                uaY.Contact = post.Contact;
                uaY.ContactTel = post.ContactTel;
                uaY.AreaCode = areaCode;
                uaY.EMail = post.EMail;
                uaY.Modifydate = DateTime.Now.ToString("yyyy-MM-dd");
                uaY.CreateUser = Session["AccountNo"].ToString();


                mysqlDBA_UAY.InsertOrUpdate(uaY);
                INSTBase baseInst = new INSTBase();
                baseInst.INSTName = post.INSTName;
                baseInst.INSTNO = instNo;
                baseInst.INSTAddress = cityName + areaName + post.address;
                baseInst.INSTTel = post.INSTTel;
                try { string[] strDate = post.EstabDate.Split('/'); if (strDate.Length != 3) { throw new Exception(); } else {
                        int.Parse(strDate[0]); 
                        int.Parse(strDate[1]); 
                        int.Parse(strDate[2]);
                        if (int.Parse(strDate[0]) < 0 || int.Parse(strDate[1]) < 0 || int.Parse(strDate[2]) < 0)
                        {
                            throw new Exception();
                        }
                        if (int.Parse(strDate[1]) > 12)
                        {
                            throw new Exception();
                        }
                        if (int.Parse(strDate[2]) > 31)
                        {
                            throw new Exception();
                        }
                    } baseInst.IncDate = Utility.Utility.convertROC2UDTDateFormat(post.EstabDate); } catch (Exception ex) { throw new Exception("日期格式有誤!格式為：民國年/月月/日日 ex:109/09/07"); } 
                //new DateTime(int.Parse(post.EstabDate.Split('/')[0]), int.Parse(post.EstabDate.Split('/')[1]), int.Parse(post.EstabDate.Split('/')[2])).ToString("yyyy-MM-dd HH:mm:ss") ;
                baseInst.AttrMed = post.AttrMed;
                //baseInst.AttrLC = post.AttrLC;
                //baseInst.AttrOther = post.AttrOther;
                mysqlDBA_InstBase.InsertOrUpdate(baseInst);
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "Function", null);
            }
            TempData["action"] = "HR";
            return RedirectToAction("Index", "HR", null);
        }
        public string getBaseAttrCode(string medInst)
        {
            string strRet = string.Empty;
            try
            {
                MysqlDBA<AttrBase> mysqlDBA_AttrBase = new MysqlDBA<AttrBase>(CONNSTR);
                AttrBase baseattr = new AttrBase();
                baseattr.AttrCode = medInst;
                List<AttrBase> objLst = (List<AttrBase>)mysqlDBA_AttrBase.getDataListNoKey(baseattr);
                if (objLst.Count > 0)
                {
                    strRet = objLst[0].AttrCode;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }
        [HttpPost]
        public ActionResult GetAreaDDLHtml(string city)
        {
            string tagName = "area";
            string _html = string.Empty;
            if (!string.IsNullOrWhiteSpace(city))
            {
                _html = Utility.Utility.getAreaDDL(city, tagName, null);
            }
            return Content(_html);
        }
        //public ActionResult HR()
        //{
        //    TempData["action"] = "HR";
        //    return View();
        //}
    }
}