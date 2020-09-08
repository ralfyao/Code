using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class MeetingAddController : Controller
    {
        // GET: MeetingAdd
        public ActionResult Index()
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                //Log.Error(ex + ex.StackTrace);
                TempData["SessionExipred"] = "true";
                //TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Login", null);
            }
            return View();
        }
        public ActionResult Add(MeetingView data)
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
                MysqlDBA<UnitAMeeting> mysqlDBA = new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR);
                UnitAMeeting alloc = new UnitAMeeting();
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
                if (data.MSerial == "-1" || string.IsNullOrEmpty(data.MSerial))
                {
                    alloc.MSerialNo = Utility.Utility.getMeetingSerNo(mysqlDBA);
                    alloc.MSerialNo++;
                }
                else
                {
                    //不是-1表修改，帶原來流水號
                    alloc.MSerialNo = int.Parse(data.MSerial);
                }
                alloc.MType = "1";
                string verifyDateResult = Utility.Utility.verifyDate(data.date);
                if (verifyDateResult == "DateError") { TempData["error"] = "日期格式錯誤，需為民國年/月月/日日 如：109/09/08"; return RedirectToAction("Index", "MeetingAdd", null); }
                alloc.MDate = Utility.Utility.convertROC2UDTDateFormat( data.date);
                alloc.Topic = data.topic;
                alloc.AttendNum = int.Parse(data.attend);
                alloc.ModifyDate = DateTime.Now.ToString("yyyy-MM-dd");
                alloc.CreateDate = DateTime.Parse(alloc.CreateDate==null?DateTime.Now.ToString("yyyy-MM-dd"): alloc.CreateDate).ToString("yyyy-MM-dd");
                alloc.ProfCnt = 0;
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
                return RedirectToAction("Index", "MeetingAdd", null);
            }
            return RedirectToAction("Index", "MeetingAdd");
        }
        
    }
}