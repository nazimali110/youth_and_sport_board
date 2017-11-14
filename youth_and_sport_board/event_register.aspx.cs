using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace youth_and_sport_board
{
    public partial class event_register1 : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        bool access = false;
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
                //page has access

                if (!Page.IsPostBack)
                {
                    var getOrg = from o in db.organizations select new { o.orgid, o.org_name };
                    ev_org.DataSource = getOrg;
                    ev_org.DataTextField = "org_name";
                    ev_org.DataValueField = "orgid";
                    ev_org.DataBind();

                    var getev_cat = from ev in db.e_catagories select new { ev.e_cataid, ev.e_cat_name };
                    ev_cate.DataSource = getev_cat;
                    ev_cate.DataTextField = "e_cat_name";
                    ev_cate.DataValueField = "e_cataid";
                    ev_cate.DataBind();

                    if (Request.QueryString["action"] == "update")
                    {
                        int _id = Convert.ToInt32(Request.QueryString["EID"]);
                        if (_id != 0)
                        {
                            spGetEventRegisterFromIDsResult _eventregister = db.spGetEventRegisterFromIDs(_id).ToList()[0];
                            ev_name.Text = _eventregister.e_name;
                            ev_date.Text = _eventregister.e_eventdate.ToString();

                            ev_amonut.Text = _eventregister.e_amount.ToString();
                            ev_location.Text = _eventregister.e_location;
                            ev_per_name.Text = _eventregister.e_orgpersonname;
                            ev_descrip.Text = _eventregister.e_description;
                            ev_org.SelectedValue = _eventregister.e_orgid.ToString();
                            ev_cate.SelectedValue = _eventregister.e_cataid.ToString();
                            ev_part_free.Text = Convert.ToString(_eventregister.EventParticipationFee);



                            //  up_add.Text=_logindata.
                            //  up_accounttype.DataTextField = (_logindata.logintypeid).ToString ;
                            //up_accounttype. = (_logindata.logintypeid).ToString;

                            ev_add.Text = "Update";
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
            ev_date.Text = string.Empty;
            ev_name.Text = string.Empty;
            ev_per_name.Text = string.Empty;
            ev_amonut.Text = string.Empty;
            ev_location.Text = string.Empty;
            ev_descrip.Text = string.Empty;
            ev_part_free.Text = string.Empty;
        }
        notification notify = new notification();
        protected void ev_add_Click(object sender, EventArgs e)
        {
            if (ev_add.Text == "Add")
            {
                event_register even = new event_register();
                even.e_currentdate = DateTime.Now;
                even.e_eventdate = Convert.ToDateTime(ev_date.Text);
                even.e_name = ev_name.Text;
                even.e_orgpersonname = ev_per_name.Text;
                even.e_amount = Convert.ToDecimal(ev_amonut.Text);
                even.e_location = ev_location.Text;
                even.e_description = ev_descrip.Text;
                even.e_orgid = int.Parse(ev_org.SelectedValue);
                even.e_cataid = int.Parse(ev_cate.SelectedValue);
                even.e_isaprove = false;
                even.EventParticipationFee = Convert.ToDecimal(ev_part_free.Text);
                even.e_loginid = Convert.ToInt32(Session["id"]);
              //  even.e_loginid = 3;



                db.event_registers.InsertOnSubmit(even);
                db.SubmitChanges();
              
                lbl_error.Text = "Successfully add ";
                    lbl_error.ForeColor=System.Drawing.Color.Green;
                    lbl_error.Text += notify.emailnotfi("Event Name: " + ev_name.Text + "<br/>Event Date: " + ev_date.Text + "<br/>Person Name: " + ev_per_name.Text + "<br/>Extimated Amount: " + ev_location.Text
                                + "<br/>Organization: " + ev_org.SelectedItem.Text + " <br/> Participant Fee: " + ev_part_free.Text + "<br/>Description: " + ev_descrip.Text, "Event Register")+" ";
                    //.............................................. Send SMS ....................................................
                    //lbl_error.Text += notify.sendingsms("New event is add /n Event Name: " + ev_name.Text + "<br/>Event Date: " + ev_date.Text + "<br/>Person Name: " + ev_per_name.Text + "<br/>Extimated Amount: " + ev_location.Text
                    //                + "<br/>Organization: " + ev_org.SelectedItem.Text + " <br/> Participant Fee: " + ev_part_free.Text + "<br/>Description: " + ev_descrip.Text);

                  //  lbl_error.Text += notify.sendingsms("New event is add check your email");


                  
                
                
                RefreshControls();
            }
            else if (ev_add.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                event_register upeven = (from ct in db.event_registers where ct.eventid.Equals(cdid) select ct).Single();
                upeven.e_name = ev_name.Text;
                upeven.e_eventdate = Convert.ToDateTime(ev_date.Text);
                upeven.e_orgpersonname = ev_per_name.Text;
                upeven.e_amount = Convert.ToDecimal(ev_amonut.Text);
                upeven.e_location = ev_location.Text;
                upeven.e_description = ev_descrip.Text;
                upeven.e_orgid = int.Parse(ev_org.SelectedValue);
                upeven.e_cataid = int.Parse(ev_cate.SelectedValue);
                upeven.EventParticipationFee = Convert.ToDecimal(ev_part_free.Text);
                upeven.e_loginid = Convert.ToInt32(Session["id"]);
                //  updcat.logintypeid = Convert.ToInt16(up_accounttype.SelectedValue);
                db.SubmitChanges();
               
                lbl_error.Text = notify.emailnotfi("Event Name: " + ev_name.Text + "<br/>Event Date: " + ev_date.Text + "<br/>Person Name: " + ev_per_name.Text + "<br/>Extimated Amount: " + ev_location.Text
                                + "<br/>Organization: " + ev_org.SelectedItem.Text + " <br/> Participant Fee: " + ev_part_free.Text + "<br/>Description: " + ev_descrip.Text, "Upadate in Event");
              //  lbl_error.Text += notify.sendingsms("New event is add check your email");
                
                RefreshControls();
                Response.Redirect("event_register_eud.aspx");
            }
           
           

        }

    }
}