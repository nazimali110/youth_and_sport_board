<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="youth_and_sport_board.login" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>home</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href="bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
<script type="text/javascript" charset="utf-8">
// <![CDATA[
    $(document).ready(function () {
        $("#slider").easySlider({
            controlsBefore: '<p id="controls">',
            controlsAfter: '</p>',
            auto: true,
            continuous: true
        });
    });
// ]]>
</script>
<style type="text/css">
#slider { margin:0; padding:1px; list-style:none; }
#slider ul,
#slider li { margin:0; padding:0; list-style:none; }
/* 
    define width and height of list item (slide)
    entire slider area will adjust according to the parameters provided here
*/
#slider li { width:943px; height:323px; overflow:hidden; }
p#controls { margin:0; position:relative; }
#prevBtn,
#nextBtn { display:block; margin:0; overflow:hidden; width:41px; height:41px; position:absolute; left: -50px; top:-178px; }
#nextBtn { left:965px; }
#prevBtn a { display:block; width:41px; height:41px; background:url(images/left_arrow.gif) no-repeat 0 0; }
#nextBtn a { display:block; width:41px; height:41px; background:url(images/right_arrow.gif) no-repeat 0 0; }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="main">
  <div class="header">
    <div class="block_header">
            <div class="logo"><p>Aga Khan Youth and Sport Board</p></div>
     <!-- <div style="float:right;">
        <div class="clr"></div>
        <div class="menu">
          <ul>
            <li><a href="index.html" class="active"><span>Welcome</span></a></li>                                
            <li><a href="about.html"><span>About us</span></a></li>
            <li><a href="portfolio.html"><span>Portfolio</span></a></li>
            <li><a href="contact.html"><span>Contact</span></a></li>
        </ul>
        </div>
      </div> -->
      <div class="clr"></div>
    </div>
  </div>
  <div class="body" style="height:425px">
    <div class="body_resize">
      <div class="Welcome" style="float:left; width:542px;">
        <h2> Welcome to our website</h2>
        <p> Fusce vehicula dignissim ligula. Vestibulum sit amet neque eu neque suscipit consequat quis vel risus. Vestibulum vehicula purus nec dui accumsan fermentum. Suspendisse potenti. Ut dapibus est id odio pretium blandit in eget leo. Aliquam erat volutpat. Curabitur blandit odio eget odio eleifend vel mattis augue convallis. Praesent fringilla, eros et tristique tempus, libero metus porttitor velit, at ultrices eros dolor placerat nunc. Fusce ac egestas ante.</p>
       
      </div>
      <div class="Box">
      <h2>Login</h2>
      <div class="form-horizontal" style="margin-left: -35px;">
  <div class="control-group">
    <label class="control-label" for="inputEmail">Email</label>
    <div class="controls">
        <asp:TextBox ID="tx_username" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_username" Width="140"></asp:RequiredFieldValidator>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="inputPassword">Password</label>
    <div class="controls">
      <asp:TextBox ID="tx_password" TextMode="Password" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="vd_add" Display="Dynamic" runat="server" ErrorMessage="This field is required"
                     ForeColor="Red" ControlToValidate="tx_password" Width="140"></asp:RequiredFieldValidator>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <label class="checkbox">
       <%-- <input type="checkbox"> Remember me--%>

      </label>
        <asp:Label ID="error" runat="server" Text=""></asp:Label><br />
        <asp:Button ID="login_open" ValidationGroup="vd_add" class="btn" runat="server" Text="Login In" 
            onclick="login_open_Click" />
    </div>
  </div>
</div>
      </div>
      <div class="clr"></div>
    </div>
    <div class="clr"></div>
  </div>
     
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:akysb_data_baseConnectionString %>" 
            SelectCommand="SELECT event_register.*, organization.* FROM organization INNER JOIN event_register ON organization.orgid = event_register.e_orgid">
        </asp:SqlDataSource>

<%--  
    <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" 
          AppointmentDataSourceID="SqlDataSource1" ClientIDMode="AutoID" 
          Start="2012-12-03">
          <Storage>
              <Appointments>
                  <Mappings AppointmentId="eventid" Description="e_description" End="e_eventdate" 
                      Start="e_currentdate" />
                  <%--<CustomFieldMappings>
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_amount" Name="EAmount" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_cataid" Name="ECataid" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_isaprove" 
                          Name="EIsaprove" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_location" 
                          Name="ELocation" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_loginid" Name="ELoginid" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_name" Name="EName" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_orgid" Name="EOrgid" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_orgpersonname" 
                          Name="EOrgpersonname" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="e_service" Name="EService" />
                      <dxwschs:ASPxAppointmentCustomFieldMapping Member="EventParticipationFee" 
                          Name="EventParticipationFee" />
                  </CustomFieldMappings>
              </Appointments>
          </Storage>
<Views>
<DayView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
</DayView>

<WorkWeekView><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>
</WorkWeekView>
</Views>

<ClientSideEvents MouseUp=""></ClientSideEvents>
      </dxwschs:ASPxScheduler>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:akysb_data_baseConnectionString %>" 
          SelectCommand="SELECT * FROM [event_register]"></asp:SqlDataSource>

    --%>
  
   <div class="footer">    
    <div class="resize">
      <p class="footer_logo">&nbsp;</p>
      <div>  <div style="padding:0 0 0 0; width:100%;">© Copyright 2012. <a href="#">Aga Khan Youth and Sport Board</a>. All Rights Reserved.Design and Developed by Nazim Ali
</div>
    </div>
    <p class="clr"></p>
  </div>
</div>
    </div>
    </form>
</body>
</html>
