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
    public class MeetingController : Controller
    {
        private int defaulPageSize = 5;
        public ActionResult Index(int page = 1)
        {
            MeetingView viewObj = new MeetingView();
            try
            {
                UnitAMeeting queryCrit = new UnitAMeeting();
                queryCrit.INSTNO = Session["INSTNO"].ToString();
                queryCrit.MType = "1";
                viewObj.meetingList = ((List<UnitAMeeting>)new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR).getDataListNoKey(queryCrit)).OrderBy(p => p.MSerialNo).ToPagedList(page, defaulPageSize);
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Meeting", null);
            }
            return View(viewObj);
        }
        // GET: Meeting
        public ActionResult Edit(string MSerNo)
        {
            try
            {
                List<UnitAMeeting> listData = new List<UnitAMeeting>();
                UnitAMeeting queryCrit = new UnitAMeeting();
                queryCrit.MSerialNo = int.Parse(MSerNo);
                MysqlDBA<UnitAMeeting> mysqlDBA = new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR);
                DataSet ds = mysqlDBA.getDataSet(string.Format("SELECT * FROM UnitAMeeting WHERE MSerialNo = '{0}'", queryCrit.MSerialNo));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UnitAMeeting data = new UnitAMeeting();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.MSerialNo = int.Parse(row["MSerialNo"].ToString());
                    data.MType = row["MType"].ToString();
                    data.MDate = Utility.Utility.convertUDT2ROCDateFormat(DateTime.Parse(row["MDate"].ToString()).ToString("MM/dd/yyyy"));
                    data.Topic = row["Topic"].ToString();
                    data.AttendNum = int.Parse(row["AttendNum"].ToString());
                    data.ProfCnt = int.Parse(row["ProfCnt"].ToString());
                    data.CreateDate = row["CreateDate"].ToString();
                    data.ModifyDate = row["ModifyDate"].ToString();
                    listData.Add(data);
                }
                TempData["UnitAMeeting"] = listData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "Meeting", null);
            }
            return RedirectToAction("Index", "MeetingAdd", null);
        }
        public ActionResult Delete(string MSerNo)
        {
            try
            {
                UnitAMeeting queryCrit = new UnitAMeeting();
                queryCrit.MSerialNo = int.Parse(MSerNo);
                MysqlDBA<UnitAMeeting> mysqlDBA = new MysqlDBA<UnitAMeeting>(FunctionController.CONNSTR);
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
                return RedirectToAction("Index", "MeetingAdd", null);
            }
            return RedirectToAction("Index", "MeetingAdd", null);
        }
    }
}