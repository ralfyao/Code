using Dapper;
using log4net.Config;
using LTCareRate.Controllers;
using MySqlConnector;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;

namespace LTCareRate.Models.LTCareRate.DB
{
    public class MysqlDBA<T>
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        string connString = string.Empty;
        private MySqlConnector.MySqlConnection sqlConnection = null;
        private MySqlTransaction transaction = null;
        public void setTransaction(MySqlTransaction tran)
        {
            transaction = tran;
        }
        public MysqlDBA(string connectionString = "")
        {
            if (connectionString == "")
                connectionString = FunctionController.CONNSTR;
            connString = connectionString;
            XmlConfigurator.Configure(new System.IO.FileInfo("./log4net.config"));
            int retCode = connect();
            if (retCode == 0)
            {
                throw new Exception("資料庫連線有問題，請洽系統管理者");
            }
        }
        /// <summary>
        /// Constructor
        /// </summary>
        public MysqlDBA()
        {
            XmlConfigurator.Configure(new System.IO.FileInfo("./log4net.config"));
        }
        public MySqlTransaction beginTransaction()
        {
            if (sqlConnection != null)
            {
                transaction = sqlConnection.BeginTransaction();
                return transaction;
            }
            throw new Exception("連接未開啟!");
        }
        public void rollbackTransaction()
        {
            if (transaction != null)
            {
                transaction.Rollback();
            }
        }
        public void commitTransaction()
        {
            if (transaction != null)
            {
                transaction.Commit();
            }
        }
        /// <summary>
        /// connects database
        /// </summary>
        /// <returns>return code</returns>
        public int connect()
        {
            int retCode = 1;
            try
            {
                if (sqlConnection == null)
                {
                    sqlConnection = new MySqlConnector.MySqlConnection(connString);
                    sqlConnection.Open();
                }
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                switch (ex.Number)
                {
                    case 0:
                        //Console.WriteLine("無法連線到資料庫.");
                        log.Error("無法連線到資料庫.");
                        retCode = 0;
                        break;
                    case 1045:
                        //Console.WriteLine("使用者帳號或密碼錯誤,請再試一次.");
                        log.Error("使用者帳號或密碼錯誤,請再試一次.");
                        retCode = 0;
                        break;
                }
                
            }
            catch (Exception ex)
            {
                retCode = 0;
                log.Error(ex+ex.StackTrace);
            }
            return retCode;
        }
        private IEnumerable<PropertyInfo> GetProperties => typeof(T).GetProperties();

        internal void close()
        {
            try
            {
                if (sqlConnection != null)
                    sqlConnection.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<T> getAllDataList(T t)
        {
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                log.Debug(strSQL);
                if (transaction == null)
                {
                    IEnumerable<T> ret = sqlConnection.Query<T>(strSQL);
                    sqlConnection.Close();
                    return ret;
                }
                else
                    return sqlConnection.Query<T>(strSQL, null, transaction);
                //return sqlConnection.Query<T>(strSQL);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Get data list that sql query according to object's member data
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public IEnumerable<T> getDataList(T t)
        {
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                var WhereQuery = new StringBuilder();
                string tmpStr = string.Empty;
                foreach (PropertyInfo property in GetProperties)
                {
                    var attribute = Attribute.GetCustomAttribute(property, typeof(KeyAttribute))
                        as KeyAttribute;

                    if (attribute != null) // This property has a KeyAttribute
                    {
                        tmpStr = property.GetValue(t) == null ? null : property.GetValue(t).ToString();
                        if (tmpStr != null)
                            WhereQuery.Append($" AND {property.Name}='{tmpStr.Replace(" ", "")}'");
                    }
                    else
                    {
                        if (property.GetValue(t) != null)
                        {
                        }
                    }
                }
                strSQL += WhereQuery.ToString();
                log.Debug(strSQL);
                if (transaction == null)
                {
                    IEnumerable<T> ret = sqlConnection.Query<T>(strSQL);
                    sqlConnection.Close();
                    return ret;
                }
                else
                {
                    return sqlConnection.Query<T>(strSQL, null, transaction);
                }
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }

        public DataSet getDataSet(T t)
        {
            DataSet ds = new DataSet();
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                var WhereQuery = new StringBuilder();
                string tmpStr = string.Empty;
                foreach (PropertyInfo property in GetProperties)
                {
                    var attribute = Attribute.GetCustomAttribute(property, typeof(KeyAttribute))
                        as KeyAttribute;

                    if (attribute != null) // This property has a KeyAttribute
                    {
                        tmpStr = property.GetValue(t) == null ? null : property.GetValue(t).ToString();
                        if (tmpStr != null)
                            WhereQuery.Append($" AND {property.Name}='{tmpStr.Replace(" ", "")}'");
                    }
                    else
                    {
                        if (property.GetValue(t) != null)
                        {
                        }
                    }
                }
                strSQL += WhereQuery.ToString();
                log.Debug(strSQL);
                ds = getDataSet(strSQL);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
            return ds;
        }

        public void ExecuteProcedure(string strSQL, Dictionary<string, string> strs)
        {
            try
            {
                MySqlCommand cmd = new MySqlCommand(strSQL, new MySqlConnection(FunctionController.CONNSTR));
                cmd.CommandType = CommandType.StoredProcedure;
                int i = 0;
                foreach(string param in strs.Keys)
                {
                    cmd.Parameters.Add(new MySqlParameter(param, strs[param]));
                    i++;
                }
                cmd.Connection.Open();
                cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }

        public DataSet getTotalData(T t)
        {
            DataSet ds = new DataSet();
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                log.Debug(strSQL);
                ds = getDataSet(strSQL);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
            return ds;
        }

        public DataSet getAllDataSet(T t)
        {
            DataSet ds = new DataSet();
            try
            {
                ds = getDataSet(t);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
            return ds;
        }

        public DataSet getDataSet(string strSQL, MySqlTransaction tran = null)
        {
            DataSet ds = new DataSet();
            try
            {
                log.Debug(strSQL);
                MySqlCommand cmd = new MySqlCommand(strSQL);
                if (sqlConnection == null)
                {
                    connect();
                }
                cmd.Connection = sqlConnection;
                if (tran != null)
                {
                    cmd.Transaction = tran;
                }
                MySqlDataAdapter mySqlDataAdapter = new MySqlDataAdapter(cmd);
                mySqlDataAdapter.Fill(ds);
                sqlConnection.Close();
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
            return ds;
        }

        /// <summary>
        /// Get data list that sql query include "{string}%"
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public IEnumerable<T> getDataLikeStartsWith(T t)
        {
            //IEnumerable<T> t1 = null;
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                var WhereQuery = new StringBuilder();
                string tmpStr = string.Empty;
                foreach (PropertyInfo property in GetProperties)
                {
                    var attribute = Attribute.GetCustomAttribute(property, typeof(Attribute))
                        as Attribute;
                    if (property.GetValue(t) != null)
                    {
                        tmpStr = property.GetValue(t) == null ? null : property.GetValue(t).ToString();
                        WhereQuery.Append($" AND {property.Name} LIKE '{tmpStr}%'");
                    }
                }
                strSQL += WhereQuery.ToString();
                log.Debug(strSQL);
                if (transaction == null)
                {
                    IEnumerable<T> retObj = sqlConnection.Query<T>(strSQL);
                    sqlConnection.Close();
                    return retObj;
                }
                else
                    return sqlConnection.Query<T>(strSQL, null, transaction);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Get data list that sql query include "LIKE"
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public IEnumerable<T> getDataLikeList(T t)
        {
            //IEnumerable<T> t1 = null;
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                var WhereQuery = new StringBuilder();
                string tmpStr = string.Empty;
                foreach (PropertyInfo property in GetProperties)
                {
                    var attribute = Attribute.GetCustomAttribute(property, typeof(Attribute))
                        as Attribute;

                    if (property.GetValue(t) != null)
                    {
                        tmpStr = property.GetValue(t) == null ? null : property.GetValue(t).ToString();
                        WhereQuery.Append($" AND {property.Name} LIKE '%{tmpStr}%'");
                    }
                }
                strSQL += WhereQuery.ToString();
                log.Debug(strSQL);
                if (transaction == null)
                {
                    IEnumerable<T> retObj = sqlConnection.Query<T>(strSQL);
                    sqlConnection.Close();
                    return retObj;
                }
                else
                    return sqlConnection.Query<T>(strSQL, null, transaction);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }

        public IEnumerable<T> getDataListNoKey(T t)
        {
            //IEnumerable<T> t1 = null;
            try
            {
                string strSQL = $"SELECT * FROM {t.GetType().Name} WHERE 1=1 ";
                var WhereQuery = new StringBuilder();
                string tmpStr = string.Empty;
                foreach (PropertyInfo property in GetProperties)
                {
                    var attribute = Attribute.GetCustomAttribute(property, typeof(Attribute))
                        as Attribute;

                    if (property.GetValue(t) != null)
                    {
                        tmpStr = property.GetValue(t) == null ? null : property.GetValue(t).ToString();
                        WhereQuery.Append($" AND {property.Name} = '{tmpStr}'");
                    }
                }
                strSQL += WhereQuery.ToString();
                log.Debug(strSQL);
                if (transaction == null)
                {
                    IEnumerable<T> ret = sqlConnection.Query<T>(strSQL);
                    sqlConnection.Close();
                    return ret;
                }
                else
                    return sqlConnection.Query<T>(strSQL, null, transaction);
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }

        /// <summary>
        /// If data exist, update it. If data not exist, insert it.
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public int InsertOrUpdate(T t)
        {
            int updateOrInsertCnt = 0;
            try
            {
                IEnumerable<T> obj = getDataList(t);
                string rootPathVal = string.Empty;
                int dataCnt = 0;
                foreach (T record in obj)
                {
                    dataCnt++;
                }
                if (dataCnt == 0)
                {
                    Insert(t);
                    //InsertMemory(t);
                }
                else
                {
                    Update(t);
                    //UpdateMemory(t);
                }
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
            return updateOrInsertCnt;
        }
        /// <summary>
        /// Dapper ORM Insert function
        /// </summary>
        /// <param name="t"></param>
        public void Insert(T t)
        {
            var insertQuery = GenerateInsertQuery(t).Replace("上午", "").Replace("下午", "");
            try
            {
                if (!string.IsNullOrEmpty(connString) && sqlConnection != null && sqlConnection.State == System.Data.ConnectionState.Open)
                {
                    log.Debug(insertQuery);
                    if (transaction == null)
                    {
                        sqlConnection.Execute(insertQuery, t);
                        sqlConnection.Close();
                    }
                    else
                    {
                        sqlConnection.Execute(insertQuery, t, transaction);
                    }
                }
                else
                {
                    sqlConnection = new MySqlConnector.MySqlConnection(connString);
                    sqlConnection.Open();
                    //cn.Open();
                    Insert(t);
                }
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Using Reflection To Get T all attributes
        /// </summary>
        /// <param name="listOfProperties"></param>
        /// <returns></returns>
        private static List<string> GenerateListOfProperties(IEnumerable<PropertyInfo> listOfProperties)
        {
            return (from prop in listOfProperties
                    let attributes = prop.GetCustomAttributes(typeof(DescriptionAttribute), false)
                    where attributes.Length <= 0 || (attributes[0] as DescriptionAttribute)?.Description != "ignore"
                    select prop.Name).ToList();
        }
        /// <summary>
        /// Internal Generate Update SQL
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        private string GenerateUpdateQuery(T t)
        {
            var WhereQuery = new StringBuilder($" where ");
            var updateQuery = new StringBuilder($"UPDATE {t.GetType().Name} SET ");
            string tmpStr = string.Empty;
            foreach (PropertyInfo property in GetProperties)
            {
                var attribute = Attribute.GetCustomAttribute(property, typeof(KeyAttribute))
                    as KeyAttribute;

                if (attribute != null) // This property has a KeyAttribute
                {
                    if (property.GetValue(t) != null)
                    {
                        tmpStr = property.GetValue(t).ToString();
                        WhereQuery.Append($"trim({property.Name})=trim('{tmpStr}') and ");
                    }
                }
                else
                {
                    if (property.GetValue(t) != null)
                    {
                        var attribute1 = Attribute.GetCustomAttribute(property, typeof(JsonIgnoreAttribute))
                            as JsonIgnoreAttribute;
                        if (attribute1 == null)
                        {
                            updateQuery.Append($"{property.Name}=trim('{property.GetValue(t).ToString()}'),");
                        }
                    }
                }
            }

            updateQuery.Remove(updateQuery.Length - 1, 1); //remove last comma
            WhereQuery.Remove(WhereQuery.Length - 4, 4); //remove last comma


            updateQuery.Append(WhereQuery.ToString());
            return updateQuery.ToString();
        }
        /// <summary>
        /// Internal Generate Insert SQL
        /// </summary>
        /// <param name="t">Object to insert</param>
        /// <returns></returns>
        private string GenerateInsertQuery(T t)
        {
            var insertQuery = new StringBuilder($"INSERT INTO {t.GetType().Name} ");

            insertQuery.Append("(");

            var properties = GenerateListOfProperties(GetProperties);
            properties.ForEach(prop => { insertQuery.Append($"{prop},"); });

            insertQuery
                .Remove(insertQuery.Length - 1, 1)
                .Append(") VALUES (");
            GetProperties.ToList().ForEach(prop =>
            {

                insertQuery.Append($"'{(prop.GetValue(t) != null ? prop.GetValue(t).ToString() : "")}',");
            });

            insertQuery
                .Remove(insertQuery.Length - 1, 1)
                .Append(")");

            return insertQuery.ToString();
        }
        public void Delete(T t)
        {
            var WhereQuery = new StringBuilder();
            string tmpStr = string.Empty;
            foreach (PropertyInfo property in GetProperties)
            {
                var attribute = Attribute.GetCustomAttribute(property, typeof(KeyAttribute))
                    as KeyAttribute;

                if (attribute != null) // This property has a KeyAttribute
                {
                    tmpStr = property.GetValue(t).ToString();
                    WhereQuery.Append($"{property.Name}='{tmpStr}' and ");
                }
            }
            WhereQuery.Remove(WhereQuery.Length - 4, 4);
            try
            {
                string strSQL = $"DELETE FROM {t.GetType().Name} WHERE 1=1 AND " + WhereQuery.ToString();
                log.Debug(strSQL);
                if (transaction == null)
                {
                    if (sqlConnection == null)
                    {
                        connect();
                    }
                    sqlConnection.Execute(strSQL, t);
                    sqlConnection.Close();
                }
                else
                {
                    sqlConnection.Execute(strSQL, t, transaction);
                }
                
            }
            catch (Exception ex)
            {
                log.Error(ex);
                throw ex;
            }
        }
        /// <summary>
        /// Dapper ORM Update function
        /// </summary>
        /// <param name="t"></param>
        public void Update(T t)
        {
            try
            {
                var updateQuery = GenerateUpdateQuery(t);
                if (!string.IsNullOrEmpty(connString) && sqlConnection != null && sqlConnection.State == System.Data.ConnectionState.Open)
                {
                    log.Debug(updateQuery);
                    if (transaction == null)
                    {
                        sqlConnection.Execute(updateQuery, t);
                        sqlConnection.Close();
                    }
                    else
                    {
                        sqlConnection.Execute(updateQuery, t, transaction);
                    }
                }
                else
                {
                    sqlConnection = new MySqlConnector.MySqlConnection(connString);
                    sqlConnection.Open();
                    //cn.Open();
                    Update(t);
                }
            }
            catch (Exception ex)
            {
                log.Error(ex);
                if (transaction != null)
                {
                    rollbackTransaction();
                }
                throw ex;
            }
        }
    }
}