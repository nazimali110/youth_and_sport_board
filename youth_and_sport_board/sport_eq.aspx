<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="sport_eq.aspx.cs" Inherits="youth_and_sport_board.sport_eq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Sport Equipment</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Sport Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_name" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Quantity</label>
                <div class="controls">
                  <asp:TextBox ID="tx_quantity" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
              
              
            </div>
            
              <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button class="btn" ID="add_sport" runat="server" Text="Add" 
                           onclick="add_sport_Click" />
                          
                    </div>
                </div>
               
                </div>
                <div class="row">
                  <asp:Label style="margin-left:20px;" ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="row">
                <asp:Panel ID="pnlView" style="overflow-x:hidden; overflow-y:scroll;" Height="400px" runat="server">
                        
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                SportName
                            </th>
                            <th>
                               Total Quantity
                            </th>
                            <th>
                               Availbe Quantity
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
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"sporteqid") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "eq_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "t_quantity")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "a_quantity")%>
                        </td> 
                        <td align="center" >
                            <a href="sport_eq.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"sporteqid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"sporteqid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
              <h2>Event Equipment</h2>
        <fieldset>
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Event Name</label>
              
                <div class="controls">
                    <asp:DropDownList ID="dp_ev_name" runat="server">
                    </asp:DropDownList>
                  
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Quantity</label>
                <div class="controls">
                  <asp:TextBox ID="tx_ev_quantity" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
                
              
            </div>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Sport Name</label>
              
                <div class="controls">
                    <asp:DropDownList ID="dp_ev_spname" runat="server">
                    </asp:DropDownList>
                </div>
              </div>
              </div>
            <asp:Panel ID="pnl_ev_retn" Visible="false"  runat="server">
               <div class="span4">
               <div class="control-group">
                <label class="control-label">Returns</label>
                <div class="controls">
                    <asp:DropDownList ID="dp_ev_return" runat="server">

                    
                    <asp:ListItem>No</asp:ListItem>
                    <asp:ListItem>Yes</asp:ListItem>
                    </asp:DropDownList>
                </div>
              </div>
              </div>
                </asp:Panel>
            </div>
            
              <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button class="btn" ID="ev_btn" runat="server" Text="Add" onclick="ev_btn_Click" 
                            />
                          
                    </div>
                </div>
                </div>
             <div class="row">
                 <asp:Label style="margin-left:20px;" ID="lbl_ev" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="row">
                <asp:Panel ID="Panel1" Height="400px"  style="overflow-x:hidden; overflow-y:scroll;" runat="server">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rpt_event" runat="server" OnItemCommand="rptr_event_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Event Name
                            </th>
                            <th>
                                Event Date
                            </th>
                            <th>
                                Sport Name
                            </th>
                            <th>
                               Quantity
                            </th>
                            <th>
                                Return
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
                         <asp:HiddenField runat="server" ID="hd_stdid" Value='<%# DataBinder.Eval(Container.DataItem,"eventeqid") %>' />
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "e_name")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "edate")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "eq_name")%>
                        </td> 
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "quantity")%>
                        </td>
                        <td align="center">
                            <%# DataBinder.Eval(Container.DataItem, "sp_return")%>
                        </td>
                        <td align="center" >
                            <a href="sport_eq.aspx?action=ev_update&EID=<%# DataBinder.Eval(Container.DataItem,"eventeqid") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"eventeqid") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
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
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
