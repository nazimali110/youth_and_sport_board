<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="change_pass.aspx.cs" Inherits="youth_and_sport_board.change_pass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Change Password</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Old Password</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_old" TextMode="Password" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_old" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">New Password</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_new" TextMode="Password" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_new" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Re-type Password</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_confrom" TextMode="Password" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_confrom" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
            </div>
                <div class="row">
            <div class="span1">
                   <div class="control-group">
                       <asp:Button class="btn" ID="btn_change" ValidationGroup="vd_add" runat="server" 
                           Text="Change" onclick="btn_change_Click" />
                    </div>
                </div>
                </div> 
                <div class="row">
                
                <asp:Label ID="lb_error" runat="server" Text=""></asp:Label>
               
                </div>
            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
