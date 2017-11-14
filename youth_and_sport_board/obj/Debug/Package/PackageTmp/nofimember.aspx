<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="nofimember.aspx.cs" Inherits="youth_and_sport_board.nofimember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Notification Member</h2>
        
        <fieldset>
         
          <br />
          
          <h3>Add New</h3>
          <br />
            <div class="row">
            <div class="span4">

              <div class="control-group">
                <label class="control-label">Name</label>
              
                <div class="controls" id="name">
                    <asp:TextBox ID="tx_org_name" runat="server"></asp:TextBox>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_org_name" Width="140"></asp:RequiredFieldValidator>

                </div>
              </div>
              </div>
            
              
              
            </div>
           
            <div class="row">
            <div class="span1 offset1">
                   <div class="control-group">
                 
                       <asp:Button class="btn" ID="search_done" ValidationGroup="vg_add" 
                           runat="server" Text="Search" onclick="search_done_Click" 
                            />
                          
                    </div>
                </div>
                </div>
                   <h3>All Users</h3>
                <div class="row">
                
                <asp:Panel ID="pnlView" runat="server" Height="400px"  style="overflow-x:hidden; overflow-y:scroll;" >
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
    
     
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Last
                            </th>
                            <th>
                                Contact Numbers
                            </th>
                            <th>
                                Email
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
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"loginid") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "firstname")%>
                        </td>
                        <td align="center">
                           
                             <%# DataBinder.Eval(Container.DataItem, "lastname")%>
                        </td>
                        <td align="center">
                        <%# DataBinder.Eval(Container.DataItem, "contactno")%>
                          
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container.DataItem, "emailadd")%>                    
                        </td>
                        <td align="center" >
                          

                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="add"
                                OnClientClick="return confirm('Are want to add this member as Notification?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"loginid") %>'><img src="images/add.png" alt="" title="" border="0" /></a></asp:LinkButton>
                               
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
        
    </asp:Panel>

  <asp:Label style="margin-left:20px;" ID="lbl_error" Text="" runat="server" ForeColor="Red"></asp:Label>
  <br />
    </div>
     <h3>Current Notify Member</h3>
    <div class="row">
      
    <br />
       <asp:Panel ID="Panel1" runat="server" Height="400px"  style="overflow-x:hidden; overflow-y:scroll;">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
    
     
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rpt_current" runat="server" OnItemCommand="rpt_current_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            <th>
                                Last
                            </th>
                            <th>
                                Contact Numbers
                            </th>
                            <th>
                                Email
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
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"id") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "mname")%>
                        </td>
                        <td align="center">
                           
                             <%# DataBinder.Eval(Container.DataItem,"mlast") %>
                        </td>
                        <td align="center">
                        <%# DataBinder.Eval(Container.DataItem,"mcontact") %>
                          
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container.DataItem,"memail" )%>                    
                        </td>
                        <td align="center" >
                          

                            <asp:LinkButton ID="removeButton" runat="server" CausesValidation="False" CommandName="remove"
                                OnClientClick="return confirm('Are want to remove this member as Notification?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"id") %>'><img src="images/remove.png" alt="" title="" border="0" /></a></asp:LinkButton>
                               
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
        
    </asp:Panel>

    </div>


            </fieldset>

         
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
