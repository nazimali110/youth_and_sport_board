<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="datarport.aspx.cs" Inherits="youth_and_sport_board.datarport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
   <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <%--this code is in master page--%>

    <script>
        $(function () {
            $(".datepicker12").datepicker();
            $(".datepicker12").datepicker({ dateFormat: 'dd/mm/yy' }).val();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="body">
   
    <div class="body_resize">

      <div class="Welcome">
        <h2>Reports</h2>
        <fieldset>
         
          <br />

           <h3>User info</h3>
          <div class="row">
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="tx_userinfo"  class="btn" runat="server" 
                           Text="View" onclick="tx_userinfo_Click" 
                           />
                      
                    </div>
                </div>
          </div> 
         <h3>Participant Details</h3>
          <div class="row">
          <div class="span4">
               <div class="control-group">
                <label class="control-label">Gender</label>
                <div class="controls">
                    <asp:DropDownList ID="dp_gender" runat="server">
                    <asp:ListItem>both</asp:ListItem>
                    <asp:ListItem>male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                    </asp:DropDownList>
                </div>
              </div>
              </div>
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="part_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="part_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="part_start" Width="140"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="re_part_start" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="part_vali"
                                    ControlToValidate="part_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="part_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="part_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="part_end" Width="140"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="part_vali"
                                    ControlToValidate="part_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="part_btn" ValidationGroup="part_vali" class="btn" runat="server" 
                           Text="View" onclick="part_btn_Click"
                           />
                      
                    </div>
                </div>
          </div>
          <h3>Events Details</h3>
            <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Organization</label>
                <div class="controls">
                    <asp:DropDownList ID="dp_org" runat="server">
                    </asp:DropDownList>
                </div>
              </div>
              </div>
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="org_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="org_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="org_start" Width="140"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="org_vali"
                                    ControlToValidate="org_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="org_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="org_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="org_end" Width="140"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="org_vali"
                                    ControlToValidate="org_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="org_btn" ValidationGroup="org_vali" class="btn" 
                           runat="server" Text="View" onclick="org_btn_Click" 
                           />
                      
                    </div>
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
