<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="accounts.aspx.cs" Inherits="youth_and_sport_board.accounts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Accounts</h2>
        <fieldset>
          
          <br />

          <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Account No</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_acc_no" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="acc_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_acc_no" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"     
                                    ErrorMessage="number only max(5)lenght" 
                                    ValidationGroup="acc_add"
                                    ControlToValidate="tx_acc_no"   
                                    ForeColor="Red"  
                                    ValidationExpression="^[\d]{1,5}$" />
                     </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Account Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_accc_name" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="acc_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_accc_name" Width="140"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="re_tx_accc_name" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="acc_add"
                                    ControlToValidate="tx_accc_name"   
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Account type</label>
                <div class="controls">
                    <asp:DropDownList ID="dp_acc_type" runat="server">
                    
                    </asp:DropDownList>
                </div>
              </div>
              </div>
              
              
            </div>
            
              <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button class="btn" ID="add_acc" ValidationGroup="acc_add" runat="server" Text="Add" onclick="add_acc_Click" 
                          />
                          
                    </div>
                </div>
                </div>
                
<div class="row">
 <asp:Label style="margin-left:20px;" Width="900px" ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>

</div>
                <div class="row">
              
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Account Name
                            </th>
                            <th>
                               Account Type
                            </th>
                            
                            <th>
                                Commands
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"AID") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "AccountName")%>
                        </td>
                        <td align="center">
                        
                        <%# DataBinder.Eval(Container.DataItem, "AccountType1")%>
                        <%--<asp:ListBox ID="ListBox1" 
                             DataSource="<%# DataBinder.Eval(Container.DataItem, "acctype")%>"
                           DataTextField="AccountType1" DataValueField="AccountType1" runat="server"
                             Rows="1">
                            </asp:ListBox>--%>
                           
                        </td>
                        <td align="center" >
                            <a href="accounts.aspx?action=aupdate&EID=<%# DataBinder.Eval(Container.DataItem,"AID") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"AID") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                    <tfoot>
                    </tfoot>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </table>
        
    </div>  

    <br />
  
            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
