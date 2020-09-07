using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class DownLoadController : Controller
    {
        // GET: DownLoad
        public ActionResult Index()
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            return View();
        }
        public FileResult CaseList()
        {
            var fileName = Server.MapPath("~/Files/個案清冊格式.xlsx");
            return File(fileName, "application/ms-excel", "個案清冊格式.xlsx");
        }
        public FileResult CaseCount()
        {
            var fileName = Server.MapPath("~/Files/個案評鑑服務量.xlsx");
            return File(fileName, "application/ms-excel", "個案評鑑服務量.xlsx");
        }
        public FileResult CaseListExample()
        {
            var fileName = Server.MapPath("~/Files/個案清冊格式_範例.xlsx");
            return File(fileName, "application/ms-excel", "個案清冊格式_範例.xlsx");
        }
        public FileResult CaseCountExample()
        {
            var fileName = Server.MapPath("~/Files/個案評鑑服務量_範例.xlsx");
            return File(fileName, "application/ms-excel", "個案評鑑服務量_範例.xlsx");
        }
    }
}