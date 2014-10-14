<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WebApplication6.Pages.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 25px; border-right: 2px solid black; background-color: silver">
    <h2>
        Message from the Director:</h2>
        <p>
                        <asp:Image ID="Image1" runat="server" Height="72px" style="margin-left: 0px; margin-right: 20px; margin-top: 20px; margin-left: 20px; float:left;" Width="107px" ImageUrl="~/Images/CEO.jpg" />
                        </p>
    <p>
        We are delighted to have you as our staff and to be able to bring to you the latest and greatest in technology. 
        Starting with this awesome website. If you have any complaints send them to management who will joyfully deal with them.</p>
    <p>
        Thank you.</p>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="text-align:left; font-size: 1.5em">
    <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Circle">
        <asp:ListItem>This is our hospital, our sweat and tears. Treat is as such!</asp:ListItem>
        <asp:ListItem>Everything we do is for the patients and only the patients!</asp:ListItem>
        <asp:ListItem>Cleanliness == health, make it a priority!</asp:ListItem>
        <asp:ListItem>Be HAPPY, be MERRY and ENJOY the work :) !!!</asp:ListItem>
    </asp:BulletedList>
        </div>
</asp:Content>
