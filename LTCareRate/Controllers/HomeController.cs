using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            //{
            //    TempData["SessionExipred"] = "true";
            //    return RedirectToAction("Index", "Login", null);
            //}
            List<LatestNews> ViewModel = new List<LatestNews>();
            List<MessageRec> dataSet = null;
            //List<AccountBase> retObj = null;
            try
            {
                MysqlDBA<MessageRec> mysqlDBA = new MysqlDBA<MessageRec>(FunctionController.CONNSTR);
                MessageRec messageRec = new MessageRec();
                dataSet = (List<MessageRec>)mysqlDBA.getAllDataList(messageRec);
                dataSet.ForEach(obj => {
                    LatestNews obj1 = new LatestNews();
                    obj1.MsgSerialNo = obj.MsgSerialNo.ToString();
                    obj1.MsgSub = obj.MsgSub;
                    obj1.Attachs = obj.Attachs;
                    obj1.CreateDate = obj.CreateDate;
                    ViewModel.Add(obj1);
                });
                TempData["action"] = "latest";
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "latest";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "Home", null);
            }
            return View(ViewModel);
        }

        
    }
}