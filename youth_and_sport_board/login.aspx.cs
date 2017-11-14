using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

namespace youth_and_sport_board
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["login"] == "false")
            {
                login.islogin = false;
            }
        }
        DataClassesDataContext db = new DataClassesDataContext();
      //  public static int userid;
        public static bool islogin = false;
        protected void login_open_Click(object sender, EventArgs e)
        {
            try
            {
              
              spGetlogincheckFromIDResult _login = db.spGetlogincheckFromID(tx_username.Text, tx_password.Text).ToList()[0];
              Session["id"] = _login.loginid;
              islogin = true;
              Response.Redirect("viewprofile.aspx", false);
              //bool ch_login = false;
              //  var alluser =(from s in db.e_logins select new [] { s.username.ToString(),s.password.ToString(),s.loginid.ToString()}).ToList();
              //  for (int i = 0; i < alluser.Count; i++)
              //  {
              //      if(alluser[i][0]==tx_username.Text && alluser[i][1]==tx_password.Text)
              //      {
              //          ch_login=true;
              //        //  int val = int.Parse(alluser[i][2]);
              //            Session["id"] = alluser[i][2];
              //            islogin = true;
                      
              //      }
              //  }
              //  if(ch_login==true)
              //  {
              //     //  Session["id"] = _login.loginid;
              //      Response.Redirect("viewprofile.aspx",false);
               
              //  }
              //  else
              //  {
              //       error.Text = "User Name and Password are worng";
              //  error.ForeColor = System.Drawing.Color.Red;
              //  }

            }
            catch
            {
                error.Text = "User Name and Password are worng";
                error.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}