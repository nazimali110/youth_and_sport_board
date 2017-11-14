<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="organization.aspx.cs" Inherits="youth_and_sport_board.organization1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Orgnization Registration</h2>
        
        <fieldset>
         
          <br />
          

            <div class="row">
            <div class="span4">

              <div class="control-group">
                <label class="control-label">Name</label>
              
                <div class="controls" id="name">
                    <asp:TextBox ID="tx_org_name" runat="server"></asp:TextBox>
                  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_org_name" Width="140"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="tx_org_name" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />

                </div>
              </div>
              </div>
            
              
              
            </div>
            <div class="row">
           <asp:UpdatePanel ID="UpdatePanel1" runat="server"  >
                    <ContentTemplate>
                       <%-- <asp:Label ID="dp_update_box" runat="server" Text="Label"></asp:Label>--%>
                 <div class="span4">
               <div class="control-group">
                   
                <label class="control-label">Address</label>
                
                <div class="controls">

                      <asp:TextBox ID="tx_address" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="vg_address" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_address" Width="140"></asp:RequiredFieldValidator>
                      <br /><br />
                         <asp:Button ID="btn_add_addre" ValidationGroup="vg_address" class="btn"  runat="server" Text="Add More" onclick="btn_add_addre_Click" 
                            />
                       <asp:Button class="btn" ID="btn_add_del" runat="server" 
                           Text="delete" onclick="btn_add_del_Click" />
                         
                    <asp:ListBox ID="list_address" SelectionMode="Multiple" runat="server">
                    
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vg_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_address" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>
                      <asp:PlaceHolder runat="server" id="PlaceHolder1" />
                      
                </div>
              </div>
              </div>       
                        
                        
              <div class="span4">
               <div class="control-group">
                   
                <label class="control-label">Contact No.</label>
                <div class="controls">

                      <asp:TextBox ID="con1" ValidationGroup="vg_con" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="vg_con" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="con1" Width="140"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ControlToValidate="con1"
                     ErrorMessage="Enter Numbers only (11 digits)" SetFocusOnError="True" ValidationExpression="^[ ()+]*([0-9][ ()+]*){11}$"
                    ValidationGroup="vg_con"></asp:RegularExpressionValidator>
                      <br /><br />
                      <asp:ScriptManager ID="ScriptManager1" runat="server">  
</asp:ScriptManager>
                   
                <asp:Button ID="org_add_contact" ValidationGroup="vg_con" class="btn"  runat="server" Text="Add More" 
                           onclick="org_add_contact_Click" />
                       <asp:Button class="btn" ID="org_del_contact" runat="server" 
                           Text="Delete" onclick="org_del_contact_Click" />

                    <asp:ListBox ID="list_contact" SelectionMode="Multiple" runat="server">
                    
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="vg_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="list_contact" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>
                    
                      <asp:PlaceHolder runat="server" id="AssessCanvas" />
                      
                </div>
              </div>
              </div>
              
            
              
                  </ContentTemplate>
                           </asp:UpdatePanel>
              </div>
            <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                 
                       <asp:Button class="btn" ID="org_done" ValidationGroup="vg_add" runat="server" Text="Add" 
                           onclick="org_done_Click" />
                         
                    </div>
                </div>
                </div>
                <div class="row">
        <asp:Label  ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>

</div>
                <div class="row">
                
                <asp:Panel ID="pnlView" runat="server">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
    
     
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

