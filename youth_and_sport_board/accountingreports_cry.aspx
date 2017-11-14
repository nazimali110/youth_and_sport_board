<%@ Page Title="" Language="C#" MasterPageFile="~/header_footer.Master" AutoEventWireup="true" CodeBehind="accountingreports_cry.aspx.cs" Inherits="youth_and_sport_board.accountingreports_cry" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="body">
  
              
             <CR:CrystalReportViewer  ID="CrystalReportViewer1" style="width:982; margin-left:-20px; min-width:200px;"
        EnableDatabaseLogonPrompt="false"  runat="server" AutoDataBind="true" 
        ReportSourceID="CrystalReportSource1" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="reports/trialblance.rpt">
        </Report>
    </CR:CrystalReportSource>

           
     
    <div class="clr"></div>
  </div>
</asp:Content>
