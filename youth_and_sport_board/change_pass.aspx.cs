using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class change_pass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DataClassesDataContext db = new DataClassesDataContext();
        protected void btn_change_Click(object sender, EventArgs e)
        {

            e_login _logindata = (from ct in db.e_logins where ct.loginid.Equals(Convert.ToInt32(Session["id"])) select ct).Single();
            if (tx_old.Text == _logindata.password)
            {
                if (tx_new.Text == tx_confrom.Text)
                {
                    _logindata.password = tx_new.Text;
                    db.SubmitChanges();
                    lb_error.Text = "Successfully Changed";
                    lb_error.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lb_error.Text = "Conform password mis-match";
                    lb_error.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lb_error.Text = "Old Password incorrect";
                lb_error.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}