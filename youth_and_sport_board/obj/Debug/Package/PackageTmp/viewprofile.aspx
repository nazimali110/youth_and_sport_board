<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="viewprofile.aspx.cs" Inherits="youth_and_sport_board.viewprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
        <asp:Label ID="error_lbl" runat="server" Text=""></asp:Label>
      <div class="Welcome">
        <h2><%=profilename%></h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">UserName</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_username" Enabled="false" runat="server"></asp:TextBox>
                  
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">First Name</label>
                <div class="controls">
                  <asp:TextBox ID="tx_fname" Enabled="false" runat="server"></asp:TextBox>
                 
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Last Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_lname" Enabled="false" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
                 <asp:TextBox ID="tx_email" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Address</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_address" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_address" Width="140"></asp:RequiredFieldValidator>
              


                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Contect No</label>
                <div class="controls">
                 <asp:TextBox ID="tx_contect" runat="server"></asp:TextBox> 
               <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_contect" Width="140"></asp:RequiredFieldValidator>
                     
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="tx_contect"
                     ErrorMessage="Enter Numbers only" SetFocusOnError="True" ValidationExpression="^\d+$"
                    ValidationGroup="vd_add"  ForeColor="Red"  ></asp:RegularExpressionValidator>   
                 <br />

                   
                </div>
                 
              </div>
              </div>
              
            </div>
              
            <div class="span1 offset8">
                   <div class="control-group">
               
                       <asp:Button class="btn" ID="btn_add" ValidationGroup="vd_add" runat="server" Text="Update" 
                           onclick="btn_add_Click" />
                        <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
