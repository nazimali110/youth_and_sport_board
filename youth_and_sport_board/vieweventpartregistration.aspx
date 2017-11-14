<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="vieweventpartregistration.aspx.cs" Inherits="youth_and_sport_board.vieweventpartregistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>View Register Particant for Event</h2>
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
                                Event Date
                            </th>
                            <th>
                                Event Name
                            </th>
                            <th>
                                Person Name
                            </th>
                            <th>Estimated Amount</th>
                            <th>Location</th>
                            <th>Orgganization Name</th>
                            <th>veiw particpants</th>
                        </tr>
                    </thead>
                    <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"eventid") %>' />
                    
                       
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "edate")%>
                        </td>
                         <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_orgpersonname")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_amount")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_location")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "org_name")%>
                        </td>
                        <td align="center" >
                            <a href="rports.aspx?rpt=partregister&EID=<%# DataBinder.Eval(Container.DataItem,"eventid") %>" title="view report"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                          
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
