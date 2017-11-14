using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using youth_and_sport_board.reports;

namespace youth_and_sport_board
{
    public partial class rports : System.Web.UI.Page
    {
        accreport acc = new accreport();
        bool access = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < viewprofile.accessname.Count; i++)
            {
                if (viewprofile.accessname[i] == "Events and other reports")
                {
                    access = true;
                }
            }
            if (access == true)
            {

                if (Request.QueryString["rpt"] == "user")
                {
                    CrystalReportViewer1.ReportSource = acc.userinfo(Server.MapPath("reports\\userinfo.rpt"), "spGetrpuserinfo");

                }
                else if (Request.QueryString["rpt"] == "partidetail")
                {
                    CrystalReportViewer1.ReportSource = acc.partireport(Server.MapPath("reports\\participant.rpt"), "spGetrpparticipant", Request.QueryString["gender"], Request.QueryString["start"], Request.QueryString["end"]);
                }
                else if (Request.QueryString["rpt"] == "evnetdetail")
                {
                    CrystalReportViewer1.ReportSource = acc.eventregister(Server.MapPath("reports\\eventregister.rpt"), "spgetrpeventregister", Request.QueryString["org"], Request.QueryString["start"], Request.QueryString["end"]);
                }
                else if (Request.QueryString["rpt"] == "partregister")
                {
                    CrystalReportViewer1.ReportSource = acc.partiregistration(Server.MapPath("reports\\partiregister.rpt"), "spGetrppartievntregister", Request.QueryString["EID"]);
                }
            }
            else
            {
                Response.Redirect("viewprofile.aspx?error=403");
            }
           
        }
    }
}