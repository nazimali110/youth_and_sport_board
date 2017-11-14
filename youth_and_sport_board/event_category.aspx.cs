using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class event_category : System.Web.UI.Page
    {

        bool access = false;
        DataClassesDataContext obj = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
            var getAllStudentInfo = from s in obj.e_catagories select new { s.e_cataid, s.e_cat_name };
            rptr_view.DataSource = getAllStudentInfo;
            rptr_view.DataBind();
        }

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
                            int id = Convert.ToInt32(Request.QueryString["e_cataid"]);
                            var deleteCategory = from c in obj.e_catagories where c.e_cataid.Equals(id) select c;
                            foreach (var category in deleteCategory)
                            {
                                obj.e_catagories.DeleteOnSubmit(category);
                            }
                            obj.SubmitChanges();
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
                            spGetCategoryFromIDResult _categoryResult = obj.spGetCategoryFromID(_id).ToList()[0];
                            txtName.Text = _categoryResult.e_cat_name;
                            btnAdd.Text = "Update";
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
        private void RefreshControls()
        {
            txtName.Text = string.Empty;
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (btnAdd.Text == "Add")
            {
                e_catagory ct = new e_catagory();
                ct.e_cat_name = txtName.Text;
                obj.e_catagories.InsertOnSubmit(ct);
                obj.SubmitChanges();
                GetRepeatedFilled();
                lbl_error.Text = "Student Information Added Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
            }
            else if (btnAdd.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                e_catagory updcat = (from ct in obj.e_catagories where ct.e_cataid.Equals(cdid) select ct).Single();
                updcat.e_cat_name = txtName.Text;
                obj.SubmitChanges();
                GetRepeatedFilled();
                lbl_error.Text = "Category Updated Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
                Response.Redirect("event_category.aspx");
            }
        }
        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    var deleteCategory = from cat in obj.e_catagories where cat.e_cataid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        obj.e_catagories.DeleteOnSubmit(cat);
                    }
                    obj.SubmitChanges();
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
    }
}