<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PatientGrid.aspx.cs" Inherits="WebApplication6.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div margin-left:"12px">
        <table runat="server" style="background: silver; height:77px; width:119px; margin: 0 auto" >
            <tr>
                <td>
                    <p>Filter table by patient name.</p>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="1">
                    <asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="265px" Width="359px" CellPadding="3"
        AutoGenerateSelectButton="true" AutoGenerateColumns="false" >
        <Columns>
            <asp:boundfield datafield="id" HeaderText="ID" />
            <asp:boundfield datafield="Name" HeaderText="Name"/>
            <asp:boundfield datafield="Adress" HeaderText="Address"/>
            <asp:boundfield datafield="DateOfBirth" HeaderText="D.O.B." dataformatstring="{0:MM/dd/yyyy}" />
            <asp:boundfield datafield="Phone" HeaderText="Phone"/>
            <asp:boundfield datafield="EmergencyContact" HeaderText="Emergency Contact"/>
            <asp:boundfield datafield="DateOfRegistration" HeaderText="Registration Date" dataformatstring="{0:MM/dd/yyyy}" />
        </Columns>
    </asp:GridView>


</asp:Content>
