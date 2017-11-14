using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions;
using System.Configuration;

namespace youth_and_sport_board.reports
{
    public class accreport
    {
        ReportDocument doc;
        protected string sevrname = "NAZIM-PC";
        protected string dbname = "akysb_data_base";
        protected string dbid = "nazim";
        protected string dbpass = "78963214";
        

        public object accoutsreport(String fileName, String strProcedureName,string starttime,string endtime)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");
            cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = starttime;
            cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = endtime;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }
        public object genaralledger(String fileName, String strProcedureName, string starttime, string endtime,string accountid)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;

            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");
            cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = starttime;
            cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = endtime;
            cmd.Parameters.Add("@iAccountID", SqlDbType.VarChar).Value = accountid;

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }
        public object partireport(String fileName, String strProcedureName, string gander, string starttime, string endtime)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");
            cmd.Parameters.Add("@gender", SqlDbType.VarChar).Value = gander;
            cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = starttime;
            cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = endtime;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }

        public object eventregister(String fileName, String strProcedureName,string organization, string starttime, string endtime)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");
            cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = starttime;
            cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = endtime;
            cmd.Parameters.Add("@organiztion", SqlDbType.VarChar).Value = organization;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }

        public object general(String fileName, String strProcedureName)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");
            
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }

        public object userinfo(String fileName, String strProcedureName)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");

            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }

        public object partiregistration(String fileName, String strProcedureName, string t_eventid)
        {
            TableLogOnInfo crTableLogOnInfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            CrystalDecisions.CrystalReports.Engine.Database crDatabase;
            CrystalDecisions.CrystalReports.Engine.Tables crTables;
            doc = new ReportDocument();
            doc.Load(fileName);
            crConnectionInfo.ServerName = sevrname;
            crConnectionInfo.DatabaseName = dbname;
            crConnectionInfo.UserID = dbid;
            crConnectionInfo.Password = dbpass;
            crConnectionInfo.Type = ConnectionInfoType.SQL;
            crConnectionInfo.IntegratedSecurity = false;
            crDatabase = doc.Database;
            crTables = crDatabase.Tables;
            string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connStr);
            //   SqlCommand cmd = new SqlCommand("dbo." + strProcedureName , new object[] {"12-12-10","12-12-12"}, conn); 
            SqlCommand cmd = new SqlCommand("dbo." + strProcedureName, conn);

            //cmd.Parameters.Add("@startdate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-1-2011");
            //cmd.Parameters.Add("@enddate", SqlDbType.VarChar).Value = Convert.ToDateTime("1-12-2012");

            cmd.Parameters.Add("@eventid", SqlDbType.VarChar).Value = t_eventid;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();

            //DataSet ds = dba.ExecuteDataSet("gettrial", new object[] { startdate, enddate });
            //CrystalReport1 rpt_trail = new CrystalReport1();
            //ds.Tables[0].TableName = "gettrail";
            //rpt_trail.SetDataSource(ds);


            adpt.Fill(dataSet, "Customers");
            foreach (CrystalDecisions.CrystalReports.Engine.Table crTable in crTables)
            {
                crTableLogOnInfo = crTable.LogOnInfo;
                crTableLogOnInfo.ConnectionInfo = crConnectionInfo;
                crTable.ApplyLogOnInfo(crTableLogOnInfo);
            }
            doc.SetDataSource(dataSet.Tables[0]);
            return doc;
        }
      

   


    }
}