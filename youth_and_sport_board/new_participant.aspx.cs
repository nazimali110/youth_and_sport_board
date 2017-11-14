using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace youth_and_sport_board
{
    public partial class new_participant : System.Web.UI.Page
    {
        DataClassesDataContext db = new DataClassesDataContext();
        static ArrayList arr1 = new ArrayList();
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
                    if (Request.QueryString["action"] == "update")
                    {
                        int _id = Convert.ToInt32(Request.QueryString["EID"]);
                        if (_id != 0)
                        {
                            spGetPerticipentFromIDsResult _newparti = db.spGetPerticipentFromIDs(_id).ToList()[0];

                            tx_fname.Text = _newparti.p_first_name;
                            tx_mname.Text = _newparti.p_middle_name;
                            tx_lname.Text = _newparti.p_last_name;
                            tx_dob.Text = Convert.ToString(_newparti.p_dob);
                            tx_address.Text = _newparti.p_address;
                            tx_email.Text = _newparti.p_email;
                            drp_gender.Text = _newparti.p_gender;

                            var get_or_con = from o in db.part_contacts where o.partid == _id select new { o.part_contid, o.contactno };
                            list_contact.DataSource = get_or_con;
                            list_contact.DataTextField = "contactno";
                            list_contact.DataValueField = "part_contid";
                            list_contact.DataBind();

                            add_parti.Text = "Update";
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
            tx_fname.Text = string.Empty;
            tx_mname.Text = string.Empty;
            tx_lname.Text = string.Empty;
            tx_dob.Text = string.Empty;
            tx_address.Text = string.Empty;
            tx_email.Text = string.Empty;
        }

        protected void add_parti_Click(object sender, EventArgs e)
        {
            if (add_parti.Text == "Add")
            {
                participant parti = new participant();
                parti.p_first_name =tx_fname.Text;
               parti.p_middle_name= tx_mname.Text;
               parti.p_last_name= tx_lname.Text;
               parti.p_dob= Convert.ToDateTime(tx_dob.Text);
               parti.p_address= tx_address.Text;
               parti.p_email= tx_email.Text;
               parti.p_gender= drp_gender.Text;



                db.participants.InsertOnSubmit(parti);
                db.SubmitChanges();
                if (tx_contact.Text == "")
                {
                    //do nothing
                }
                else
                {
                    list_contact.Items.Add(tx_contact.Text);
                }
                var x = (from y in db.participants select (int)y.partid).Max();
                int val = x;

                foreach (ListItem il in list_contact.Items)
                {
                    part_contact part_con = new part_contact();
                    part_con.partid = x;
                    part_con.contactno = Convert.ToDecimal(il.Text);
                    db.part_contacts.InsertOnSubmit(part_con);
                    db.SubmitChanges();
                }

                RefreshControls();
                lbl_error.Text = "Successfully add";
                lbl_error.ForeColor = System.Drawing.Color.Green;

            }
            else if (add_parti.Text == "Update")
            {
                int cdid = Convert.ToInt32(Request.QueryString["EID"]);
                participant upparti = (from ct in db.participants where ct.partid.Equals(cdid) select ct).Single();

                upparti.p_first_name = tx_fname.Text;
                upparti.p_middle_name = tx_mname.Text;
                upparti.p_last_name = tx_lname.Text;
                upparti.p_dob = Convert.ToDateTime(tx_dob.Text);
                upparti.p_address = tx_address.Text;
                upparti.p_email = tx_email.Text;
                upparti.p_gender = drp_gender.Text;
                /* del content */
                var del_con = from del in db.part_contacts where del.partid == cdid select del;
                foreach (var del in del_con)
                {
                    db.part_contacts.DeleteOnSubmit(del);
                }
                /* add new contect */
                foreach (ListItem il in list_contact.Items)
                {
                    part_contact part_con = new part_contact();
                    part_con.partid = cdid;
                    part_con.contactno = int.Parse(il.Text);
                    db.part_contacts.InsertOnSubmit(part_con);
                    db.SubmitChanges();
                }
             
                db.SubmitChanges();
                Response.Redirect("participant_eud.aspx");
            } 
            
         
        }

        protected void add_contact_Click(object sender, EventArgs e)
        {

            list_contact.Items.Add(tx_contact.Text);
         
            list_contact.SelectedIndex = 0;
            tx_contact.Text = "";
        }
        protected void del_contact_Click(object sender, EventArgs e)
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
    }
}