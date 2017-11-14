using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class datarport : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
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
                var getOrg = from o in db.organizations select new { o.orgid, o.org_name };
                dp_org.DataSource = getOrg;
                dp_org.DataTextField = "org_name";
                dp_org.DataValueField = "orgid";
                dp_org.DataBind();
            }
            else
            {
                Response.Redirect("viewprofile.aspx?error=403");
            }
           
            
        }

        protected void tx_userinfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("rports.aspx?rpt=user");
        }

        protected void part_btn_Click(object sender, EventArgs e)
        {

            Response.Redirect("rports.aspx?rpt=partidetail&gender=" + dp_gender.SelectedValue + "&start=" + part_start.Text + "&end=" + part_end.Text);
        }

        protected void org_btn_Click(object sender, EventArgs e)
        {

            Response.Redirect("rports.aspx?rpt=evnetdetail&org=" + dp_org.SelectedValue + "&start=" + org_start.Text + "&end=" + org_end.Text);
        }

       

    }
}