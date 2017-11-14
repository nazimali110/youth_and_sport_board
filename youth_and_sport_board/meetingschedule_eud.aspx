<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="meetingschedule_eud.aspx.cs" Inherits="youth_and_sport_board.meetingschedule_eud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Meeting View</h2>
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
                           <th>Subject</th>
                            <th>Meeting Date</th>
                            <th>Location</th>
                            <th>Description</th>
                            <th>Commands</th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"Meetingid") %>' />
                    
                       
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "m_subject")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "meetdate")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "location")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "description")%>
                        </td>

                        <td align="center" >
                            <a href="meetingschedule.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"Meetingid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Meetingid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
