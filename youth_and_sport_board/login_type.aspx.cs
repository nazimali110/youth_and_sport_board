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
    public partial class login_type : System.Web.UI.Page
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

                  if (!Page.IsPostBack)
                  {
                      var getitem = from s in db.pages select new { s.pageid, s.pagename };
                      ck_web_page.DataSource = getitem;
                      ck_web_page.DataTextField = "pagename";
                      ck_web_page.DataValueField = "pageid";

                      ck_web_page.DataBind();
                      if (Request.QueryString["action"] == "delete")
                      {
                          try
                          {
                              int id = Convert.ToInt32(Request.QueryString["orgid"]);
                              var deleteCategory = from c in db.organizations where c.orgid.Equals(id) select c;
                              foreach (var category in deleteCategory)
                              {
                                  db.organizations.DeleteOnSubmit(category);
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
                      else if (Request.QueryString["action"] == "update")
                      {
                          int _id = Convert.ToInt32(Request.QueryString["EID"]);
                          if (_id != 0)
                          {
                              spGetlogintypeFromIDResult _logintype = db.spGetlogintypeFromID(_id).ToList()[0];


                              List<int> pageIds = db.pagesacesses.Where(i => i.logintypeid == _id)
                                                           .Select(i => i.pageid).ToList();

                              for (int i = 0; i < ck_web_page.Items.Count; i++)
                              {
                                  if (pageIds.Contains(int.Parse(ck_web_page.Items[i].Value)))
                                  {
                                      ck_web_page.Items[i].Selected = true;
                                  }
                              }
                              tx_logintype.Text = _logintype.typename;
                              login_ty_done.Text = "Update";
                              GetRepeatedFilled();
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
        private void GetRepeatedFilled()
        {
            var getAllStudentInfo = from s in db.e_logintypes
                                    select new
                                    {
                                        id = s.logintypeid,
                                        name = s.typename,
                                        PageName = (db.pagesacesses.Where(i => i.logintypeid == s.logintypeid)
                                                     .Select(i => new { i.pageid, i.page.pagename })
                                                    .ToList())
                                    };
            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }
        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    var deleteCategory = from cat in db.e_logintypes where cat.logintypeid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.e_logintypes.DeleteOnSubmit(cat);
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
        private void RefreshControls()
        {
            // txtType.Text = string.Empty;
            // txtName.Text = string.Empty;
        }
        protected void login_ty_done_Click(object sender, EventArgs e)
        {

            if (login_ty_done.Text == "Add")
            {
                
                    ArrayList valuecheck = new ArrayList();
                    foreach (ListItem li in ck_web_page.Items)
                    {
                        if (li.Selected == true)
                        {
                            valuecheck.Add(li.Value);
                        }
                    }
                    if (valuecheck.Count == 0)
                    {
                        lbl.Text = "Atleast one check is Required";
                        lbl.ForeColor = System.Drawing.Color.Red;

                    }
                    else
                    {


                        e_logintype e_lt = new e_logintype();
                        e_lt.typename = tx_logintype.Text;
                        db.e_logintypes.InsertOnSubmit(e_lt);
                        db.SubmitChanges();


                        var x = (from y in db.e_logintypes select (int)y.logintypeid).Max();
                        int val = x;

                        for (int i = 0; i < valuecheck.Count; i++)
                        {
                            pagesacess page_acc = new pagesacess();
                            page_acc.logintypeid = x;
                            page_acc.pageid = Convert.ToInt16(valuecheck[i]);
                            db.pagesacesses.InsertOnSubmit(page_acc);
                            db.SubmitChanges();
                        }
                        valuecheck.Clear();


                        RefreshControls();
                        GetRepeatedFilled();
                        lbl_error.Text = "Added Successfully. !";
                        lbl_error.ForeColor = System.Drawing.Color.Green;
                        RefreshControls();
                    }
                
            }

            else if (login_ty_done.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                e_logintype updcat = (from ct in db.e_logintypes where ct.logintypeid.Equals(cdid) select ct).Single();

                var del_pag_acc = from del in db.pagesacesses where del.logintypeid == cdid select del;
                //ar del_con = from del in db.org_contacts where del.orgid == id select del;
                foreach (var del in del_pag_acc)
                {
                    db.pagesacesses.DeleteOnSubmit(del);
                }



                ArrayList valuecheck = new ArrayList();
                foreach (ListItem li in ck_web_page.Items)
                {
                    if (li.Selected == true)
                    {
                        valuecheck.Add(li.Value);
                    }
                }

                for (int i = 0; i < valuecheck.Count; i++)
                {
                    pagesacess page_acc = new pagesacess();
                    page_acc.logintypeid = cdid;
                    page_acc.pageid = Convert.ToInt16(valuecheck[i]);
                    db.pagesacesses.InsertOnSubmit(page_acc);
                    db.SubmitChanges();
                }
                valuecheck.Clear();

                // List<pagesacess> updPage = db.pagesacesses.Where(i=> i.logintypeid == cdid).ToList<pagesacess>();
                // List<int> newPage = new List<int>();
                //foreach (ListItem li in ck_web_page.Items)
                // {
                //     if (li.Selected == true)
                //     {
                //         newPage.Add(int.Parse(li.Value));
                //     }
                // }

                //   var DifferencesList = updPage.Where(x => !newPage.Any(x1 => x1 == x.pageid))
                // .Union(newPage.Where(x => !updPage.Any(x1 => x1 == x.pageid)));

                updcat.typename = tx_logintype.Text;
                db.SubmitChanges();
                GetRepeatedFilled();
                lbl_error.Text = "Updated Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
                Response.Redirect("login_type.aspx");
            }
          

               
        }
    }
}