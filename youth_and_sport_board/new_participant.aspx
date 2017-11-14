<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="new_participant.aspx.cs" Inherits="youth_and_sport_board.new_participant" %>
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
        <h2>Participant From</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">First Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_fname" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ValidationGroup="add" ControlToValidate="tx_fname"  runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_fname" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="tx_fname" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
             </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Middle Name</label>
                <div class="controls">
                      <asp:TextBox ID="tx_mname" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_mname" Width="140"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="tx_mname" 
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
                <label class="control-label">Last Name</label>
                <div class="controls">
                      <asp:TextBox ID="tx_lname" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_lname" Width="140"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="tx_lname" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
              </div>
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Date of Birth</label>
      
               
                <div class="controls">
                    <asp:TextBox ID="tx_dob" class="datepicker12" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_dob" Width="140"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"     
                                    ErrorMessage="dd/mm/yyyy" 
                                    ValidationGroup="vd_add"
                                    Display="Dynamic"
                                    ControlToValidate="tx_dob"   
                                    ForeColor="Red"  
                                    ValidationExpression="^([0]?[1-9]|[1|2][0-9]|[3][0|1])[/]([0]?[1-9]|[1][0-2])[/]([0-9]{4})$" />

                </div>
              </div>
              </div>
              
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Gender</label>
              
                <div class="controls">
                    <asp:DropDownList ID="drp_gender" runat="server">
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
                      <asp:TextBox ID="tx_email" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_email" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="tx_email"
                     ErrorMessage="Not a Valid Email Address" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="vd_add"></asp:RegularExpressionValidator>
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
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_address" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              <asp:ScriptManager ID="ScriptManager1" runat="server">  
</asp:ScriptManager>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server"  >
                    <ContentTemplate>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Contact No.</label>
                <div class="controls">
                      <asp:TextBox ID="tx_contact" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="c_vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_contact" Width="140"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Display="Dynamic" runat="server" ControlToValidate="tx_contact"
                     ErrorMessage="Enter Numbers only (11 digits)" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^[ (0)+]*([0-9][ ()+]*){11}$"
                    ValidationGroup="c_vd_add"></asp:RegularExpressionValidator>
                     <asp:Button ID="add_contact" class="btn"  runat="server" Text="Add more" 
                           onclick="add_contact_Click" ValidationGroup="c_vd_add" />
                           <asp:Button ID="del_contact" class="btn"  runat="server" Text="Delete" 
                           onclick="del_contact_Click" />
                         <asp:ListBox ID="list_contact" SelectionMode="Multiple" runat="server">
                    
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="vd_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_contact" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>
                      <asp:PlaceHolder runat="server" id="PlaceHolder1" />
                </div>
              </div>
              </div>
                
                </ContentTemplate>
                           </asp:UpdatePanel>
              </div>
            
            <div class="span1 offset8">
                   <div class="control-group">
                       
                       <asp:Button ValidationGroup="vd_add" class="btn" ID="add_parti" runat="server" Text="Add" 
                           onclick="add_parti_Click" />
                     
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
