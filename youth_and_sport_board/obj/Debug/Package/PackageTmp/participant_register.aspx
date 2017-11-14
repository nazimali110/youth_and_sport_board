<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="participant_register.aspx.cs" Inherits="youth_and_sport_board.participant_register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Event Participant From</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Participant</label>
              
                <div class="controls">
                    <asp:DropDownList ID="dp_part" runat="server">
                    </asp:DropDownList>
                    <%--<asp:TextBox ID="tx_fname" runat="server"></asp:TextBox>--%>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ForeColor="Red" ValidationGroup="add" ControlToValidate="tx_fname"  runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_fname" Width="140"></asp:RequiredFieldValidator>--%>
                    
                </div>
              </div>
             </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Event</label>
                <div class="controls">
                    <asp:DropDownList ID="dp_event" runat="server">
                    </asp:DropDownList>
                     <%-- <asp:TextBox ID="tx_mname" runat="server"></asp:TextBox>--%>
                      <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_mname" Width="140"></asp:RequiredFieldValidator>--%>
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Event fees</label>
                <div class="controls">
                      <asp:TextBox ID="tx_fee_amount" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_fee_amount" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ControlToValidate="tx_fee_amount"
                     ErrorMessage="Enter Numbers only" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^\d+$"
                    ValidationGroup="vd_add"></asp:RegularExpressionValidator>
                </div>
              </div>
              </div>
            
            <div class="span4">
               <div class="control-group">
                <label class="control-label">Description</label>
                <div class="controls">
                      <asp:TextBox ID="tx_part_decs" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>  
              
              
            </div>

            <div class="span1 offset8">
                   <div class="control-group">
                       
                       <asp:Button ValidationGroup="vd_add" class="btn" ID="add_reg" runat="server" 
                           Text="Add" onclick="add_reg_Click"  />
                       
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
