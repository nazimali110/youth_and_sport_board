<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="event_register.aspx.cs" Inherits="youth_and_sport_board.event_register1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
   <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
    <%--this code is in master page--%>

    <script>
        $(function () {
            $(".datepicker12").datepicker({ dateFormat: 'dd/mm/yy' }).val();
            $(".datepicker12").datepicker();
            
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
  <div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Event Registration</h2>
        <fieldset>
         
          <br />
          <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Event Name</label>
                <div class="controls">
                    <asp:TextBox ID="ev_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_name" Width="140"></asp:RequiredFieldValidator>
              

    <asp:RegularExpressionValidator ID="re_tx_accc_name" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="ev_name"
                                    Display="Dynamic"   
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
              </div>
          </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Event Date</label>
            
                <div class="controls">
                    <asp:TextBox ID="ev_date" class="datepicker12" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_date" Width="140"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"     
                                    ErrorMessage="dd/mm/yyyy" 
                                    ValidationGroup="vd_add"
                                    Display="Dynamic"
                                    ControlToValidate="ev_date"   
                                    ForeColor="Red"  
                                    ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[/]([0]?[1-9]|[1][0-2])[/]([0-9]{4})$" />
                   <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="ev_date"
                     ErrorMessage="Date is not Valid" SetFocusOnError="True" ValidationExpression="^((31(?! (FEB|APR|JUN|SEP|NOV)))|((30|29)(?! FEB))|(29(?= FEB (((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00)))))|(0?[1-9])|1\d|2[0-8])/(JAN|FEB|MAR|MAY|APR|JUL|JUN|AUG|OCT|SEP|NOV|DEC)/((1[6-9]|[2-9]\d)\d{2})$"
                    ValidationGroup="vd_add"></asp:RegularExpressionValidator>--%>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Person Name</label>
                <div class="controls">
                    <asp:TextBox ID="ev_per_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_per_name" Width="140"></asp:RequiredFieldValidator>
               

    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="ev_per_name" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Estimate Amount</label>
              
                <div class="controls">
                    <asp:TextBox ID="ev_amonut" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_amonut" Width="140"></asp:RequiredFieldValidator>
                     
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="ev_amonut"
                     ErrorMessage="Enter Numbers only" SetFocusOnError="True" ValidationExpression="^\d+$"
                    ValidationGroup="vd_add"  ForeColor="Red"  ></asp:RegularExpressionValidator>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Location</label>
                <div class="controls">
                    <asp:TextBox ID="ev_location" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_location" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Organization</label>
              
                <div class="controls">
                    <asp:DropDownList ID="ev_org" runat="server">
                    </asp:DropDownList>
                </div>
              </div>
              </div>
              <div class="span4">
              <div class="control-group">
                <label class="control-label">Mandared</label>
              
                <div class="controls">
                    <asp:DropDownList ID="ev_cate" runat="server">
                    </asp:DropDownList>
                </div>
              </div>
              </div>
              
              </div>
              <div class="row">
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Participant Free</label>
                <div class="controls">
                    <asp:TextBox ID="ev_part_free" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_part_free" Width="140"></asp:RequiredFieldValidator>
                    
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="ev_part_free"
                     ErrorMessage="Enter Numbers only" SetFocusOnError="True" ValidationExpression="^\d+$"
                    ValidationGroup="vd_add"  ForeColor="Red"  ></asp:RegularExpressionValidator>

                </div>
              </div>
              </div>
              </div>
              <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Descripton</label>
              
                <div class="controls">
                    <asp:TextBox ID="ev_descrip" Width="610" Height="150" TextMode="MultiLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_descrip" Width="140"></asp:RequiredFieldValidator>
             
               </div>
              </div>
              </div>
              
            </div>
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button ID="ev_add" ValidationGroup="vd_add" class="btn" runat="server" Text="Add" 
                           onclick="ev_add_Click" />
                     
                    </div>
                </div>
                <div class="row">
    <asp:Label ID="lbl_error" runat="server" Text=""></asp:Label>

</div>
            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
