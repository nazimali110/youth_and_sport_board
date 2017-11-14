using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace youth_and_sport_board
{
    public partial class meetingschedule : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        bool access =false;
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
                            //var getOrg = from o in db.organizations select new { o.orgid, o.org_name };
                            //ev_org.DataSource = getOrg;
                            //ev_org.DataTextField = "org_name";
                            //ev_org.DataValueField = "orgid";
                            //ev_org.DataBind();

                            //var getev_cat = from ev in db.e_catagories select new { ev.e_cataid, ev.e_cat_name };
                            //ev_cate.DataSource = getev_cat;
                            //ev_cate.DataTextField = "e_cat_name";
                            //ev_cate.DataValueField = "e_cataid";
                            //ev_cate.DataBind();

                            if (Request.QueryString["action"] == "update")
                            {
                                int _id = Convert.ToInt32(Request.QueryString["EID"]);
                                if (_id != 0)
                                {
                                    //    spGetEventRegisterFromIDsResult _eventregister = db.spGetEventRegisterFromIDs(_id).ToList()[0];


                                    //     AccountType _atype = (from uaty in db.AccountTypes where uaty.AccountTypeID == _id select uaty).Single();
                                    meeting_schedule up_meetting = (from up in db.meeting_schedules where up.Meetingid == _id select up).Single();
                                    ev_date.Text = up_meetting.m_datetime.ToString();
                                    ev_descrip.Text = up_meetting.description;
                                    ev_location.Text = up_meetting.location;
                                    ev_subj.Text = up_meetting.m_subject;


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
            ev_descrip.Text = string.Empty;
            ev_location.Text = string.Empty;
            ev_subj.Text = string.Empty;

        }
        notification notify = new notification();
        protected void ev_add_Click(object sender, EventArgs e)
        {



            if (ev_add.Text == "Add")
            {
                meeting_schedule ms = new meeting_schedule();
                ms.m_subject = ev_subj.Text;

               ms.m_datetime = Convert.ToDateTime(ev_date.Text);
                ms.description = ev_descrip.Text;
                ms.location = ev_location.Text;
             

                db.meeting_schedules.InsertOnSubmit(ms);
                db.SubmitChanges();
                lbl_error.Text = "Successfully add ";
                lbl_error.Text += notify.emailnotfi("Subject of Meeting: " + ev_subj.Text + "<br/>Meeting Time: " + ev_date.Text + "<br/>Location: " + ev_location.Text + "<br/>Description: " + ev_descrip.Text
                              , "Akysb: Upcoming Meeting");
                lbl_error.Text += notify.sendingsms("Next meeting for Akysb check email");
                RefreshControls();
                
                lbl_error.ForeColor = System.Drawing.Color.Green;
            }
            else if (ev_add.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                meeting_schedule upms = (from ct in db.meeting_schedules where ct.Meetingid.Equals(cdid) select ct).Single();
                upms.m_subject = ev_subj.Text;

                upms.m_datetime = Convert.ToDateTime(ev_date.Text);
                upms.description = ev_descrip.Text;
                upms.location = ev_location.Text;
             
                db.SubmitChanges();
                RefreshControls();
                lbl_error.Text += notify.emailnotfi("Subject of Meeting: " + ev_subj.Text + "<br/>Meeting Time: " + ev_date.Text + "<br/>Location: " + ev_location.Text + "<br/>Description: " + ev_descrip.Text
                            , "Akysb: Upcoming Meeting");
                lbl_error.Text += notify.sendingsms("Next meeting for Akysb check email");
                Response.Redirect("meetingschedule_eud.aspx");
            }

        }

    }
}