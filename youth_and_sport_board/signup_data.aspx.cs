using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class signup_data : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
            var getAllStudentInfo = from s in db.e_logins select new { s.loginid, s.firstname, s.lastname,s.contactno,s.emailadd,s.gender,s.username };
            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }
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
                            if (Request.QueryString["action"] == "delete")
                            {
                                try
                                {
                                    int id = Convert.ToInt32(Request.QueryString["loginid"]);
                                    var deleteCategory = from c in db.e_logins where c.loginid.Equals(id) select c;
                                    foreach (var category in deleteCategory)
                                    {
                                        db.e_logins.DeleteOnSubmit(category);
                                    }
                                    db.SubmitChanges();
                                    GetRepeatedFilled();
                                    lbl_error.Text = "Deleted Successfully. !";
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
                        GetRepeatedFilled();
                    }
                    else
                    {
                        Response.Redirect("viewprofile.aspx?error=403");
                    }
        }
        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    var deleteCategory = from cat in db.e_logins where cat.loginid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.e_logins.DeleteOnSubmit(cat);
                    }
                    db.SubmitChanges();
                    GetRepeatedFilled();
                    lbl_error.Text = "Deleted Successfully. !";
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
}