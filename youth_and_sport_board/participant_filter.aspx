<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="participant_filter.aspx.cs" Inherits="youth_and_sport_board.participant_filter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
    <div class="body_resize">
      <div class="Welcome">
        <h2>Participant Report</h2>
        <fieldset>
         
          <br />
            <div class="row">
            <div class="span4">
              <div class="control-group">
                <label class="control-label">Search Name</label>
              
                <div class="controls">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Gender</label>
                <div class="controls">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>
              </div>
              </div>
              <div class="span4">
               <div class="control-group">
                <label class="control-label">Contect type</label>
                <div class="controls">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem>Mobile</asp:ListItem>
                    <asp:ListItem>Landline</asp:ListItem>
                    <asp:ListItem>Fax</asp:ListItem>
                    </asp:DropDownList>
                </div>
              </div>
              </div>
              
              
            </div>
            <div class="row">
           <div class="control-group">
    <legend style="margin-left:38px;">Web Pages</legend>
    <div class="controls span2">
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox1" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox2" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox3" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox4" Text="Cricket" runat="server" />
           
        </label>
        
    </div>
    <div class="controls span2">
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox5" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox6" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox7" Text="Cricket" runat="server" />
           
        </label>
        <label class="checkbox">
            <asp:CheckBox ID="CheckBox8" Text="Cricket" runat="server" />
           
        </label>
        
    </div>
    
</div>
              
            </div>
            
            <div class="span1">
                   <div class="control-group">
                 <button class="btn" style="margin-top:25px" type="button">Done</button>
                    </div>
                </div>

                <table class="table table-striped">  
        <thead>  
          <tr>  
            <th>First Name</th>  
            <th>Milde Name</th>  
            <th>Last Name</th>
            <th>Email</th>
            <th>Contact no.</th>
            <th>Dob</th>
            <th>Address</th>
            <th>Gender</th>
            <th>Edit</th>  
            <th>Delete</th>  
          </tr>  
        </thead>  
        <tbody>  
          <tr>    
            <td>Nazim</td>
            <td>Nizar</td>
            <td>Ali</td>
            <td>ads@gmail.com</td>  
            <td>3443322</td>
            <td>17/04/1990</td>
            <td>flat:15</td>
            <td>Male</td>
            
            <td><a style="float:none;" href="#" title="edit" >Edit</a> </td>  
            <td><a style="float:none;" href="#" title="delete" >Delete</a></td>  
          </tr> 
       
          
        </tbody>  
      </table>  

            </fieldset>
        <p>&nbsp;</p>
      </div>
      
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
</asp:Content>
