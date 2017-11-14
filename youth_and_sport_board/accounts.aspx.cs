using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class accounts : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        private void GetRepeatedFilled()
        {
            var getAllaccouts = from s in db.Accounts
                                 join r in db.AccountTypes on s.AccountTypeID equals r.AccountTypeID
                                 select new
                                 {
                                     s.AID,
                                     s.AccountName,
                                     // acctype = (db.AccountTypes.Where(i => i.AccountTypeID == s.AccountTypeID).Select(i => new { i.AccountType1 }).Single())
                                     r.AccountType1
                                 };
         
            rptr_view.DataSource = getAllaccouts;
            rptr_view.DataBind();

        }
        bool access = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < viewprofile.accessname.Count; i++)
            {
                if (viewprofile.accessname[i] == "Accounts")
                {
                    access = true;
                }
            }
            if (access == true)
            {
                if (!Page.IsPostBack)
                {
                    var acctype1 = from acc in db.AccountTypes select new { acc.AccountType1, acc.AccountTypeID };
                    dp_acc_type.DataSource = acctype1;
                    dp_acc_type.DataTextField = "AccountType1";
                    dp_acc_type.DataValueField = "AccountTypeID";
                    dp_acc_type.DataBind();
                    if (Request.QueryString["action"] == "aupdate")
                    {
                        int _id = Convert.ToInt32(Request.QueryString["EID"]);
                        if (_id != 0)
                        {
                            Account _account = (from upda in db.Accounts where upda.AID == _id select upda).Single();

                            tx_accc_name.Text = _account.AccountName;
                            dp_acc_type.SelectedValue = _account.AccountTypeID.ToString();
                            add_acc.Text = "Update";
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
        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);
                    var deleteacc = from cat in db.Accounts where cat.AID == id select cat;
                    foreach (var cat in deleteacc)
                    {
                        db.Accounts.DeleteOnSubmit(cat);
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
   

        private void RefreshControls()
        {
            tx_acc_no.Text = string.Empty;
            tx_accc_name.Text = string.Empty;
        }

        protected void add_acc_Click(object sender, EventArgs e)
        {
            bool avl=false;
            try
            {
                var getallaccount = (from s in db.Accounts where s.AccountNo == tx_acc_no.Text select new[] { s.AccountNo}).First();
            }
            catch
            {
                avl = true;
            }
            if (avl == true)
            {
                if (add_acc.Text == "Add")
                {
                    Account acc = new Account();

                    acc.AccountName = tx_accc_name.Text;
                    acc.AccountTypeID = int.Parse(dp_acc_type.SelectedValue);
                    acc.IsActive = true;
                    acc.AccountNo = tx_acc_no.Text;
                    db.Accounts.InsertOnSubmit(acc);

                    db.SubmitChanges();
                    GetRepeatedFilled();
                    lbl_error.Text = "Added Successfully. !";
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    RefreshControls();
                }
                else if (add_acc.Text == "Update")
                {
                    int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                    Account updacc = (from act in db.Accounts where act.AID.Equals(cdid) select act).Single();
                    updacc.AccountName = tx_accc_name.Text;
                    updacc.AccountTypeID = int.Parse(dp_acc_type.SelectedValue);
                    db.SubmitChanges();
                    GetRepeatedFilled();
                    lbl_error.Text = "Updated Successfully. !";
                    lbl_error.ForeColor = System.Drawing.Color.Green;
                    RefreshControls();
                    Response.Redirect("accounts.aspx");
                }
            }
            else
            {
                lbl_error.Text = "This account no is already used";
            }
        }

    

   
    }
}