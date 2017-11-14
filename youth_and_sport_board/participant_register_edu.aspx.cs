using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class participant_register_edu : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
          //  (db.organizations.Where(i => i.orgid == all_event.e_orgid)
                                 //                    .Select(i => new { i.org_name })
                                 //                   .ToList())
            var geteventparticipant = from ev in db.part_event_registers
                                      join parti in db.participants on ev.partid equals parti.partid
                                      join evendetl in db.event_registers on ev.eventid equals evendetl.eventid
                                      select new
                                      {
                                          ev.prid,
                                         curdate  =ev.currentdate.ToShortDateString(),
                                          ev.description,
                                          ev.fee,
                                          partiname = parti.p_first_name + " " + parti.p_middle_name + " " + parti.p_last_name + " (" + parti.p_email + ")",
                                          eventname= evendetl.e_name
                                          //partiname = (db.participants.Where(i => i.partid == ev.partid).Select(i => new
                                          //{
                                          //    partname = i.p_first_name + " " + i.p_middle_name + " " + i.p_last_name + " (" + i.p_email + ")"
                                          //}).ToList().Single()),
                                          //eventname= (db.event_registers.Where(i =>i.eventid == ev.eventid).Select(i=> new {i.e_name}).ToList().Single().ToString())
                                          
                                      };

            rptr_view.DataSource = geteventparticipant;
                
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
                    //if (Request.QueryString["action"] == "delete")
                    //{
                    //    try
                    //    {
                    //        int id = Convert.ToInt32(Request.QueryString["loginid"]);
                    //        var deleteCategory = from c in db.event_registers where c.eventid.Equals(id) select c;
                    //        foreach (var category in deleteCategory)
                    //        {
                    //            db.event_registers.DeleteOnSubmit(category);
                    //        }
                    //        db.SubmitChanges();
                    //        GetRepeatedFilled();
                    //        lbl_error.Text = "Category Deleted Successfully. !";
                    //        lbl_error.ForeColor = System.Drawing.Color.Green;
                    //    }
                    //    catch (SqlException ex)
                    //    {
                    //        if (ex.Number.ToString() == "547")
                    //        {
                    //            lbl_error.Text = "This Category Cannot be Deleted. Because it is Involved in some Transaction";
                    //        }
                    //    }
                    //}


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
                    var deleteCategory = from cat in db.part_event_registers where cat.prid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.part_event_registers.DeleteOnSubmit(cat);
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