using LongtermCare.DataModel.LongtermCare.DataModel;
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
    public class LatestNewsController : Controller
    {
        // GET: LatestNews
        public ActionResult Index(string MsgSerialNo)
        {
            LatestNews model = new LatestNews();
            try
            {
                MysqlDBA<MessageRec> mysqlDBA = new MysqlDBA<MessageRec>(FunctionController.CONNSTR);
                MessageRec messageRec = new MessageRec();
                messageRec.MsgSerialNo = int.Parse(MsgSerialNo);
                messageRec = Utility.Utility.getUniqueMessageRec(Utility.Utility.getMessageDataSet(mysqlDBA, messageRec));// (List<MessageRec>)mysqlDBA.getDataSet(string.Format("SELECT * FROM "));
                model.MsgData = messageRec.MsgData;
                model.MsgSerialNo = messageRec.MsgSerialNo.ToString();
                model.MsgSub = messageRec.MsgSub;
                model.Attachs = messageRec.Attachs;
                model.CreateDate = messageRec.CreateDate;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "latest";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "Home", null);
            }
            return View(model);
        }
    }
}