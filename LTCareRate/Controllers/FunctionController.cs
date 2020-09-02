﻿using LongtermCare.DataModel.LongtermCare.DataModel;
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
                    inst.INSTNO = listdataAccount[0].INSTNO;
                    List<INSTBase> listdataInst = (List<INSTBase>)mysqlDBA_INSTBase.getDataList(inst);
                    if (listdataInst.Count > 0)
                    {
                        baseData = listdataInst[0];
                        model.INSTName = baseData.INSTName;
                        model.INSTTel = baseData.INSTTel;
                        model.EstabDate = Utility.Utility.convertUDT2ROCDateFormat(baseData.IncDate);
                        model.city = baseData.INSTAddress.Substring(0, 3);
                        model.area = baseData.INSTAddress.Substring(3, 3);
                        model.address = baseData.INSTAddress.Substring(6);
                        model.AttrMed = Utility.Utility.getBaseAttr(baseData.AttrMed);
                        model.AttrLC = Utility.Utility.getBaseAttr(baseData.AttrLC);
                        model.AttrOther = Utility.Utility.getBaseAttr(baseData.AttrOther);
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
                string areaCode = new Random().Next(1, 9).ToString();
                uaY.Year = (DateTime.Now.Year - 1911).ToString();
                uaY.INSTNO = instNo;
                uaY.INSTName = post.INSTName;
                uaY.INSTTel = post.INSTTel;
                uaY.INSTAddress = post.city + post.area + post.address;
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
                baseInst.INSTAddress = post.city + post.area + post.address;
                baseInst.INSTTel = post.INSTTel;
                baseInst.IncDate = Utility.Utility.convertROC2UDTDateFormat(post.EstabDate);//new DateTime(int.Parse(post.EstabDate.Split('/')[0]), int.Parse(post.EstabDate.Split('/')[1]), int.Parse(post.EstabDate.Split('/')[2])).ToString("yyyy-MM-dd HH:mm:ss") ;
                baseInst.AttrMed = getBaseAttrCode(post.AttrMed);
                baseInst.AttrLC = getBaseAttrCode(post.AttrLC);
                baseInst.AttrOther = getBaseAttrCode(post.AttrOther);
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
                baseattr.AttrName = medInst;
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

        //public ActionResult HR()
        //{
        //    TempData["action"] = "HR";
        //    return View();
        //}
    }
}