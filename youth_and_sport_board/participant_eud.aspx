<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="participant_eud.aspx.cs" Inherits="youth_and_sport_board.participant_eud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Participant Update Delete</h2>
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
                                First Name
                            </th>
                            <th>
                                Middle Name
                            </th>
                            <th>
                                Last Name
                            </th>
                            <th>Date Of Birth</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Contact</th>
                            <th>Commands</th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"partid") %>' />
            
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_first_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_middle_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_last_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "pdob")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_address")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_email")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "p_gender")%>
                        </td>
                        <td>
                            <asp:ListBox ID="ListBox1" runat="server" Rows="2"
                            DataSource='<%# DataBinder.Eval(Container.DataItem, "pcontact")%>'
                            DataTextField='contactno'
                            DataValueField='part_contid'>
                            </asp:ListBox>
                        </td>
                        <td align="center" >
                            <a href="new_participant.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"partid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"partid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
