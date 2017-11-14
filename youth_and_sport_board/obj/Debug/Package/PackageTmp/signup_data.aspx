<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="signup_data.aspx.cs" Inherits="youth_and_sport_board.signup_data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>User Edit Update Delete</h2>
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
                                Last Name
                            </th>
                            <th>
                                Content no.
                            </th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Username</th>
                            <th>Commands</th>
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
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "emailadd")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "gender")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "username")%>
                        </td>
                        <td align="center" >
                            <a href="signup.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"loginid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"loginid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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


                <%--<table class="table table-striped">  
        <thead>  
          <tr>  
            <th>Name</th>  
            <th>Type</th>  
            <th>Edit</th>  
            <th>Delete</th>  
          </tr>  
        </thead>  
        <tbody>  
          <tr>  
            <td>Cricket</td>  
            <td>Outdoor</td>  
            <td><a style="float:none;" href="#" title="edit" >Edit</a> </td>  
            <td><a style="float:none;" href="#" title="delete" >Delete</a></td>  
          </tr> 
       
          
        </tbody>  
      </table>--%>  

            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
