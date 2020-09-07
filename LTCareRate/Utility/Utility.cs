using LongtermCare.DataModel.LongtermCare.DataModel;
using LTCareRate.Controllers;
using LTCareRate.Models.DataModel;
using LTCareRate.Models.LTCareRate.DB;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LTCareRate.Utility
{
    public class Utility
    {
        public static string getBaseAttr(string attrMed)
        {
            string strRet = string.Empty;
            try
            {
                MysqlDBA<AttrBase> mysqlDBA_AttrBase = new MysqlDBA<AttrBase>(FunctionController.CONNSTR);
                AttrBase baseattr = new AttrBase();
                baseattr.AttrCode = attrMed;
                List<AttrBase> objLst = (List<AttrBase>)mysqlDBA_AttrBase.getDataList(baseattr);
                if (objLst.Count > 0)
                {
                    strRet = objLst[0].AttrName;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }
        public static string convertUDT2ROCDateFormat(string dateIn)
        {
            if (string.IsNullOrEmpty(dateIn))
                return "";
            if (dateIn.IndexOf("/") != -1)
            {
                string[] datearr = getMysqlDate(dateIn).Split('/');
                string year = datearr[2];
                int rocyear = int.Parse(year) - 1911;
                if (rocyear < 0)
                    rocyear = 1;
                return rocyear.ToString("000") + "/" + datearr[0] + "/" + datearr[1];
            }
            if (dateIn.IndexOf("-") != -1)
            {
                string[] datearr = getMysqlDate(dateIn).Split('-');
                string year = datearr[2];
                int rocyear = int.Parse(year) - 1911;
                if (rocyear < 0)
                    rocyear = 1;
                return rocyear.ToString("000") + "-" + datearr[0] + "-" + datearr[1];
            }
            return dateIn;
        }

        public static string getScoreTitle(string itemNo)
        {
            string strRet = string.Empty;
            try
            {
                MysqlDBA<ScoreItem> mysqlDBA_AttrBase = new MysqlDBA<ScoreItem>(FunctionController.CONNSTR);
                ScoreItem baseattr = new ScoreItem();
                baseattr.ItemNo = itemNo;
                List<ScoreItem> objLst = (List<ScoreItem>)mysqlDBA_AttrBase.getDataList(baseattr);
                if (objLst.Count > 0)
                {
                    strRet = objLst[0].ItemDesc;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }

        public static string convertROC2UDTDateFormat(string dateIn)
        {
            if (string.IsNullOrEmpty(dateIn))
                return "";
            if (dateIn.IndexOf("/") != -1)
            {
                string[] datearr = dateIn.Split('/');
                string year = datearr[0];
                int udtyear = int.Parse(year) + 1911;
                return udtyear + "/" + datearr[1] + "/" + datearr[2];
            }
            if (dateIn.IndexOf("-") != -1)
            {
                string[] datearr = dateIn.Split('-');
                string year = datearr[0];
                int udtyear = int.Parse(year) + 1911;
                return udtyear + "-" + datearr[1] + "-" + datearr[2];
            }
            return dateIn;
        }

        internal static MessageRec getUniqueMessageRec(DataSet dataSet)
        {
            MessageRec ret = new MessageRec();
            try
            {
                foreach (DataRow row in dataSet.Tables[0].Rows)
                {
                    ret.MsgSerialNo = int.Parse(row["MsgSerialNo"].ToString());
                    ret.MsgData = row["MsgData"].ToString();
                    ret.MsgSub = row["MsgSub"].ToString();
                    ret.MsgPushDate = row["MsgPushDate"].ToString();
                    ret.CreateDate = row["CreateDate"].ToString();
                    ret.CreateUser = row["CreateUser"].ToString();
                    ret.Modifydate = row["Modifydate"].ToString();
                    ret.ModifyUser = row["ModifyUser"].ToString();
                    ret.CloseDate = row["CloseDate"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ret;
        }

        internal static List<AttrBase> getAttrList(AttrBase.TypeList type)
        {
            List<AttrBase> retObj = new List<AttrBase>();
            try
            {
                MysqlDBA<AttrBase> mysqlDBA = new MysqlDBA<AttrBase>(FunctionController.CONNSTR);
                AttrBase attrBase = new AttrBase();

                switch (type)
                {
                    case AttrBase.TypeList.Medical:
                        attrBase.AttrType = "1";
                        break;
                    case AttrBase.TypeList.Longterm:
                        attrBase.AttrType = "2";
                        break;
                    case AttrBase.TypeList.Other:
                        attrBase.AttrType = "3";
                        break;
                }
                retObj = (List<AttrBase>)mysqlDBA.getDataListNoKey(attrBase);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retObj;
        }

        internal static DataSet getMessageDataSet(MysqlDBA<MessageRec> mysqlDBA, MessageRec messageRec)
        {
            DataSet dataSet = new DataSet();
            try
            {
                dataSet = mysqlDBA.getDataSet(string.Format("SELECT * FROM MessageRec WHERE MsgSerialNo={0}", messageRec.MsgSerialNo));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dataSet;
        }

        internal static int getMeetingSerNo(MysqlDBA<UnitAMeeting> mysqlDBA)
        {
            int retInt = 0;
            try
            {
                string strSQL = "select MAX(MSerialNo) MSerialNo from UnitAMeeting ";
                DataSet ds = mysqlDBA.getDataSet(strSQL);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (!string.IsNullOrEmpty(row["MSerialNo"].ToString()))
                    {
                        retInt = int.Parse(row["MSerialNo"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retInt;
        }

        internal static int getHRAllocSerNo(MysqlDBA<HRAlloc> mysqlDBA)
        {
            int retInt = 0;
            try
            {
                string strSQL = "select MAX(HRAllocSerNo) HRAllocSerNo from HRAlloc ";
                DataSet ds = mysqlDBA.getDataSet(strSQL);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (!string.IsNullOrEmpty(row["HRAllocSerNo"].ToString()))
                    {
                        retInt = int.Parse(row["HRAllocSerNo"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retInt;
        }

        internal static string getAreaBase(string area)
        {
            string areaName = string.Empty;
            try
            {
                MysqlDBA<AreaBase> mysqlDBA = new MysqlDBA<AreaBase>(FunctionController.CONNSTR);
                AreaBase queryCrit = new AreaBase();
                queryCrit.AreaCode = area;
                List<AreaBase> listr = (List<AreaBase>)mysqlDBA.getDataListNoKey(queryCrit);
                if (listr.Count > 0)
                {
                    areaName = listr[0].AreaName;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return areaName;
        }

        internal static string getAreaCode(string area)
        {
            string areaCode = string.Empty;
            try
            {
                MysqlDBA<AreaBase> mysqlDBA = new MysqlDBA<AreaBase>(FunctionController.CONNSTR);
                AreaBase queryCrit = new AreaBase();
                queryCrit.AreaName = area;
                List<AreaBase> listr = (List<AreaBase>)mysqlDBA.getDataListNoKey(queryCrit);
                if (listr.Count > 0)
                {
                    areaCode = listr[0].AreaCode;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return areaCode;
        }

        internal static string getAreaDDL(string city, string tagName, string selectedValue)
        {
            string ddl = string.Empty;
            try
            {
                Dictionary<string, string> optionData = new Dictionary<string, string>();
                MysqlDBA<AreaBase> mysqlDBA = new MysqlDBA<AreaBase>(FunctionController.CONNSTR);
                AreaBase area = new AreaBase();
                area.CityCode = city;
                List<AreaBase> areaBases = (List<AreaBase>)mysqlDBA.getDataListNoKey(area);
                if (areaBases.Count > 0)
                {
                    foreach (AreaBase areaBase in areaBases)
                    {
                        optionData.Add(areaBase.AreaCode, areaBase.AreaName);
                    }
                    ddl = DropDownListHelper.GetDropdownList(tagName, optionData, null, selectedValue, true, null);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ddl;
        }

        internal static string getCityBase(string city)
        {
            string cityName = string.Empty;
            try
            {
                MysqlDBA<CityBase> mysqlDBA = new MysqlDBA<CityBase>(FunctionController.CONNSTR);
                CityBase queryCrit = new CityBase();
                queryCrit.CityCode = city;
                List<CityBase> listr = (List<CityBase>)mysqlDBA.getDataListNoKey(queryCrit);
                if (listr.Count > 0)
                {
                    cityName = listr[0].CityName;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cityName;
        }

        internal static string getCityCode(string city)
        {
            string cityCode = string.Empty;
            try
            {
                MysqlDBA<CityBase> mysqlDBA = new MysqlDBA<CityBase>(FunctionController.CONNSTR);
                CityBase queryCrit = new CityBase();
                queryCrit.CityName = city;
                List<CityBase> listr = (List<CityBase>)mysqlDBA.getDataListNoKey(queryCrit);
                if (listr.Count > 0)
                {
                    cityCode = listr[0].CityCode;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return cityCode;
        }

        internal static List<InstScoreTable> getInstScore(string INSTNO, string itemNo, string evalYear)
        {
            List<InstScoreTable> listData = new List<InstScoreTable>();
            try
            {
                MysqlDBA<InstScoreTable> dbaHRAlloc = new MysqlDBA<InstScoreTable>(FunctionController.CONNSTR);
                DataSet ds = dbaHRAlloc.getDataSet(string.Format("SELECT * FROM InstScoreTable WHERE INSTNO='{0}' AND EvalYear='{1}' AND ItemNo='{2}'", INSTNO, evalYear, itemNo));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    InstScoreTable data = new InstScoreTable();
                    data.EvalYear = row["EvalYear"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.ItemNo = row["ItemNo"].ToString();
                    data.SelfScore = row["SelfScore"].ToString();
                    data.EvalScore = row["EvalScore"].ToString();
                    data.EvalDesc = row["EvalDesc"].ToString();
                    data.EvalDate = row["EvalDate"].ToString();
                    data.SelfDate = row["SelfDate"].ToString();
                    listData.Add(data);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return listData;
        }

        public static List<HRAlloc> getHRAlloc(HRAlloc hRAlloc)
        {
            List<HRAlloc> listData = new List<HRAlloc>();
            try
            {
                MysqlDBA<HRAlloc> dbaHRAlloc = new MysqlDBA<HRAlloc>(FunctionController.CONNSTR);
                DataSet ds = dbaHRAlloc.getDataSet(string.Format("SELECT * FROM HRAlloc WHERE Year='{0}' AND INSTNO='{1}'", hRAlloc.Year, hRAlloc.INSTNO));
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    HRAlloc data = new HRAlloc();
                    data.Year = row["Year"].ToString();
                    data.INSTNO = row["INSTNO"].ToString();
                    data.HRAllocSerNo = int.Parse(row["HRAllocSerNo"].ToString());
                    data.JobType = row["JobType"].ToString();
                    data.PROBG = row["PROBG"].ToString();
                    data.FullTimeNum = int.Parse(row["FullTimeNum"].ToString());
                    data.PartTimeNum = int.Parse(row["PartTimeNum"].ToString());
                    listData.Add(data);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return listData;
        }

        internal static int getCaseSrvRecSerNo(MysqlDBA<CaseSvrRec> mysqlDBA)
        {
            int retInt = 0;
            try
            {
                string strSQL = "select MAX(CaseSerNo) CaseSerNo from CaseSvrRec";
                DataSet ds = mysqlDBA.getDataSet(strSQL);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (!string.IsNullOrEmpty(row["CaseSerNo"].ToString()))
                    {
                        retInt = int.Parse(row["CaseSerNo"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retInt;
        }

        internal static int getUnitAToBSumSerNo(MysqlDBA<UnitAToBSum> mysqlDBA)
        {
            int retInt = 0;
            try
            {
                string strSQL = "select MAX(TrSeialNo) TrSeialNo from UnitAToBSum ";
                DataSet ds = mysqlDBA.getDataSet(strSQL);
                foreach (DataRow row in ds.Tables[0].Rows)
                {
                    if (!string.IsNullOrEmpty(row["TrSeialNo"].ToString()))
                    {
                        retInt = int.Parse(row["TrSeialNo"].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retInt;
        }

        public static string getMysqlDate(string dateIn)
        {
            return dateIn.Split(' ')[0];
        }

        public static string getCodeBaseText(List<CodeBase> codeBaseList, string CodeTable, string CodeField, string value)
        {
            string strRet = string.Empty;
            try
            {
                if (codeBaseList == null)
                {
                    codeBaseList = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getAllDataList(new CodeBase());
                }
                codeBaseList.ForEach(o => {
                    if (o.CodeTable == CodeTable &&
                        o.CodeField == CodeField &&
                        o.CodeValue == value)
                    {
                        strRet = o.CodeText;
                    }
                });
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }
        public static List<CodeBase> getCodeBaseTextList(string CodeTable, string CodeField, string value)
        {
            List<CodeBase> strRet = new List<CodeBase>();
            try
            {
                CodeBase queryCrit = new CodeBase();
                queryCrit.CodeTable = CodeTable;
                queryCrit.CodeField = CodeField;
                queryCrit.CodeValue = value;
                strRet = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getDataList(queryCrit);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }
        public static List<CodeBase> getCodeBaseValueList(string CodeTable, string CodeField, string text)
        {
            List<CodeBase> strRet = new List<CodeBase>();
            try
            {
                CodeBase queryCrit = new CodeBase();
                queryCrit.CodeTable = CodeTable;
                queryCrit.CodeField = CodeField;
                queryCrit.CodeText = text;
                strRet = (List<CodeBase>)new MysqlDBA<CodeBase>(FunctionController.CONNSTR).getDataList(queryCrit);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }

        public static List<CaseSvrEff> getCaseSvrEff(string year, string yearMonth, string INSTNO, string code)
        {
            List<CaseSvrEff> strRet = new List<CaseSvrEff>();
            try
            {
                MysqlDBA<CaseSvrEff> dba = new MysqlDBA<CaseSvrEff>(FunctionController.CONNSTR);
                CaseSvrEff queryCrit = new CaseSvrEff();
                queryCrit.Year = year;
                queryCrit.YM = yearMonth;
                queryCrit.INSTNO = INSTNO;
                queryCrit.SvrType = code;
                strRet = (List<CaseSvrEff>)dba.getDataList(queryCrit);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return strRet;
        }
    }
}