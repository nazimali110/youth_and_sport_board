<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="event_register_eud.aspx.cs" Inherits="youth_and_sport_board.event_register_eud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Event Register Update Delete</h2>
        <fieldset>
         
          <br />
                <div class="row">
                <asp:Panel ID="pnlView" runat="server">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                 <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Register Date
                            </th>
                            <th>
                                Event Date
                            </th>
                            <th>
                                Person Name
                            </th>
                            <th>Estimated Amount</th>
                            <th>Description</th>
                            <th>Location</th>
                            <th>Orgganization Name</th>
                            <th>Registy Name</th>
                            <th>Commands</th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"eventid") %>' />
                    
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "cdate")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "edate")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_orgpersonname")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_amount")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_description")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_location")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "org_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "logname")%>
                        </td>
                        <td align="center" >
                            <a href="event_register.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"eventid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"eventid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
        <asp:Label style="margin-left:20px;" ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
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
