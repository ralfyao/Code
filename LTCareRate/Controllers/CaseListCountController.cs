using ExcelDataReader;
using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Utility;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class CaseListCountController : Controller
    {
        // GET: CaseListCount
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection formDataCollection)
        {
            return RedirectToAction("Index", "SupportUnit");
        }
        [HttpPost]
        public ActionResult UploadCaseList(HttpPostedFileBase file_input_list)
        {
            DataSet result;
            DataRowCollection dataRow;
            DataColumnCollection dataColumn;
            try
            {
                MysqlDBA<CaseSvrRec> mysqlDBA = new MysqlDBA<CaseSvrRec>(FunctionController.CONNSTR);
                CaseSvrRec eachObj = new CaseSvrRec();
                if (file_input_list == null || file_input_list.ContentLength == 0)
                {
                    TempData["error"] = "請先上傳檔案!";
                    return RedirectToAction("Index", "CaseListCount", null);
                }
                if (file_input_list.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file_input_list.FileName);
                    //檔案明加上時間戳記
                    fileName = fileName.Split('.')[0] + DateTime.Now.ToString("yyyyMMddHHmmss") + "." + fileName.Split('.')[1];
                    var path = Path.Combine(Server.MapPath("~/FileUploads"), fileName);
                    file_input_list.SaveAs(path);
                    using (FileStream fileStream = System.IO.File.Open(path, FileMode.Open, FileAccess.Read))
                    {
                        using (IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(fileStream))
                        {
                            result = excelReader.AsDataSet(new ExcelDataSetConfiguration()
                            {
                                UseColumnDataType = false,
                                ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                                {
                                    //設定讀取資料時是否忽略標題
                                    UseHeaderRow = false
                                }
                            });
                            dataRow = result.Tables[0].Rows;
                            dataColumn = result.Tables[0].Columns;
                            for (int i = 1; i < dataRow.Count; i++)
                            {
                                string caseNo = string.Empty;
                                string startDate = string.Empty;
                                string signDate = string.Empty;
                                string cfDate = string.Empty;
                                string aToBDate = string.Empty;
                                string firstSvrDate = string.Empty;
                                eachObj = new CaseSvrRec();
                                string year = (DateTime.Now.Year - 1911).ToString();
                                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                                {
                                    TempData["SessionExipred"] = "true";
                                    return RedirectToAction("Index", "Login", null);
                                }
                                string INSTNO = Session["INSTNO"].ToString();
                                int intcaseSerialNo = Utility.Utility.getCaseSrvRecSerNo(mysqlDBA);
                                intcaseSerialNo++;
                                string caseSerialNo = intcaseSerialNo.ToString();
                                caseNo = result.Tables[0].Rows[i][0].ToString();
                                DateTime startDateTime = DateTime.Parse(formatROCDate(result.Tables[0].Rows[i][1].ToString()));
                                startDate = (startDateTime.Year + 1911) + "-" + startDateTime.Month + "-" + startDateTime.Day;
                                DateTime signDateTime = DateTime.Parse(formatROCDate(result.Tables[0].Rows[i][2].ToString()));
                                signDate = (signDateTime.Year + 1911) + "-" + signDateTime.Month + "-" + signDateTime.Day;
                                DateTime cfDateTime = DateTime.Parse(formatROCDate(result.Tables[0].Rows[i][3].ToString()));
                                cfDate = (cfDateTime.Year + 1911) + "-" + cfDateTime.Month + "-" + cfDateTime.Day;
                                DateTime aToBDateTime = DateTime.Parse(formatROCDate(result.Tables[0].Rows[i][4].ToString()));
                                aToBDate = (aToBDateTime.Year + 1911) + "-" + aToBDateTime.Month + "-" + aToBDateTime.Day;
                                DateTime firstSvrDateTime = DateTime.Parse(formatROCDate(result.Tables[0].Rows[i][5].ToString()));
                                firstSvrDate = (firstSvrDateTime.Year + 1911) + "-" + firstSvrDateTime.Month + "-" + firstSvrDateTime.Day;
                                eachObj.Year = year;
                                eachObj.INSTNO = INSTNO;
                                eachObj.CaseSerNo = int.Parse(caseSerialNo);
                                eachObj.CaseNo = caseNo;
                                eachObj.StartDate = startDate;
                                eachObj.SignDate = signDate;
                                eachObj.CFDate = cfDate;
                                eachObj.AToBDate = aToBDate;
                                eachObj.FirstSvrDate = firstSvrDate;
                                eachObj.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                                mysqlDBA.InsertOrUpdate(eachObj);
                            }
                        }
                    }
                    Dictionary<string, string> param1 = new Dictionary<string, string>();
                    param1.Add("EvalYear", (DateTime.Now.Year - 1911).ToString());
                    param1.Add("UnitAInstNo", Session["INSTNO"].ToString());
                    mysqlDBA.ExecuteProcedure("UpdateNewCaseSvr", param1);
                    TempData["success"] = "OK";
                }
                else
                {
                    TempData["error"] = "請上傳檔案!";
                    return RedirectToAction("Index", "CaseListCount", null);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //if (workbook != null)
                //    workbook.Close();
                //if (app != null)
                //    app.Quit();
                //tran.Rollback();
                return RedirectToAction("Index", "CaseListCount", null);
            }
            //if (workbook != null)
            //    workbook.Close();
            //if (app != null)
            //    app.Quit();
            return RedirectToAction("Index", "CaseListCount");
        }

        private string formatROCDate(string v)
        {
            if (v.Length < 7)
                throw new Exception("日期格式不符!");
            return v.Substring(0, 3) + "/" + v.Substring(3, 2) + "/" + v.Substring(5, 2);
        }

        [HttpPost]
        public ActionResult UploadCaseCount(HttpPostedFileBase file_input_count)
        {
            //Microsoft.Office.Interop.Excel._Application app = null;
            //Microsoft.Office.Interop.Excel._Workbook workbook = null;
            DataSet result;
            DataRowCollection dataRow;
            DataColumnCollection dataColumn;
            MysqlDBA<CaseSvr> mysqlDBA = new MysqlDBA<CaseSvr>(FunctionController.CONNSTR);
            try
            {
                if (file_input_count == null || file_input_count.ContentLength == 0)
                {
                    TempData["error"] = "請先上傳檔案!";
                    return RedirectToAction("Index", "CaseListCount", null);
                }
                if (file_input_count.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file_input_count.FileName);
                    fileName = fileName.Split('.')[0] + DateTime.Now.ToString("yyyyMMddHHmmss")+"." + fileName.Split('.')[1];
                    var path = Path.Combine(Server.MapPath("~/FileUploads"), fileName);
                    file_input_count.SaveAs(path);
                    CaseSvr caseSvr = new CaseSvr();
                    using (FileStream fileStream = System.IO.File.Open(path, FileMode.Open, FileAccess.Read))
                    {
                        using (IExcelDataReader excelReader = ExcelReaderFactory.CreateOpenXmlReader(fileStream))
                        {
                            result = excelReader.AsDataSet(new ExcelDataSetConfiguration()
                            {
                                UseColumnDataType = false,
                                ConfigureDataTable = (tableReader) => new ExcelDataTableConfiguration()
                                {
                                    //設定讀取資料時是否忽略標題
                                    UseHeaderRow = false
                                }
                            });
                            dataRow = result.Tables[0].Rows;
                            dataColumn = result.Tables[0].Columns;
                            for (int i = 1; i < dataRow.Count; i++)
                            {
                                caseSvr = new CaseSvr();
                                caseSvr.Year = (DateTime.Now.Year - 1911).ToString();
                                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                                {
                                    TempData["SessionExipred"] = "true";
                                    return RedirectToAction("Index", "Login", null);
                                }
                                caseSvr.INSTNO = Session["INSTNO"].ToString();
                                caseSvr.YM = result.Tables[0].Rows[i][0].ToString();
                                int j = 1;
                                try
                                {
                                    //caseSvr.OldCaseNum = int.Parse(result.Tables[0].Rows[i][1].ToString());//2020-09-01 OldCaseNum不使用
                                    //2020-09-01 Svr01CaseRenum --> 新案複評量, Svr02CaseRenum --> A單位計畫複評量
                                    caseSvr.Svr01CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    caseSvr.Svr02CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    //2020-09-01 Svr01CaseRenum --> 新案複評量, Svr02CaseRenum --> A單位計畫複評量
                                    caseSvr.TraceCaseTotal = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    caseSvr.MultSvrCaseNum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    caseSvr.SelfReferral = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    caseSvr.FullPeoNum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    caseSvr.PartPeoNum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    //}
                                    caseSvr.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                                }
                                catch (FormatException ex)
                                {
                                    throw new Exception("數字格式錯誤!在第" + i + "列第" + j + "行");
                                }
                                mysqlDBA.InsertOrUpdate(caseSvr);
                            }
                        }
                    }
                    TempData["success"] = "OK";
                    // creating Excel Application  
                    //app = new Microsoft.Office.Interop.Excel.Application();
                    //workbook = app.Workbooks.Open(path, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                    //Microsoft.Office.Interop.Excel._Worksheet worksheet = workbook.ActiveSheet;
                    //Microsoft.Office.Interop.Excel.Range rng = worksheet.UsedRange;
                    //for (int i = 2; i <= rng.Rows.Count; i++)
                    //{
                    //    caseSvr = new CaseSvr();
                    //    caseSvr.Year = (DateTime.Now.Year - 1911).ToString();
                    //    if (string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                    //    {
                    //        TempData["SessionExipred"] = "true";
                    //        return RedirectToAction("Index", "Login", null);
                    //    }
                    //    caseSvr.INSTNO = Session["INSTNO"].ToString();
                    //    caseSvr.YM = worksheet.Cells[i, 1].Text;
                    //    try
                    //    {
                    //        caseSvr.OldCaseNum = int.Parse(worksheet.Cells[i, 2].Text);
                    //        caseSvr.TraceCaseTotal = int.Parse(worksheet.Cells[i, 3].Text);
                    //        caseSvr.MultSvrCaseNum = int.Parse(worksheet.Cells[i, 4].Text);
                    //        caseSvr.SelfReferral = int.Parse(worksheet.Cells[i, 5].Text);
                    //        caseSvr.FullPeoNum = int.Parse(worksheet.Cells[i, 6].Text);
                    //        caseSvr.PartPeoNum = int.Parse(worksheet.Cells[i, 7].Text);
                    //        caseSvr.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                    //    }
                    //    catch (FormatException ex)
                    //    {
                    //        throw new Exception("數字格式錯誤!在第" + i + "列");
                    //    }
                    //    mysqlDBA.InsertOrUpdate(caseSvr);
                    //}

                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //if (workbook != null)
                //    workbook.Close();
                //if (app != null)
                //    app.Quit();
                //tran.Rollback();
                return RedirectToAction("Index", "CaseListCount", null);
            }
            //if (workbook != null)
            //    workbook.Close();
            //if (app != null)
            //    app.Quit();
            return RedirectToAction("Index", "CaseListCount");
        }

        private string convertNullNumericString(string v)
        {
            if (string.IsNullOrEmpty(v))
                return "0";
            return v;
        }
    }
}