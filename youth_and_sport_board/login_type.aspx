<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="login_type.aspx.cs" Inherits="youth_and_sport_board.login_type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Login Type</h2>
        <fieldset>
            <legend style="margin-left:38px; width:90%;">Current Login Types</legend>
            <asp:Panel  ID="Panel1" runat="server">
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Type Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="tx_logintype" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_logintype" Width="140"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"     
                                    ErrorMessage="Alphabetes only max(40)ch" 
                                    ValidationGroup="vd_add"
                                    ControlToValidate="tx_logintype" 
                                    Display="Dynamic"  
                                    ForeColor="Red"  
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" />
                </div>
              </div>
              </div>
              
              
              
            </div>
            <div class="row">
           <div class="control-group">
    <legend style="margin-left:38px;">Web Pages</legend>
    <div class="controls span2">
    
       
       
        <div class="checkbox" style="width:165px;">
     
          
        <asp:CheckBoxList ID="ck_web_page" runat="server">
        
            </asp:CheckBoxList>
            
                    
           
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vg_add" runat="server" ErrorMessage="Atleast one value is required"
                     ForeColor="Red" ControlToValidate="ck_web_page" Display="Dynamic" Width="140"></asp:RequiredFieldValidator>--%>

        <%--
                     <asp:CheckBox ID="CheckBox1" ValidationGroup="vg_add" runat="server" Text="Check Box"  />
<asp:CustomValidator ID="Custom1" ClientValidationFunction="CheckBoxValidation" runat="server"
                ErrorMessage="Please fill TextBox" >* </asp:CustomValidator>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>



    <script language="javascript" type="text/javascript">
        function CheckBoxValidation(oSrouce, args) {
            var myCheckBox = document.getElementById('<%= CheckBox1.ClientID %>');
            var myTextBox = document.getElementById('<%= TextBox1.ClientID %>');
            if (myCheckBox.checked) {


                if (myTextBox.value = "")
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }


        }
</script>--%>

                      
        </div>
     
      
    </div>
       
    
</div>
    
            </div>
            <div class="row">
            <div class="span1 offset8">
                   <div class="control-group">
                       <asp:Button class="btn" ID="login_ty_done" ValidationGroup="vd_add" runat="server" Text="Add" 
                           onclick="login_ty_done_Click" />
                      
                    </div>
                </div>
                

                </div>
                <div class="row">
      <asp:Label ID="lbl" style="margin-left:158px" runat="server" Text=""></asp:Label>        

</div>

            </asp:Panel>
          
            <div class="row">
                <asp:Panel ID="pnlView" runat="server">
      <%--<table border="0" cellpadding="0" cellspacing="0" id="rounded-corner">--%>
      <table class="table table-striped table-hover" style="margin-left:16px;">
            <asp:Repeater ID="rptr_view" runat="server" OnItemCommand="rptr_view_ItemCommand">
                <HeaderTemplate>
                    <thead>
                        <tr>
                            <th>
                                Type Name
                            </th>
                            <th>
                                Allow Pages
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
                            <%# DataBinder.Eval(Container.DataItem, "name")%>
                        </td>
                        <td>
                            <asp:ListBox ID="ListBox1" runat="server" Rows="3"
                            DataSource='<%# DataBinder.Eval(Container.DataItem, "PageName")%>' 
                                DataTextField='pagename' 
                                DataValueField='pageid'>

                            </asp:ListBox>
                          <%--  <asp:DropDownList ID="DropDownList1" runat="server"> 
                                
                            
                            </asp:DropDownList>--%>
                        </td>
                        <td align="center" >
                            <a href="login_type.aspx?action=update&EID=<%# DataBinder.Eval(Container.DataItem,"id") %>" title="Update"><img src="images/user_edit.png" alt="" title="" border="0" /></a>
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
        <asp:Label style="margin-left:20px;" ID="lbl_error" runat="server" ForeColor="Red"></asp:Label>
    </asp:Panel>
    </div>
               
                
                
                </div>
            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
