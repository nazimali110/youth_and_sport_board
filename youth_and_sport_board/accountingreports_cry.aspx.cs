using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using youth_and_sport_board.reports;

namespace youth_and_sport_board
{
    public partial class accountingreports_cry : System.Web.UI.Page
    {
        accreport acc = new accreport();
        bool access = false;
        protected void Page_Load(object sender, EventArgs e)
        {

            for (int i = 0; i < viewprofile.accessname.Count; i++)
            {
                if (viewprofile.accessname[i] == "Accounting Reports")
                {
                    access = true;
                }
            }
            if (access == true)
            {
                //page has access

                if (Request.QueryString["rpt"] == "trial")
                {
                    CrystalReportViewer1.ReportSource = acc.accoutsreport(Server.MapPath("reports\\trialblnce.rpt"), "gettrial", Request.QueryString["start"], Request.QueryString["end"]);
                    
                }
                else if (Request.QueryString["rpt"] == "gledger")
                {
                    CrystalReportViewer1.ReportSource = acc.genaralledger(Server.MapPath("reports\\ledger.rpt"), "getledger", Request.QueryString["start"], Request.QueryString["end"],Request.QueryString["id"]);
                }
                else if (Request.QueryString["rpt"] == "incomestate")
                {
                    CrystalReportViewer1.ReportSource = acc.accoutsreport(Server.MapPath("reports\\incomesheet.rpt"), "getincomestatement", Request.QueryString["start"], Request.QueryString["end"]);
                }
                else if (Request.QueryString["rpt"] == "balsheet")
                {
                    CrystalReportViewer1.ReportSource = acc.accoutsreport(Server.MapPath("reports\\balancesheet.rpt"), "GetBalanceSheet", Request.QueryString["start"], Request.QueryString["end"]);
                }
                else if (Request.QueryString["rpt"] == "general")
                {
                    CrystalReportViewer1.ReportSource = acc.general(Server.MapPath("reports\\journalgeneral.rpt"), "spGetJournalEntryDetail");
                }
            }
            else
            {
                Response.Redirect("viewprofile.aspx?error=403");
            }
        }

      
    }
}