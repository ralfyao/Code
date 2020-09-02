﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class LogOutController : Controller
    {
        // GET: LogOut
        public ActionResult Index()
        {
            Session["AccountNo"] = null;
            Session["INSTNO"] = null;
            return RedirectToAction("Index", "Login");
        }
    }
}