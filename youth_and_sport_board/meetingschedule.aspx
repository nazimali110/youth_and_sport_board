<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="meetingschedule.aspx.cs" Inherits="youth_and_sport_board.meetingschedule" %>
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
        <h2>Meeting Scheduling</h2>
        <fieldset>
         
          <br />
          <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Subject</label>
                <div class="controls">
                    <asp:TextBox ID="ev_subj" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_subj" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
          </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Meeting Date</label>
              
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
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Location</label>
                <div class="controls">
                    <asp:TextBox ID="ev_location" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="ev_location" Width="140"></asp:RequiredFieldValidator>
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
