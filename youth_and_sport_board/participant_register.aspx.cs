using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class participant_register : System.Web.UI.Page
    {
        bool access=false;
        protected void Page_Load(object sender, EventArgs e)
        {
              for (int i = 0; i < viewprofile.accessname.Count; i++)
			{
                if (viewprofile.accessname[i] == "Insert Data")
                {
                    access = true;
                }
			}
              if (access == true)
              {

                  if (!Page.IsPostBack)
                  {
                      var getpart = from part in db.participants
                                    select new
                                    {
                                        name = part.p_first_name + " " + part.p_middle_name + " " + part.p_last_name + " (" + part.p_email + ")",
                                        part.partid
                                    };
                      dp_part.DataSource = getpart;
                      dp_part.DataTextField = "name";
                      dp_part.DataValueField = "partid";
                      dp_part.DataBind();
                      var getevent = from all_event in db.event_registers
                                     where all_event.e_eventdate >= DateTime.Now && all_event.e_eventdate > DateTime.Now
                                     select new
                                     {
                                         name = all_event.e_name + " (" + all_event.e_location + ")",
                                         //pageName = (db.organizations.Where(i => i.orgid == all_event.e_orgid)
                                         //                    .Select(i => new { i.org_name })
                                         //                   .ToList()),
                                         all_event.eventid

                                     };

                      dp_event.DataSource = getevent;
                      dp_event.DataTextField = "name";
                      dp_event.DataValueField = "eventid";
                      dp_event.DataBind();

                      if (Request.QueryString["action"] == "update")
                      {
                          int _id = Convert.ToInt32(Request.QueryString["EID"]);
                          if (_id != 0)
                          {
                              // spGetEventRegisterFromIDsResult _eventregister = db.spGetEventRegisterFromIDs(_id).ToList()[0];
                              part_event_register upevent_part = (from ct in db.part_event_registers where ct.prid.Equals(_id) select ct).Single();

                              tx_fee_amount.Text = (upevent_part.fee).ToString();
                              tx_part_decs.Text = upevent_part.description;

                              dp_event.SelectedValue = upevent_part.eventid.ToString();
                              dp_part.SelectedValue = upevent_part.partid.ToString();

                              add_reg.Text = "Update";
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
        DataClassesDataContext db = new DataClassesDataContext();

        private void RefreshControls()
        {
            tx_part_decs.Text = string.Empty;
            tx_fee_amount.Text = string.Empty;
        }
        
        protected void add_reg_Click(object sender, EventArgs e)
        {
            if (add_reg.Text == "Add")
            {
                part_event_register event_part = new part_event_register();
                event_part.currentdate = DateTime.Now;
                event_part.description = tx_part_decs.Text;
                event_part.fee = Convert.ToInt32(tx_fee_amount.Text);
                event_part.eventid = int.Parse(dp_event.SelectedValue);
                event_part.partid = int.Parse(dp_part.SelectedValue);
                
                db.part_event_registers.InsertOnSubmit(event_part);
                db.SubmitChanges();
                lbl_error.Text = "Successfully add";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
            }
            else if (add_reg.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);

                
                //var upevent_part = from up in db.part_event_registers where up.prid == cdid select up;
                part_event_register upevent_part = (from ct in db.part_event_registers where ct.prid.Equals(cdid) select ct).Single();
                
                upevent_part.description = tx_part_decs.Text;
                upevent_part.fee = Convert.ToInt32(tx_fee_amount.Text);
                upevent_part.eventid = int.Parse(dp_event.SelectedValue);
                upevent_part.partid = int.Parse(dp_part.SelectedValue);
                db.SubmitChanges();
                RefreshControls();
                Response.Redirect("event_register_eud.aspx");
            }
        }
    }
}