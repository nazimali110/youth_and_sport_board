<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="participant_register_edu.aspx.cs" Inherits="youth_and_sport_board.participant_register_edu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Event Participant</h2>
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
                                Participant Name
                            </th>
                            <th>
                                Event Name
                            </th>
                           
                             
                            <th>Registration Fees</th>
                            <th>Description</th>
                            <th>Commands</th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"prid") %>' />
                    
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "curdate")%>
                        </td>
                        <td align="center">
                          <%--  <asp:ListBox ID="ListBox1" DataSource="<%# DataBinder.Eval(Container.DataItem, "partiname")%>" Rows="1" runat="server"></asp:ListBox>--%>
                           <%-- <asp:ListBox ID="ListBox1" DataSource='<%# DataBinder.Eval(Container.DataItem, "partiname")%>' runat="server"></asp:ListBox>--%>
                            <%# DataBinder.Eval(Container.DataItem, "partiname")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "eventname")%>

                             
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "fee")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "description")%>
                        </td>
                        <td align="center" >
                            <a href="participant_register.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"prid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"prid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
