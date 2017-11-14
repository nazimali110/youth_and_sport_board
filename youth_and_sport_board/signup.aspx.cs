using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class signup : System.Web.UI.Page
    {
         DataClassesDataContext db = new DataClassesDataContext();
         bool access = false;
         protected void Page_Load(object sender, EventArgs e)
         {
             
                    for (int i = 0; i < viewprofile.accessname.Count; i++)
			{
                if (viewprofile.accessname[i] == "Sign Up and user info")
                {
                    access = true;
                }
			}
                    if (access == true)
                    {
                        //page has access

                        if (!Page.IsPostBack)
                        {
                            var getOrg = from o in db.e_logintypes select new { o.logintypeid, o.typename };
                            up_accounttype.DataSource = getOrg;
                            up_accounttype.DataTextField = "typename";
                            up_accounttype.DataValueField = "logintypeid";
                            up_accounttype.DataBind();

                            if (Request.QueryString["action"] == "update")
                            {
                                int _id = Convert.ToInt32(Request.QueryString["EID"]);
                                if (_id != 0)
                                {
                                    spGetloginFromIDResult _logindata = db.spGetloginFromID(_id).ToList()[0];
                                    up_fname.Text = _logindata.firstname;
                                    up_lname.Text = _logindata.lastname;
                                    up_uname.Text = _logindata.username;
                                    RequiredFieldValidator3.Visible = false;
                                    // up_pass.Text = _logindata.password;
                                    //up_pass.TextMode = TextBoxMode.SingleLine;
                                    up_email.Text = _logindata.emailadd;
                                    up_dob.Text = (_logindata.l_dob).ToString();
                                    up_contect.Text = Convert.ToString(_logindata.contactno);
                                    up_gender.Text = _logindata.gender;
                                    //  up_pass.Text = _logindata.password;
                                    up_address.Text = _logindata.l_address;
                                    up_accounttype.SelectedValue = _logindata.logintypeid.ToString();
                                    //  up_add.Text=_logindata.
                                    //  up_accounttype.DataTextField = (_logindata.logintypeid).ToString ;
                                    //up_accounttype. = (_logindata.logintypeid).ToString;

                                    up_add.Text = "Update";
                                    //GetRepeatedFilled();
                                }

                            }
                        }
                    }
                    else
                    {
                        Response.Redirect("viewprofile.aspx?error=403");
                    }
         }

         private void RefreshControls()
         {
             up_fname.Text = string.Empty;
             up_lname.Text = string.Empty;
             up_uname.Text = string.Empty;
             up_pass.Text = string.Empty;
             up_email.Text = string.Empty;
             up_dob.Text = string.Empty;
             up_contect.Text = string.Empty;
             up_address.Text = string.Empty;
         }
         notification notify = new notification();
        protected void up_add_Click(object sender, EventArgs e)
        {
           
            if (up_add.Text == "Add")
            {
                bool checkuser = false;
                try
                {
                    e_login updcat = (from ct in db.e_logins where ct.username.Equals(up_uname.Text) select ct).Single();
                    checkuser = false;
                }
                catch
                {
                    checkuser = true;
                }
                if (checkuser==true)
                {
                    e_login m_login = new e_login();
                    m_login.firstname = up_fname.Text;
                    m_login.lastname = up_lname.Text;
                    m_login.username = up_uname.Text;
                    m_login.password = up_pass.Text;
                    m_login.emailadd = up_email.Text;
                    m_login.l_dob = Convert.ToDateTime(up_dob.Text);
                    m_login.contactno = up_contect.Text;
                    m_login.gender = up_gender.SelectedItem.Value;
                    m_login.l_address = up_address.Text;
                    m_login.Isactive = true;
                    m_login.logintypeid = int.Parse(up_accounttype.SelectedValue);
                    db.e_logins.InsertOnSubmit(m_login);

                    db.SubmitChanges();
                    lbl_error.Text = "Successfully add ";
                    lbl_error.Text += notify.emailnotfi("Name: " + up_fname.Text + " " + up_lname.Text + "<br/>Gender: " + up_gender.Text + "<br/>Email: " + up_email.Text + "<br/>Contact no: " + up_contect.Text
                                   , "New User Added");

                    RefreshControls();

                    lbl_error.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lbl_error.Text = "This User is already used";
                    lbl_error.ForeColor = System.Drawing.Color.Red;
                }
            }
            else if (up_add.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                e_login updcat = (from ct in db.e_logins where ct.loginid.Equals(cdid) select ct).Single();
              
                updcat.firstname = up_fname.Text;
                updcat.lastname = up_lname.Text;
                updcat.username = up_uname.Text;
                if (up_pass.Text == "")
                {
                }
                else
                {
                    updcat.password = up_pass.Text;
                }
                updcat.emailadd = up_email.Text;
                updcat.l_dob = Convert.ToDateTime(up_dob.Text);
                updcat.contactno = up_contect.Text;
                updcat.gender = up_gender.SelectedItem.Value;
                updcat.l_address = up_address.Text;
               
              //  updcat.logintypeid = Convert.ToInt16(up_accounttype.SelectedValue);
                db.SubmitChanges();
                RefreshControls();
                lbl_error.Text = notify.emailnotfi("Name: " + up_fname.Text + " " + up_lname.Text + "<br/>Gender: " + up_gender.Text + "<br/>Email: " + up_email.Text + "<br/>Contact no: " + up_contect.Text
                              , "New User Added");
                Response.Redirect("signup_data.aspx");
            }
           



        }
     


    }
}