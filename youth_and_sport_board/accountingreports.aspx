<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="accountingreports.aspx.cs" Inherits="youth_and_sport_board.accountingreports" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
   <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <%--this code is in master page--%>

    <script>
        $(function () {
          
            $(".datepicker12").datepicker();
//            $(".datepicker12").datepicker({ dateFormat: 'dd/mm/yy' }).val();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
   
    <div class="body_resize">

      <div class="Welcome">
        <h2>Account Reports</h2>
        <fieldset>
         
          <br />

           <h3>Genernal Joural</h3>
          <div class="row">
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="tx_general" class="btn" runat="server" 
                           Text="View" onclick="tx_general_Click"
                           />
                      
                    </div>
                </div>
          </div> 
             <h3>Genaral Ladger</h3>
          <div class="row">
          <div class="span4">
               <div class="control-group">
                <label class="control-label">Account ID</label>
                <div class="controls">
                    <asp:TextBox ID="tx_gl_accid" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="gl_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_gl_accid" Width="140"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="re_tx_accc_name" runat="server"     
                                    ErrorMessage="number only max(5)lenght" 
                                    ValidationGroup="gl_vali"
                                    ControlToValidate="tx_gl_accid"   
                                    ForeColor="Red"  
                                    ValidationExpression="^[\d]{1,5}$" />
                </div>
              </div>
              </div>
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="tx_gl_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="gl_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_gl_start" Width="140"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="gl_vali"
                                    Display="Dynamic"
                                    ControlToValidate="tx_gl_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="tx_gl_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="gl_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_gl_end" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="gl_vali"
                                    Display="Dynamic"
                                    ControlToValidate="tx_gl_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="btn_gl" ValidationGroup="gl_vali" class="btn" runat="server" 
                           Text="View" onclick="btn_gl_Click" 
                           />
                      
                    </div>
                </div>
          </div>
         <h3>Trial Balance</h3>
          <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="tr_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="tr_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tr_start" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="tr_vali"
                                    Display="Dynamic"
                                    ControlToValidate="tr_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="tr_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="tr_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tr_end" Width="140"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="tr_vali"
                                    Display="Dynamic"
                                    ControlToValidate="tr_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="tr_btn" ValidationGroup="tr_vali" class="btn" runat="server" 
                           Text="View" onclick="tr_btn_Click"
                           />
                      
                    </div>
                </div>
          </div>
          <h3>Income Statement</h3>
            <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="inst_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="inst_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="inst_start" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="inst_vali"
                                    Display="Dynamic"
                                    ControlToValidate="inst_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="inst_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="inst_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="inst_end" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="inst_vali"
                                    Display="Dynamic"
                                    ControlToValidate="inst_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="inst_btn" ValidationGroup="inst_vali" class="btn" 
                           runat="server" Text="View" onclick="inst_btn_Click" 
                           />
                      
                    </div>
                </div>
          </div>
          
           <h3>Balance Sheet</h3>
            <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Start Date</label>
                <div class="controls">
                    <asp:TextBox ID="blnce_start" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="blnce_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="blnce_start" Width="140"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="blnce_vali"
                                    Display="Dynamic"
                                    ControlToValidate="blnce_start"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>

              <div class="span4">
               <div class="control-group">
                <label class="control-label">End Date</label>
                <div class="controls">
                    <asp:TextBox ID="blnce_end" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="blnce_vali" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="blnce_end" Width="140"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server"     
                                    ErrorMessage="mm/dd/yyyy" 
                                    ValidationGroup="blnce_vali"
                                    Display="Dynamic"
                                    ControlToValidate="blnce_end"   
                                    ForeColor="Red"  
                                    ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" />
                </div>
              </div>
              </div>
              <div class="span1">
                   <div class="control-group">
                       <asp:Button ID="Button2" ValidationGroup="blnce_vali" class="btn" 
                           runat="server" Text="View" onclick="Button2_Click" 
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
