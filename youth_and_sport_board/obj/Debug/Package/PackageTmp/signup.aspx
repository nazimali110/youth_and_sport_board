<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="youth_and_sport_board.signup" %>
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
      <h2>Create User</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">First Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="up_fname" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_fname" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="up_fname" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />

                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Last Name</label>
                <div class="controls">
                      <asp:TextBox ID="up_lname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_lname" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="up_lname" 
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
                <label class="control-label">User Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="up_uname" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_uname" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Password </label>
                <div class="controls">
                      <asp:TextBox ID="up_pass" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_pass" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Gender</label>
              
                <div class="controls">
                    <asp:DropDownList ID="up_gender" runat="server">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>    
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
                      <asp:TextBox ID="up_email"  runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_email" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="up_email"
                     ErrorMessage="Not a Valid Email Address" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="vd_add"></asp:RegularExpressionValidator>
                </div>
              </div>
              </div>
              </div>
              <div class="row">
            <div class="span4">
                     <link href="docs/datapicker/jquery-ui.css" rel="stylesheet" type="text/css" />
                  <script src="docs/datapicker/jquery-ui.js" type="text/javascript"></script>


              <div class="control-group">
                <label class="control-label">Date of Birth</label>
              
                <div class="controls">
                    <asp:TextBox ID="up_dob" class="datepicker12" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_dob" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"     
                                    ErrorMessage="dd/mm/yyyy" 
                                    ValidationGroup="vd_add"
                                    Display="Dynamic"
                                    ControlToValidate="up_dob"   
                                    ForeColor="Red"  
                                    ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[/]([0]?[1-9]|[1][0-2])[/]([0-9]{4})$" />
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Address</label>
                <div class="controls">
                      <asp:TextBox ID="up_address" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_address" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              
              
            </div>
              <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Contact No</label>
              
                <div class="controls">
                    <asp:TextBox ID="up_contect" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="up_contect" Width="140"></asp:RequiredFieldValidator>
                    
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="up_contect"
                     ErrorMessage="Enter Numbers only (11 digits)" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[ ()+]*([0-9][ ()+]*){11}$"
                    ValidationGroup="vd_add"></asp:RegularExpressionValidator>
                </div>
              </div>
              </div>
              <div class="span4">
              <div class="control-group">
                <label class="control-label">Account Type</label>
              
                <div class="controls">
                    <asp:DropDownList ID="up_accounttype" runat="server">
                    
                    </asp:DropDownList>
                </div>
              </div>
              </div>
            </div>
            
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button class="btn" ID="up_add" ValidationGroup="vd_add" runat="server" Text="Add" 
                           onclick="up_add_Click" />
                      
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
