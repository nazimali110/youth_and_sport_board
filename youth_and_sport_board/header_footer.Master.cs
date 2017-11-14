using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class header_footer : System.Web.UI.MasterPage
    {
        protected string log_username;
        DataClassesDataContext db = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!login.islogin)
            {
                Response.Redirect("login.aspx");
            }
            var getname = (from c in db.e_logins where c.loginid.Equals(Convert.ToInt32(Session["id"])) select c).Single();
            log_username = getname.firstname;
        }
    }
}