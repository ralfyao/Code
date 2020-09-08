using ExcelDataReader;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using LTCareRate.Models.ViewModel;
using LTCareRate.Utility;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Controllers
{
    public class SupportUnitController : Controller
    {
        private int defaultPageSize = 5;
        // GET: SupportUnit
        public ActionResult Index(int page = 1)
        {
            List<UnitAToBSum> listData = new List<UnitAToBSum>();
            SupportUnitAdd model = new SupportUnitAdd();
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    //Log.Error(ex + ex.StackTrace);
                    TempData["SessionExipred"] = "true";
                    //TempData["error"] = ex + ex.StackTrace;
                    //tran.Rollback();
                    return RedirectToAction("Index", "Login", null);
                }
                MysqlDBA<UnitAToBSum> dbaHRAlloc = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = (DateTime.Now.Year - 1911).ToString();
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    TempData["SessionExipred"] = "true";
                    return RedirectToAction("Index", "Login", null);
                }
                queryCrit.INSTNO = Session["INSTNO"].ToString();
                listData = (List<UnitAToBSum>)dbaHRAlloc.getDataList(queryCrit);
                model.SupportUnits = listData.OrderBy(p => p.TrSeialNo).ToPagedList(page, defaultPageSize);
                List<CodeBase> codeBaseData = new List<CodeBase>();
                codeBaseData = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                //TempData["UnitAToBSumList"] = listData;
                TempData["CodeBase"] = codeBaseData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(FormCollection data)
        {
            return RedirectToAction("Index", "SelfRate", null);
        }
        public ActionResult Edit(string year, string INSTNO, string TrSeialNo1)
        {
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    //Log.Error(ex + ex.StackTrace);
                    TempData["SessionExipred"] = "true";
                    //TempData["error"] = ex + ex.StackTrace;
                    //tran.Rollback();
                    return RedirectToAction("Index", "Login", null);
                }
                List<UnitAToBSum> listData = new List<UnitAToBSum>();
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.TrSeialNo = int.Parse(TrSeialNo1);
                MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                DataSet ds = mysqlDBA.getDataSet(string.Format("SELECT * FROM UnitAToBSum WHERE Year='{0}' AND INSTNO='{1}' AND TrSeialNo = '{2}'", queryCrit.Year, queryCrit.INSTNO, queryCrit.TrSeialNo));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    UnitAToBSum data = new UnitAToBSum();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.TrSeialNo = int.Parse(row["TrSeialNo"].ToString());
                    data.LCareType = row["LCareType"].ToString();
                    data.UnitBNo = row["UnitBNo"].ToString();
                    data.UnitBName = row["UnitBName"].ToString();
                    data.TrCaseNum = row["TrCaseNum"].ToString();
                    listData.Add(data);
                }
                TempData["UnitAToBSum"] = listData;
                List<CodeBase> codeBaseData = new List<CodeBase>();
                codeBaseData = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                TempData["CodeBase"] = codeBaseData;
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                //tran.Rollback();
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return RedirectToAction("Index", "SupportUnitAdd", null);
        }
        public ActionResult Delete(string year, string INSTNO, string TrSeialNo)
        {
            try
            {
                if (Session["INSTNO"] == null || string.IsNullOrEmpty(Session["INSTNO"].ToString()))
                {
                    //Log.Error(ex + ex.StackTrace);
                    TempData["SessionExipred"] = "true";
                    //TempData["error"] = ex + ex.StackTrace;
                    //tran.Rollback();
                    return RedirectToAction("Index", "Login", null);
                }
                UnitAToBSum queryCrit = new UnitAToBSum();
                queryCrit.Year = year;
                queryCrit.INSTNO = INSTNO;
                queryCrit.TrSeialNo = int.Parse(TrSeialNo);
                MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
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
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return RedirectToAction("Index", "SupportUnit", null);
        }
        [HttpPost]
        public ActionResult UploadServiceUnit(HttpPostedFileBase file_input)
        {
            try
            {
                if (file_input == null || file_input.ContentLength == 0)
                {
                    TempData["error"] = "請先上傳檔案!";
                    return RedirectToAction("Index", "SupportUnit", null);
                }
                DataSet result;
                DataRowCollection dataRow;
                DataColumnCollection dataColumn;
                int colIndex = 1;
                int rowIndex = 0;
                if (file_input.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file_input.FileName);
                    //檔案明加上時間戳記
                    fileName = fileName.Split('.')[0] + DateTime.Now.ToString("yyyyMMddHHmmss") + "." + fileName.Split('.')[1];
                    var path = Path.Combine(Server.MapPath("~/FileUploads"), fileName);
                    file_input.SaveAs(path);
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
                            MysqlDBA<UnitAToBSum> mysqlDBA = new MysqlDBA<UnitAToBSum>(FunctionController.CONNSTR);
                            UnitAToBSum alloc = new UnitAToBSum();
                            for (int i = 2; i < dataRow.Count; i++)
                            {
                                List<CodeBase> codeBaseList = Utility.Utility.getCodeBaseValueList("UnitAtoBSum", "LCareType", result.Tables[0].Rows[i][0].ToString());
                                if (codeBaseList.Count > 0)
                                {
                                    alloc.LCareType = codeBaseList[0].CodeValue; colIndex++;
                                }
                                else
                                {
                                    TempData["action"] = "Function";
                                    TempData["error"] = "機構名稱不可空白!";
                                    return RedirectToAction("Index", "SupportUnit", null);
                                }
                                if (string.IsNullOrEmpty(result.Tables[0].Rows[i][1].ToString()))
                                {
                                    TempData["action"] = "Function";
                                    TempData["error"] = "服務類別錯誤，無此服務類別：" + result.Tables[0].Rows[i][1].ToString();
                                    return RedirectToAction("Index", "SupportUnit", null);
                                }
                                try
                                {
                                    int.Parse(result.Tables[0].Rows[i][2].ToString());
                                    if (int.Parse(result.Tables[0].Rows[i][2].ToString()) < 0)
                                    {
                                        throw new Exception();   
                                    }
                                }
                                catch (Exception ex)
                                {
                                    TempData["action"] = "Function";
                                    TempData["error"] = "轉介個案數量錯誤或空白：\"" + result.Tables[0].Rows[i][0].ToString() + "\"不是一個正整數";
                                    return RedirectToAction("Index", "SupportUnit", null);
                                }
                            }
                            for (int i = 2; i < dataRow.Count; i++)
                            {
                                colIndex = 0;
                                alloc = new UnitAToBSum();
                                alloc.Year = (DateTime.Now.Year - 1911).ToString();
                                alloc.INSTNO = Session["INSTNO"].ToString();
                                alloc.TrSeialNo = Utility.Utility.getUnitAToBSumSerNo(mysqlDBA);
                                alloc.TrSeialNo++;
                                alloc.INSTNO = Session["INSTNO"].ToString();
                                List<CodeBase> codeBaseList = Utility.Utility.getCodeBaseValueList("UnitAtoBSum", "LCareType", result.Tables[0].Rows[i][colIndex].ToString());
                                alloc.LCareType = codeBaseList[0].CodeValue; colIndex++;
                                alloc.UnitBNo = "";
                                alloc.UnitBName = result.Tables[0].Rows[i][colIndex].ToString(); colIndex++;
                                alloc.TrCaseNum = result.Tables[0].Rows[i][colIndex].ToString(); colIndex++;
                                //alloc.Modifydate = DateTime.Now.ToString("yyyy-MM-dd");
                                alloc.CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
                                mysqlDBA.InsertOrUpdate(alloc);
                            }
                            TempData["success"] = "OK";
                            TempData["parentreload"] = "OK";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex + ex.StackTrace);
                TempData["action"] = "Function";
                TempData["error"] = ex + ex.StackTrace;
                return RedirectToAction("Index", "SupportUnit", null);
            }
            return RedirectToAction("Index", "SupportUnit", null);
        }
        public ActionResult Next()
        {
            return RedirectToAction("Index", "SelfRate", null);
        }
    }
}