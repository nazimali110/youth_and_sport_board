<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true"
    CodeBehind="event_category.aspx.cs" Inherits="youth_and_sport_board.event_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Event Category</h2>
        
        <fieldset>
         
          <br />
          

            <div class="row">
            <div class="span4">

              <div class="control-group">
                <label class="control-label">Mandared Name</label>
              
                <div class="controls" id="name">
                     <asp:TextBox ID="txtName" runat="server" Width="200"></asp:TextBox>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="txtName" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="regexpName" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vg_add"
                                    ControlToValidate="txtName"   
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />

                </div>
              </div>
              </div>
            
              
              
            </div>
            
            <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                 
                     <asp:Button ID="btnAdd" ValidationGroup="vg_add" CssClass="menuitem_green btn" runat="server" Text="Add" 
                        Width="100px" onclick="btnAdd_Click" />
                           
                    </div>
                </div>
               
                </div>
                <div class="row">
  <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>

</div>
                <div class="row">
                
                <asp:Panel ID="pnlView" runat="server">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
    
     
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                  <HeaderTemplate>
                    <thead>
                        <tr>
                            <th  scope="col"  align="center" class="rounded-company">
                                Mandared Name
                            </th>
                            <th  scope="col"  align="center" class="rounded-company">
                                Commands
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"e_cataid") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_cat_name")%>
                        </td>
                        <td class="options-width">
                            <a href="event_category.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"e_cataid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"e_cataid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
