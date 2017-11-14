<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="generaljournal.aspx.cs" Inherits="youth_and_sport_board.generaljournal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>General Journal</h2>
        
        <fieldset>
         
          <br />
          

            
            
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"  >
           <ContentTemplate>
           <div class="row">
            <div class="span4">

              <div class="control-group">
                <label class="control-label">Dr Account</label>
              
                <div class="controls" id="name">
                    <asp:DropDownList ID="dp_dr_account" runat="server">

                    </asp:DropDownList>
                  
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_org_name" Width="140"></asp:RequiredFieldValidator>--%>

                </div>
              </div>
              </div>
            
              <div class="span4">

              <div class="control-group">
                <label class="control-label">Debit Amount</label>
              
                <div class="controls" id="Div1">
                    <asp:TextBox ID="tx_dr_Amount" runat="server"></asp:TextBox>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="dr_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_dr_Amount" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="tx_dr_Amount"
                     ErrorMessage="Enter Numbers only" SetFocusOnError="True" ValidationExpression="[0-9]*\.?[0-9]*"
                    ValidationGroup="dr_add"></asp:RegularExpressionValidator>
                       <br /><br />
                         <asp:Button ID="btn_dr_addre"  class="btn"  runat="server" ValidationGroup="dr_add" Text="Add More" onclick="btn_dr_addre_Click" 
                            />
                       <asp:Button class="btn" ID="btn_dr_del" runat="server" 
                           Text="delete" onclick="btn_dr_del_Click" />
                         
                    <asp:ListBox ID="list_dr_detail" SelectionMode="Multiple" runat="server">
                    
                    </asp:ListBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="gj_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_dr_detail" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>
                      <asp:PlaceHolder runat="server" id="PlaceHolder1" />
                      
                </div>
              </div>
              </div>
              
            </div>
           <div class="row">
                    
                       <%-- <asp:Label ID="dp_update_box" runat="server" Text="Label"></asp:Label>--%>
                 <div class="span4">
               <div class="control-group">
                   
                <label class="control-label">CR Account</label>
                
                <div class="controls">
                 <asp:DropDownList ID="dp_cr_account" runat="server">

                    </asp:DropDownList>
                     
                       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vg_address" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_address" Width="140"></asp:RequiredFieldValidator>--%>
                    
                </div>
              </div>
              </div>       
                        
                        
              <div class="span4">
               <div class="control-group">
                   
                <label class="control-label">CR Amount</label>
                <div class="controls">

                      <asp:TextBox ID="tx_cr_amount" ValidationGroup="vg_con" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="cr_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_cr_amount" Width="140"></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" Display="Dynamic" runat="server" ControlToValidate="tx_cr_amount"
                     ErrorMessage="Enter Numbers only" SetFocusOnError="True" ValidationExpression="[0-9]*\.?[0-9]*"
                    ValidationGroup="cr_add"></asp:RegularExpressionValidator>
                      <br /><br />
                      <asp:ScriptManager ID="ScriptManager1" runat="server">  
</asp:ScriptManager>
                   
                <asp:Button ID="list_cr_add" ValidationGroup="cr_add" class="btn"  runat="server" Text="Add More" 
                           onclick="list_cr_add_Click" />
                       <asp:Button class="btn" ID="list_cr_del" runat="server" 
                           Text="Delete" onclick="list_cr_del_Click" />

                    <asp:ListBox ID="list_cr_detail" SelectionMode="Multiple" runat="server">
                    
                    </asp:ListBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="gj_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_cr_detail" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vg_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_contact" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>--%>
                    
                      <asp:PlaceHolder runat="server" id="AssessCanvas" />
                      
                </div>
              </div>
              </div>
              
            
              
                  
              </div>
              </ContentTemplate>
                           </asp:UpdatePanel>
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Description</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_desc" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="gj_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_desc" Width="140"></asp:RequiredFieldValidator>
                </div>
              </div>
              </div>
              </div>
              <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                 
                       <asp:Button class="btn" ID="org_done" ValidationGroup="gj_add" runat="server" Text="Add" 
                           onclick="org_done_Click" />
                           
                    </div>
                </div>
                
                </div>
                <div class="row">
    <asp:Label ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>

</div>
                <div class="row">
                
               <%-- <asp:Panel ID="pnlView" runat="server">
    
     
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Organization Name
                            </th>
                            <th>
                                Address
                            </th>
                            <th>
                                Contact Numbers
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
                            <%# DataBinder.Eval(Container.DataItem, "oname")%>
                        </td>
                        <td align="center">
                              <asp:ListBox ID="ListBox2" 
                            DataSource='<%# DataBinder.Eval(Container.DataItem, "oaddress")%>'
                            DataValueField='ADDID'
                            DataTextField='Address' runat="server" Rows="3">
                            </asp:ListBox>
                        </td>
                        <td align="center">
                            <asp:ListBox ID="dp_contact" Rows="3"  
                            DataSource='<%# DataBinder.Eval(Container.DataItem, "ocontact")%>'
                            DataValueField='contectid'
                            DataTextField='contactno' runat="server">
                            </asp:ListBox>
                        </td>
                        <td align="center" >
                            <a href="organization.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"id") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
                            <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                                OnClientClick="return confirm('Are you certain you want to delete this Category?');"
                                CommandArgument='<%# DataBinder.Eval(Container.DataItem,"id") %>'><img src="images/trash.png" alt="" title="" border="0" /></a></asp:LinkButton>
                               
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
        
    </asp:Panel>--%>
    </div>


            </fieldset>

         
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
