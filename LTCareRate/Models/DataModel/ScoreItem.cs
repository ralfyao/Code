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
        public static List<ScoreItem> SCORE_ITEMS = getAllScoreItems();

        private static List<ScoreItem> getAllScoreItems()
        {
            if (SCORE_ITEMS != null)
            {
                return SCORE_ITEMS;
            }
            List<ScoreItem> retObj = new List<ScoreItem>();
            try
            {
                MysqlDBA<ScoreItem> dba = new MysqlDBA<ScoreItem>(FunctionController.CONNSTR);
                retObj = (List<ScoreItem>)dba.getAllDataList(new ScoreItem());
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return retObj;
        }

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

        public void getChildItem(string INSTNO, string itemNo)
        {
            try
            {
                //MysqlDBA<ScoreItem> mysqlDBA = new MysqlDBA<ScoreItem>(FunctionController.CONNSTR);
                var ds = from s in SCORE_ITEMS  //mysqlDBA.getDataSet(string.Format("SELECT * FROM ScoreItem WHERE ItemParentNo='{0}'", ItemNo));
                         where s.ItemParentNo == itemNo
                         select s;
                if (ds.Count() > 0)
                {
                    ChildItems = new List<ScoreItem>();
                    foreach (ScoreItem item in ds.ToList())
                    {
                        item.getChildItem(INSTNO, item.ItemNo);
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