using LTCareRate.Controllers;
using LTCareRate.Models.LTCareRate.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace LTCareRate.Models.DataModel
{
    public class ScoreItem
    {
        [Key]
        public string EvalYear { get; set; }
        [Key]
        public string EvalType { get; set; }
        [Key]
        public string ItemNo { get; set; }
        public string ItemParentNo { get; set; }
        public string ItemScore { get; set; }
        public string ItemDesc { get; set; }
        public string ItemGrade { get; set; }
        public string CreateDate { get; set; }
        public string IsFocus { get; set; }
        public List<ScoreItem> ChildItems { get; set; } = new List<ScoreItem>();

        public void getChildItem(MysqlDBA<ScoreItem> mysqlDBA, List<InstScoreTable> instScoreTables, string INSTNO)
        {
            try
            {
                //MysqlDBA<ScoreItem> mysqlDBA = new MysqlDBA<ScoreItem>(FunctionController.CONNSTR);
                DataSet ds = mysqlDBA.getDataSet(string.Format("SELECT * FROM ScoreItem WHERE ItemParentNo='{0}'", ItemNo));
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ChildItems = new List<ScoreItem>();
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        ScoreItem item = new ScoreItem();
                        item.EvalYear = row["EvalYear"].ToString();
                        item.EvalType = row["EvalType"].ToString();
                        item.ItemNo = row["ItemNo"].ToString();
                        item.ItemParentNo = row["ItemParentNo"].ToString();
                        item.ItemScore = row["ItemScore"].ToString();
                        item.ItemDesc = row["ItemDesc"].ToString();
                        item.ItemGrade = row["ItemGrade"].ToString();
                        item.CreateDate = row["CreateDate"].ToString();
                        item.IsFocus = row["IsFocus"].ToString();
                        List<InstScoreTable> instScoreList = Utility.Utility.getInstScore(INSTNO, item.ItemNo, item.EvalYear);
                        if (instScoreList.Count > 0)
                        {
                            instScoreTables.Add(instScoreList[0]);
                        }
                        item.getChildItem(mysqlDBA, instScoreTables, INSTNO);
                        ChildItems.Add(item);
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}