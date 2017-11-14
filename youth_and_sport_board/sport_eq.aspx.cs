using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class sport_eq : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
            var getAllStudentInfo = from s in db.sport_equips select new { s.sporteqid, s.eq_name,s.t_quantity,s.a_quantity };
            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }
        private void GetRepeatedevent()
        {
            var getAlleventinfo = from s in db.e_sport_equips
                                  join sp in db.sport_equips on s.sporteqid equals sp.sporteqid
                                  join ev in db.event_registers on s.eventid equals ev.eventid
                                    select new
                                        {
                                            s.eventeqid,
                                            s.quantity,

                                            ev.e_name,
                                            edate = ev.e_eventdate.ToShortDateString(),
                                            sp.eq_name,
                                            s.sp_return

                                        };
            rpt_event.DataSource = getAlleventinfo;
            rpt_event.DataBind();
        }


        bool access=false;
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
                      var getevent = from all_event in db.event_registers
                                     where all_event.e_eventdate >= DateTime.Now && all_event.e_eventdate > DateTime.Now
                                     select new
                                     {
                                         name = all_event.e_name + " (" + all_event.e_location + ")",
                                         all_event.eventid

                                     };

                      dp_ev_name.DataSource = getevent;
                      dp_ev_name.DataTextField = "name";
                      dp_ev_name.DataValueField = "eventid";
                      dp_ev_name.DataBind();

                      var getsportname = from sp in db.sport_equips
                                         select new
                                         {
                                             sp.sporteqid,
                                             sp.eq_name
                                         };
                      dp_ev_spname.DataSource = getsportname;
                      dp_ev_spname.DataTextField = "eq_name";
                      dp_ev_spname.DataValueField = "sporteqid";
                      dp_ev_spname.DataBind();
                      //if (Request.QueryString["action"] == "delete")
                      //{
                      //    try
                      //    {
                      //        int id = Convert.ToInt32(Request.QueryString["sporteqid"]);
                      //        var deleteCategory = from c in db.sport_equips where c.sporteqid.Equals(id) select c;
                      //        foreach (var category in deleteCategory)
                      //        {
                      //            db.sport_equips.DeleteOnSubmit(category);
                      //        }
                      //        db.SubmitChanges();
                      //        GetRepeatedFilled();
                      //        lbl_error.Text = "Deleted Successfully. !";
                      //        lbl_error.ForeColor = System.Drawing.Color.Green;
                      //    }
                      //    catch (SqlException ex)
                      //    {
                      //        if (ex.Number.ToString() == "547")
                      //        {
                      //            lbl_error.Text = "This Data Cannot be Deleted. Because it is Involved in some Transaction";
                      //        }
                      //    }
                      //}
                      if (Request.QueryString["action"] == "update")
                      {
                          int _id = Convert.ToInt32(Request.QueryString["EID"]);
                          if (_id != 0)
                          {
                              spGetSporteqFromIDResult _sport_eq = db.spGetSporteqFromID(_id).ToList()[0];
                              //txtName.Text = _categoryResult.e_cat_name;
                              //txtType.Text = _categoryResult.e_cat_type;
                              tx_name.Text = _sport_eq.eq_name;
                              tx_quantity.Text = (_sport_eq.t_quantity).ToString();
                              add_sport.Text = "Update";
                              GetRepeatedFilled();
                          }
                      }
                      else if (Request.QueryString["action"] == "ev_update")
                      {
                          int _id = Convert.ToInt32(Request.QueryString["EID"]);
                          if (_id != 0)
                          {
                              e_sport_equip updev = (from ct in db.e_sport_equips where ct.eventeqid.Equals(_id) select ct).Single();
                            //  dp_ev_name.Visible = false;
                            //  tx_ev_name.Visible = true;

                              getevent = from all_event in db.event_registers
                                             select new
                                             {
                                                 name = all_event.e_name + " (" + all_event.e_location + ")",
                                                 all_event.eventid

                                             };

                              dp_ev_name.DataSource = getevent;
                              dp_ev_name.DataTextField = "name";
                              dp_ev_name.DataValueField = "eventid";
                              dp_ev_name.DataBind();



                              dp_ev_name.SelectedValue = updev.eventid.ToString();
                              dp_ev_name.Enabled = false;
                              dp_ev_spname.Enabled = false;
                              dp_ev_spname.SelectedValue = updev.sporteqid.ToString();
                              tx_ev_quantity.Text=updev.quantity.ToString();
                              dp_ev_return.SelectedValue = updev.sp_return.ToString();
                              pnl_ev_retn.Visible = true;
                              ev_btn.Text = "Update";
                              GetRepeatedevent();
                          }
                      }

                  }
                  GetRepeatedFilled();
                  GetRepeatedevent();
                

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
                    var deleteCategory = from cat in db.sport_equips where cat.sporteqid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.sport_equips.DeleteOnSubmit(cat);
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


        protected void rptr_event_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    var deleteCategory = from cat in db.e_sport_equips where cat.eventeqid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.e_sport_equips.DeleteOnSubmit(cat);
                    }
                    db.SubmitChanges();
                    GetRepeatedevent();
                    lbl_ev.Text = "Deleted Successfully. !";
                    lbl_ev.ForeColor = System.Drawing.Color.Green;
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


        private void RefreshControls()
        {
            // txtType.Text = string.Empty;
            // txtName.Text = string.Empty;
        }

        protected void add_sport_Click(object sender, EventArgs e)
        {
            if (add_sport.Text == "Add")
            {
                sport_equip sp = new sport_equip();
                sp.eq_name = tx_name.Text;
                sp.t_quantity = int.Parse(tx_quantity.Text);
                db.sport_equips.InsertOnSubmit(sp);
                db.SubmitChanges();
                RefreshControls();
                GetRepeatedFilled();
                lbl_error.Text = "Added Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
            }
            else if (add_sport.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                sport_equip updcat = (from ct in db.sport_equips where ct.sporteqid.Equals(cdid) select ct).Single();
                updcat.eq_name = tx_name.Text;
                updcat.t_quantity = int.Parse(tx_quantity.Text);
                db.SubmitChanges();
                GetRepeatedFilled();
                lbl_error.Text = "Updated Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
                Response.Redirect("sport_eq.aspx");
            }
        }

        protected void ev_btn_Click(object sender, EventArgs e)
        {
            if (ev_btn.Text == "Add")
            {
                e_sport_equip esp = new e_sport_equip();
                esp.eventid = Convert.ToInt32(dp_ev_name.SelectedValue);
                esp.sporteqid = Convert.ToInt32(dp_ev_spname.SelectedValue);
                esp.quantity = int.Parse(tx_ev_quantity.Text);
                esp.sp_return = dp_ev_return.SelectedValue;
                db.e_sport_equips.InsertOnSubmit(esp);
                db.SubmitChanges();
                
                RefreshControls();
                GetRepeatedevent();
                lbl_ev.Text = "Added Successfully. !";
                lbl_ev.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
            }
            else if (ev_btn.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                e_sport_equip updev = (from ct in db.e_sport_equips where ct.eventeqid.Equals(cdid) select ct).Single();
               // updev.eventid = Convert.ToInt32(dp_ev_name.SelectedValue);
                updev.sporteqid = Convert.ToInt32(dp_ev_spname.SelectedValue);
                updev.quantity = int.Parse(tx_ev_quantity.Text);
                updev.sp_return = dp_ev_return.SelectedValue;
                db.SubmitChanges();
                GetRepeatedevent();
                lbl_ev.Text = "Updated Successfully. !";
                lbl_ev.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
                Response.Redirect("sport_eq.aspx");
            }
        }
    }
}