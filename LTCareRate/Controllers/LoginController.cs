using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace LTCareRate.Controllers
{
    public class LoginController : Controller
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        // GET: Login
        public ActionResult Index()
        {
            if (Session["AccountNo"] != null)
            {
                return View();
            }
            TempData["action"] = "query";
            return View();
        }
        //[HttpPost]
        //public ActionResult Index(AccountBase model)
        //{
           
        //}
        [HttpPost]
        [CaptchaMvc.Attributes.CaptchaVerify("Captcha is not valid")]
        public ActionResult Login(FormCollection post)
        {
            if (ModelState.IsValid)
            {
                string account = string.Empty;
                //this.IsCaptchaValid("Captcha is not valid");
                string password = string.Empty;
                CodeBase roleCode = new CodeBase();
                roleCode.CodeTable = "AccountBase";
                roleCode.CodeField = "AccountType";
                List<CodeBase> roleCodeList = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getDataList(roleCode);
                Log.Info("Login-page started...");
                try
                {
                    account = post["AccountNo"];
                    password = post["AcntPwd"];
                    AccountBase accountBase = new AccountBase();
                    accountBase.AccountNo = account;
                    MysqlDBA<AccountBase> accountBaseDB = new MysqlDBA<AccountBase>(ConfigurationManager.ConnectionStrings["MysqlConn"].ConnectionString);
                    List<AccountBase> accountBasesList = (List<AccountBase>)accountBaseDB.getDataList(accountBase);
                    if (accountBasesList.Count == 0)
                    {
                        TempData["action"] = "query";
                        TempData["error"] = "無此帳號：" + account;
                        return RedirectToAction("Index", "Login", null);
                    }
                    bool verifyPasswd = false;
                    //檢查使用者角色，有則帶到主頁面
                    bool userRole = false;
                    accountBasesList.ForEach(o =>
                    {
                        if (o.AccountNo == account && o.AcntPwd == password)
                        {
                            verifyPasswd = true;
                            Session["INSTNO"] = o.AcntTypeNo;
                            Session["AccountNo"] = account;
                            Session["AccountName"] = o.AcoountName;
                            Session["AccountBase"] = o;
                            roleCodeList.ForEach(t =>
                            {
                                if (o.AccountType.Trim() == t.CodeValue.Trim())
                                {
                                    userRole = true;
                                    Session["userRole"] = o.AccountType;
                                }
                            });
                        }
                    });
                    if (!userRole)
                    {
                        TempData["action"] = "query";
                        TempData["error"] = "帳號：" + account + "未設系統定角色!";
                        return RedirectToAction("Index", "Login", null);
                    }
                    if (!verifyPasswd)
                    {
                        TempData["action"] = "query";
                        TempData["error"] = "帳號：" + account + "密碼錯誤!";
                        return RedirectToAction("Index", "Login", null);
                    }
                }
                catch (Exception ex)
                {
                    Log.Error(ex + ex.StackTrace);
                    TempData["action"] = "query";
                    TempData["error"] = ex + ex.StackTrace;
                    return RedirectToAction("Index", "Login", null);
                }
                TempData["action"] = "query";
                Session["AccountNo"] = account;
                return RedirectToAction("Index", "Home", null);
            }
            else
            {
                
            }
            if (Session["userRole"] != null && Session["userRole"].ToString() == "1")
            {
                TempData["action"] = "query";
            }
            else
            {
                TempData["error"] = "Error: 連線失效或無效的驗證碼，請重新登入.";
                return RedirectToAction("Index", "Login", null);
            }
            if (Session["userRole"].ToString() == "2")
            {
                TempData["action"] = "committee";
            }
            if (Session["userRole"].ToString() == "9")
            {
                TempData["action"] = "admin";
            }
            TempData["error"] = "Error: 無效的驗證碼.";
            return RedirectToAction("Index", "Login", null);
        }
    }
}