using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;

namespace youth_and_sport_board
{
    public partial class organization1 : System.Web.UI.Page
    {
        private void GetRepeatedFilled()
        {                      
            var getAllStudentInfo = from s in db.organizations
                                    select new
                                        {
                                            id = s.orgid,
                                            oname=s.org_name,
                                           ocontact = (db.org_contacts.Where(i => i.orgid == s.orgid).Select(i => new { i.orgid,i.contectid, i.contactno }).ToList()),
                                            oaddress = (db.org_Addresses.Where(i => i.orgid == s.orgid).Select(i => new { i.orgid, i.ADDID, i.Address }).ToList())
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
                    if (Request.QueryString["action"] == "update")
                    {
                        int _id = Convert.ToInt32(Request.QueryString["EID"]);
                        if (_id != 0)
                        {
                            spGetOrganizationFromIDsResult _organization = db.spGetOrganizationFromIDs(_id).ToList()[0];

                            var get_or_addr = from o in db.org_Addresses where o.orgid == _id select new { o.ADDID, o.Address };
                            list_address.DataSource = get_or_addr;
                            list_address.DataTextField = "Address";
                            list_address.DataValueField = "ADDID";
                            list_address.DataBind();

                            var get_or_con = from o in db.org_contacts where o.orgid == _id select new { o.contectid, o.contactno };
                            list_contact.DataSource = get_or_con;
                            list_contact.DataTextField = "contactno";
                            list_contact.DataValueField = "contectid";
                            list_contact.DataBind();



                            tx_org_name.Text = _organization.org_name;
                            //  tx_org_address.Text = _organization.org_address;
                            org_done.Text = "Update";
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
      static ArrayList arr = new ArrayList();
      static ArrayList arr1 = new ArrayList();
        DataClassesDataContext db = new DataClassesDataContext();
        
        public void org_add(int x)
        {
            if (con1.Text == "")
            {
                //do nothing
            }
            else
            {
                list_contact.Items.Add(con1.Text);
            }
            if (tx_address.Text == "")
            {
                //do nothing
            }
            else
            {
                list_address.Items.Add(tx_address.Text);
            }
          //  var x = (from y in db.organizations select (int)y.orgid).Max();
           // int val = x;


            foreach (ListItem il in list_address.Items)
            {
                org_Address org_addr = new org_Address();
                org_addr.orgid = x;
                org_addr.Address = il.Text;
                db.org_Addresses.InsertOnSubmit(org_addr);
                db.SubmitChanges();
            }
            foreach (ListItem il in list_contact.Items)
            {
                org_contact org_con = new org_contact();
                org_con.orgid = x;
                org_con.contactno = Convert.ToDecimal(il.Text);
                db.org_contacts.InsertOnSubmit(org_con);
                db.SubmitChanges();
            }
        }
        public void org_del(int id)
        {
            var del_con = from del in db.org_contacts where del.orgid == id select del;
            foreach (var del in del_con)
            {
                db.org_contacts.DeleteOnSubmit(del);
            }
            var del_addr = from del in db.org_Addresses where del.orgid == id select del;

            foreach (var del in del_addr)
            {
                db.org_Addresses.DeleteOnSubmit(del);
            }
        }

        protected void org_done_Click(object sender, EventArgs e)
        {
            if (org_done.Text == "Add")
            {
                organization org1 = new organization();
                org1.org_name = tx_org_name.Text;
              //  org1.org_address = tx_org_address.Text;
                db.organizations.InsertOnSubmit(org1);
                db.SubmitChanges();
                var x = (from y in db.organizations select (int)y.orgid).Max();
                
                org_add(x);

                GetRepeatedFilled();

                lbl_error.Text = "Added Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
            }
            else if (org_done.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                organization updcat = (from ct in db.organizations where ct.orgid.Equals(cdid) select ct).Single();
                updcat.org_name = tx_org_name.Text;


                org_del(cdid);
                org_add(cdid);


                db.SubmitChanges();
                GetRepeatedFilled();
                lbl_error.Text = "Updated Successfully. !";
                lbl_error.ForeColor = System.Drawing.Color.Green;
                RefreshControls();
                Response.Redirect("organization.aspx");
            }
          
        }
      
       

        protected void rptr_view_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                try
                {
                    int id = Convert.ToInt32(e.CommandArgument);

                    org_del(id);
                    var deleteCategory = from cat in db.organizations where cat.orgid == id select cat;
                    foreach (var cat in deleteCategory)
                    {
                        db.organizations.DeleteOnSubmit(cat);
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


        private void RefreshControls()
        {
           
            tx_org_name.Text = string.Empty;
            list_address.Items.Clear();
            list_contact.Items.Clear();
        }

        protected void org_add_contact_Click(object sender, EventArgs e)
        {
            
                list_contact.Items.Add(con1.Text);
               // arr1.Add(con1.Text);
                list_contact.SelectedIndex = 0;
                con1.Text = "";
            
            
        }

        protected void org_del_contact_Click(object sender, EventArgs e)
        {
            if (list_contact.Items.Count > 0 && list_contact.SelectedIndex >= 0)
            {
                for (int i = 0; i < list_contact.Items.Count; i++)
                {
                    if (list_contact.Items[i].Selected)
                    {
                        list_contact.Items.Remove(list_contact.Items[i]);
                        i--;
                    }
                }

                if (list_contact.Items.Count > 0)
                    list_contact.SelectedIndex = 0;
            }

        }

        protected void btn_add_addre_Click(object sender, EventArgs e)
        {
            list_address.Items.Add(tx_address.Text);
            list_address.SelectedIndex = 0;
            tx_address.Text = "";
        }

        protected void btn_add_del_Click(object sender, EventArgs e)
        {
            if (list_address.Items.Count > 0 && list_address.SelectedIndex >= 0)
            {
                for (int i = 0; i < list_address.Items.Count; i++)
                {
                    if (list_address.Items[i].Selected)
                    {
                        list_address.Items.Remove(list_address.Items[i]);
                        i--;
                    }
                }

                if (list_address.Items.Count > 0)
                    list_address.SelectedIndex = 0;
            }
        }
    }
}