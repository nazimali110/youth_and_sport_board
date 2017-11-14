using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

namespace youth_and_sport_board
{
    public partial class viewprofile : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
     //   public static ArrayList arr = new ArrayList();

      public static  List<string>  accessname = new List<string>();
      public string profilename;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!login.islogin)
            {
                Response.Redirect("login.aspx");
            }
            var getAllStudentInfo = from s in db.organizations
                                    select new
                                    {
                                        id = s.orgid,
                                        oname = s.org_name,
                                        ocontact = (db.org_contacts.Where(i => i.orgid == s.orgid).Select(i => new { i.orgid, i.contectid, i.contactno }).ToList()),
                                        oaddress = (db.org_Addresses.Where(i => i.orgid == s.orgid).Select(i => new { i.orgid, i.ADDID, i.Address }).ToList())
                                    };
            //var getallname = (from s in db.e_logins
            //                  join r in db.pagesacesses on s.logintypeid equals r.logintypeid
            //                  join t in db.pages on r.pageid equals t.pageid
            //                  where s.loginid == Convert.ToInt32(Session["id"])
            //                  select new[]
            //                  {
            //                      t.pagename.ToString()
            //                  }).ToList();
           // int val =;
            var getallname = (from s in db.e_logins
                              join r in db.pagesacesses on s.logintypeid equals r.logintypeid
                              join t in db.pages on r.pageid equals t.pageid

                              where s.loginid == Convert.ToInt32(Session["id"])
                              select new[]
                              {
                                  t.pagename.ToString()
                              }).ToList();
       
             for (int i = 0; i < getallname.Count; i++)
             {
                 accessname.Add(getallname[i][0].ToString());
             }
          //   string ewwr = Convert.ToString(getallname);
        
            if (Request.QueryString["error"] == "403")
            {
                error_lbl.Text = "You have not a permision on that page";
                error_lbl.ForeColor = System.Drawing.Color.Red;
            }
          //  spGetlogincheckFromIDResult _login = db.spGetlogincheckFromID(tx_username.Text, tx_password.Text).ToList()[0];
            
            if (!Page.IsPostBack)
            {

               spGetloginFromIDResult _login = db.spGetloginFromID(Convert.ToInt32(Session["id"])).ToList()[0];
               // spGetloginFromIDResult _login = db.spGetloginFromID(3).ToList()[0];
                //var _login = (from s in db.e_logins
                //              where s.loginid == Convert.ToInt32(Session["id"])
                //              select new { s.firstname, s.lastname, s.emailadd, s.contactno, s.l_address, s.username }).ToList()[0];


                tx_fname.Text = _login.firstname;
                tx_lname.Text = _login.lastname;
                tx_email.Text = _login.emailadd;
                tx_contect.Text = Convert.ToString(_login.contactno);
                tx_address.Text = _login.l_address;
                tx_username.Text = _login.username;
                profilename = _login.firstname.ToUpper() + " " + _login.lastname.ToUpper();
            }

        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try
            {
                e_login updcat = (from ct in db.e_logins where ct.loginid.Equals(Convert.ToInt32(Session["id"])) select ct).Single();
                updcat.emailadd = tx_email.Text;
                updcat.l_address = tx_address.Text;
                updcat.contactno = tx_contect.Text;
                db.SubmitChanges();
                lbl_error.Text = "Successfully add";
                lbl_error.ForeColor = System.Drawing.Color.Green;
            }
            catch (SqlException ex)
            {
                if (ex.Number.ToString() == "547")
                {
                    lbl_error.Text = "This Data Cannot be Deleted. Because it is Involved in some Transaction";
                }
            }

            
        }
    }
}