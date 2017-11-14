using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class event_register_eud : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
            var getAllStudentInfo = from s in db.event_registers
                                    join log in db.e_logins on s.e_loginid equals log.loginid
                                    join org in db.organizations on s.e_orgid equals org.orgid
                                    select new
                                    {
                                        s.eventid,

                                        cdate= s.e_currentdate.ToShortDateString(),
                                        edate= s.e_eventdate.ToShortDateString(),
                                        s.e_orgpersonname,
                                        s.e_amount,
                                        s.e_description,
                                        s.e_location,
                                        org.org_name,
                                        logname=log.firstname+" "+log.lastname


                                    };
            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }
        bool access = false;
        protected void Page_Load(object sender, EventArgs e)
        {
             for (int i = 0; i < viewprofile.accessname.Count; i++)
            {
                if (viewprofile.accessname[i] == "Update and Delete Data")
                {
                    access = true;
                }
            }
            if (access == true)
            {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["action"] == "delete")
                {
                    try
                    {
                        int id = Convert.ToInt32(Request.QueryString["loginid"]);
                        var deleteCategory = from c in db.event_registers where c.eventid.Equals(id) select c;
                        foreach (var category in deleteCategory)
                        {
                            db.event_registers.DeleteOnSubmit(category);
                        }
                        db.SubmitChanges();
                        GetRepeatedFilled();
                        lbl_error.Text = "Category Deleted Successfully. !";
                        lbl_error.ForeColor = System.Drawing.Color.Green;
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number.ToString() == "547")
                        {
                            lbl_error.Text = "This Category Cannot be Deleted. Because it is Involved in some Transaction";
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
                    var deleteCategory = from cat in db.event_registers where cat.eventid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.event_registers.DeleteOnSubmit(cat);
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
                        lbl_error.Text = "This Category Cannot be Deleted. Because it is Involved in some Transaction";
                    }
                }
            }
        }
    }
}