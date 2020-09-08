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
    public class CaseDiscussAddController : Controller
    {
        // GET: CaseDiscussAdd
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(MeetingView data)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            try
            {
                MysqlDBA<UnitAMeeting> mysqlDBA = new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR);
                UnitAMeeting alloc = new UnitAMeeting();
                alloc.Year = data.year;
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
                alloc.MType = "2";
                string verifyDateResult = Utility.Utility.verifyDate(data.date);
                if (verifyDateResult == "DateError") { TempData["error"] = "日期格式錯誤，需為民國年/月月/日日 如：109/09/08"; return RedirectToAction("Index", "CaseDiscussAdd", null); }
                alloc.MDate = Utility.Utility.convertROC2UDTDateFormat(data.date);
                alloc.Topic = data.topic;
                alloc.ProfCnt = int.Parse(string.IsNullOrEmpty(data.profcnt) ? "0" : data.profcnt);
                alloc.AttendNum = int.Parse(string.IsNullOrEmpty(data.attend) ? "0" :data.attend);
                alloc.ModifyDate = DateTime.Now.ToString("yyyy-MM-dd");
                alloc.CreateDate = DateTime.Parse(alloc.CreateDate == null ? DateTime.Now.ToString("yyyy-MM-dd") : alloc.CreateDate).ToString("yyyy-MM-dd");
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
                return RedirectToAction("Index", "CaseDiscussAdd", null);
            }
            return RedirectToAction("Index", "CaseDiscussAdd");
        }
    }
}