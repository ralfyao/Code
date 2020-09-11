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
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            return View();
        }
        [HttpPost]
        public ActionResult Index(FormCollection formDataCollection)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            return RedirectToAction("Index", "SupportUnit");
        }
        [HttpPost]
        public ActionResult UploadCaseList(HttpPostedFileBase file_input_list)
        {
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
            DataSet result;
            DataRowCollection dataRow;
            DataColumnCollection dataColumn;
            int colIndex = 1;
            int rowIndex = 0;
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
                    Dictionary<string, string> chkCaseNo = new Dictionary<string, string>();
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
                            //result.Tables[0].DefaultView.Sort = result.Tables[0].Columns[0].ColumnName;
                            dataRow = result.Tables[0].Rows;
                            dataColumn = result.Tables[0].Columns;
                            string strCaseNo = string.Empty;
                            for (int i = 3; i < dataRow.Count; i++)
                            {
                                try
                                {
                                    rowIndex = i;
                                    colIndex = 0;
                                    string caseNo = string.Empty;
                                    string startDate = string.Empty;
                                    string signDate = string.Empty;
                                    string cfDate = string.Empty;
                                    string aToBDate = string.Empty;
                                    string firstSvrDate = string.Empty;
                                    caseNo = result.Tables[0].Rows[i][colIndex].ToString(); colIndex++;
                                    DateTime startDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    startDate = (startDateTime.Year + 1911) + "-" + startDateTime.Month.ToString("00") + "-" + startDateTime.Day.ToString("00");
                                    DateTime signDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    signDate = (signDateTime.Year + 1911) + "-" + signDateTime.Month.ToString("00") + "-" + signDateTime.Day.ToString("00");
                                    DateTime cfDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    cfDate = (cfDateTime.Year + 1911) + "-" + cfDateTime.Month.ToString("00") + "-" + cfDateTime.Day.ToString("00");
                                    DateTime aToBDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    aToBDate = (aToBDateTime.Year + 1911) + "-" + aToBDateTime.Month.ToString("00") + "-" + aToBDateTime.Day.ToString("00");
                                    DateTime firstSvrDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    firstSvrDate = (firstSvrDateTime.Year + 1911) + "-" + firstSvrDateTime.Month.ToString("00") + "-" + firstSvrDateTime.Day.ToString("00");
                                }
                                catch (Exception ex)
                                {
                                    TempData["error"] = "檔案格式錯誤，在第" + rowIndex + "列第" + colIndex + "欄";
                                    return RedirectToAction("Index", "CaseListCount", null);
                                }
                                //檢查檔案內容案號
                                if (chkCaseNo.ContainsKey(result.Tables[0].Rows[i][0].ToString()))
                                {
                                    TempData["error"] = "案號" + result.Tables[0].Rows[i][0].ToString() + "重複!";
                                    return RedirectToAction("Index", "CaseListCount", null);
                                }
                                else
                                {
                                    chkCaseNo.Add(result.Tables[0].Rows[i][0].ToString(), null);
                                }
                                //檢查資料庫案號
                                //eachObj = new CaseSvrRec();
                                //eachObj.CaseNo = result.Tables[0].Rows[i][0].ToString();
                                //if (new MysqlDBA<CaseSvrRec>(FunctionController.CONNSTR).getDataListNoKey(eachObj).Count() > 0)
                                //{
                                //    TempData["error"] = "案號" + result.Tables[0].Rows[i][0].ToString() + "重複!";
                                //    return RedirectToAction("Index", "CaseListCount", null);
                                //}
                            }
                            mysqlDBA.Delete(new CaseSvrRec()
                            {
                                INSTNO = Session["INSTNO"].ToString(),
                                Year = (DateTime.Now.Year - 1911).ToString()
                            });
                            for (int i = 3; i < dataRow.Count; i++)
                            {
                                rowIndex = i;
                                string caseNo = string.Empty;
                                string startDate = string.Empty;
                                string signDate = string.Empty;
                                string cfDate = string.Empty;
                                string aToBDate = string.Empty;
                                string firstSvrDate = string.Empty;
                                eachObj = new CaseSvrRec();
                                string year = (DateTime.Now.Year - 1911).ToString();
                                string INSTNO = Session["INSTNO"].ToString();
                                int intcaseSerialNo = Utility.Utility.getCaseSrvRecSerNo(mysqlDBA);
                                intcaseSerialNo++;
                                string caseSerialNo = intcaseSerialNo.ToString();
                                colIndex = 0;
                                caseNo = result.Tables[0].Rows[i][colIndex].ToString(); colIndex++;
                                try
                                {
                                    DateTime startDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    startDate = (startDateTime.Year + 1911) + "-" + startDateTime.Month.ToString("00") + "-" + startDateTime.Day.ToString("00");
                                    DateTime signDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    signDate = (signDateTime.Year + 1911) + "-" + signDateTime.Month.ToString("00") + "-" + signDateTime.Day.ToString("00");
                                    DateTime cfDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    cfDate = (cfDateTime.Year + 1911) + "-" + cfDateTime.Month.ToString("00") + "-" + cfDateTime.Day.ToString("00");
                                    DateTime aToBDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    aToBDate = (aToBDateTime.Year + 1911) + "-" + aToBDateTime.Month.ToString("00") + "-" + aToBDateTime.Day.ToString("00");
                                    DateTime firstSvrDateTime = DateTime.Parse(result.Tables[0].Rows[i][colIndex].ToString()); colIndex++;
                                    firstSvrDate = (firstSvrDateTime.Year + 1911) + "-" + firstSvrDateTime.Month.ToString("00") + "-" + firstSvrDateTime.Day.ToString("00");
                                }
                                catch (Exception ex)
                                {
                                    TempData["error"] = "檔案格式錯誤，在第" + rowIndex + "列第" + colIndex + "欄";
                                    return RedirectToAction("Index", "CaseListCount", null);
                                }
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
            catch (FormatException ex1)
            {
                Log.Error(ex1+ex1.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = "檔案格式錯誤，在第"+rowIndex+"列第"+colIndex+"欄";
                return RedirectToAction("Index", "CaseListCount", null);
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "CaseListCount", null);
            }
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
            if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
            {
                TempData["SessionExipred"] = "true";
                return RedirectToAction("Index", "Login", null);
            }
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
                                int j = 1;
                                try
                                {
                                    caseSvr.OldCaseNum = int.Parse(result.Tables[0].Rows[i][j].ToString()); j++;//2020-09-01 OldCaseNum不使用
                                    //2020-09-01 Svr01CaseRenum --> 新案複評量, Svr02CaseRenum --> A單位計畫複評量
                                    //caseSvr.Svr01CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    //caseSvr.Svr02CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
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
                                    TempData["error"] = "數字格式錯誤!在第" + i + "列第" + j + "行";
                                    return RedirectToAction("Index", "CaseListCount", null);
                                }
                            }
                            mysqlDBA.Delete(new CaseSvr()
                            {
                                INSTNO = Session["INSTNO"].ToString(),
                                Year = (DateTime.Now.Year - 1911).ToString()
                            });
                            for (int i = 1; i < dataRow.Count; i++)
                            {
                                caseSvr = new CaseSvr();
                                caseSvr.Year = (DateTime.Now.Year - 1911).ToString();
                                caseSvr.INSTNO = Session["INSTNO"].ToString();
                                caseSvr.YM = result.Tables[0].Rows[i][0].ToString();
                                int j = 1;
                                try
                                {
                                    caseSvr.OldCaseNum = int.Parse(result.Tables[0].Rows[i][j].ToString()); j++;//2020-09-01 OldCaseNum不使用
                                    //2020-09-01 Svr01CaseRenum --> 新案複評量, Svr02CaseRenum --> A單位計畫複評量
                                    //caseSvr.Svr01CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
                                    //caseSvr.Svr02CaseRenum = int.Parse(convertNullNumericString(result.Tables[0].Rows[i][j].ToString())); j++;
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
                                    TempData["error"] = "數字格式錯誤!在第" + i + "列第" + j + "行";
                                    return RedirectToAction("Index", "CaseListCount", null);
                                }
                                mysqlDBA.InsertOrUpdate(caseSvr);
                            }
                        }
                    }
                    Dictionary<string, string> param1 = new Dictionary<string, string>();
                    param1.Add("EvalYear", (DateTime.Now.Year - 1911).ToString());
                    param1.Add("UnitAInstNo", Session["INSTNO"].ToString());
                    mysqlDBA.ExecuteProcedure("UpdateNewCaseSvr", param1);
                    TempData["success"] = "OK";
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "CaseListCount", null);
            }
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