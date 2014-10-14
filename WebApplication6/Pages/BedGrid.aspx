<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BedGrid.aspx.cs" Inherits="WebApplication6.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <p style="text-align:left;"><b>Available Beds</b></p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateSelectButton ="true"
        CellPadding="3" Height="302px" style="margin-left: 0px" Width="372px">
    </asp:GridView>
    <br />
    <p style="text-align:left;"><b>All Beds</b></p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton ="true"
        CellPadding="3" Height="302px" style="margin-left: 0px" Width="372px">
    </asp:GridView>
</asp:Content>
