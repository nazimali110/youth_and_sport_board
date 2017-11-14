using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace youth_and_sport_board
{
    public partial class nofimember : System.Web.UI.Page
    {
        private void GetRepeatedFilled()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["akysb_data_baseConnectionString"].ConnectionString;
                SqlConnection mySQLconnection = new SqlConnection(connStr);
                SqlCommand mySqlSelect = new SqlCommand("select e.loginid,e.contactno,e.emailadd,e.firstname,e.lastname from e_login e except select e.loginid, e.contactno,e.emailadd,e.firstname,e.lastname from m_notification m inner join e_login e on m.loginid=e.loginid", mySQLconnection);
                mySqlSelect.CommandType = CommandType.Text;
                SqlDataAdapter mySqlAdapter = new SqlDataAdapter(mySqlSelect);
                DataSet myDataSet = new DataSet();
                mySqlAdapter.Fill(myDataSet);
                rptr_view.DataSource = myDataSet;
                rptr_view.DataBind();
            }
            catch
            {
            }
        }
        private void GetRepeatedcurrent()
        {
            var getAllcurrent = from l in db.m_notifications join s in db.e_logins on l.loginid equals s.loginid
                                    select new
                                    {
                                        id = l.notifiID,
                                        
                                        mname = s.firstname,
                                        mlast = s.lastname,
                                        mcontact = s.contactno,
                                        memail = s.emailadd


                                    };


            rpt_current.DataSource = getAllcurrent;
            rpt_current.DataBind();
        }
        bool access = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < viewprofile.accessname.Count; i++)
            {
                if (viewprofile.accessname[i] == "Notification")
                {
                    access = true;
                }
            }
            if (access == true)
            {


                GetRepeatedFilled();
                GetRepeatedcurrent();
            }
            else
            {
                Response.Redirect("viewprofile.aspx?error=403");
            }
        }
       
        DataClassesDataContext db = new DataClassesDataContext();

   


        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("add"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    m_notification noti = new m_notification();
                    noti.loginid = id;
                    
                    db.m_notifications.InsertOnSubmit(noti);
                    db.SubmitChanges();
                    GetRepeatedFilled();
                    lbl_error.Text = "Add Successfully. !";
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    GetRepeatedFilled();
                    GetRepeatedcurrent();
                }
                catch (SqlException ex)
                {
                    if (ex.Number.ToString() == "547")
                    {
                        lbl_error.Text = "This cannot be try later";
                    }
                }
            }
        }

        protected void rpt_current_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("remove"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                
                    var deletenotify = from cat in db.m_notifications where cat.notifiID == id select cat;
                    foreach (var cat in deletenotify)
                    {
                        db.m_notifications.DeleteOnSubmit(cat);
                    }
                    db.SubmitChanges();
                    GetRepeatedFilled();
                    lbl_error.Text = "Deleted Successfully. !";
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    GetRepeatedFilled();
                    GetRepeatedcurrent();
                }
                catch (SqlException ex)
                {
                    if (ex.Number.ToString() == "547")
                    {
                        lbl_error.Text = "This cannot be try later";
                    }
                }
            }
        }
        private void RefreshControls()
        {

            tx_org_name.Text = string.Empty;
           
        }

        protected void search_done_Click(object sender, EventArgs e)
        {
            var getAllStudentInfo = from l in db.e_logins where l.firstname==tx_org_name.Text
                                    select new
                                    {
                                        id = l.loginid,
                                        mname = l.firstname,
                                        mlast = l.lastname,
                                        mcontact = l.contactno,
                                        memail = l.emailadd


                                    };


            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }
    }
}