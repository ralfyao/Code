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
    }
}