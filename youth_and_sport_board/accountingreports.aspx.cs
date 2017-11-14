using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace youth_and_sport_board
{
    public partial class accountingreports : System.Web.UI.Page
    {
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
            }
            else
            {
                Response.Redirect("viewprofile.aspx?error=403");
            }
           // CrystalReportViewer1.ReportSource = acc.trialbalance(Server.MapPath("reports\\trialblnce.rpt"), "gettrial", Convert.ToDateTime("1-1-2010"), Convert.ToDateTime("1-1-2014"));
        
        }
        
        protected void inst_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountingreports_cry.aspx?rpt=incomestate&start=" + inst_start.Text + "&end=" + inst_end.Text);
        }

        protected void tr_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountingreports_cry.aspx?rpt=trial&start="+tr_start.Text+"&end="+tr_end.Text);
         //   CrystalReportViewer1.ReportSource = acc.trialbalance(Server.MapPath("reports\\trialblnce.rpt"), "gettrial", Convert.ToDateTime("1-1-2010"), Convert.ToDateTime("1-1-2014"));
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountingreports_cry.aspx?rpt=balsheet&start=" + blnce_start.Text + "&end=" + blnce_end.Text);
        
        }

        protected void tx_general_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountingreports_cry.aspx?rpt=general");
            
        }

        protected void btn_gl_Click(object sender, EventArgs e)
        {
            Response.Redirect("accountingreports_cry.aspx?rpt=gledger&start=" + tx_gl_start.Text + "&end=" + tx_gl_end.Text+"&id="+tx_gl_accid.Text);
        }
    }
}