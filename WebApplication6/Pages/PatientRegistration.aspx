<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PatientRegistration.aspx.cs" Inherits="WebApplication6.Pages.PatientRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            height: 26px;
        }

        .auto-style7 {
            height: 26px;
            width: 88px;
        }

        .auto-style8 {
            width: 263px;
        }

        .auto-style9 {
            height: 26px;
            width: 263px;
        }
        .auto-style10 {
            width: 298px;
        }
        .auto-style11 {
            width: 485px;
        }
        .auto-style12 {
            height: 26px;
            width: 485px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: silver">
        <p>
            Please fill in the patients details.
        </p>
        <p>
            Remember to pay attention to the details.
        </p>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table style="margin: 0 auto; text-align: center;">
        <tr>
            <td>Name:*</td>
            <td style="text-align: left;" class="auto-style11">
                <asp:TextBox ID="name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Field cannot be left empty" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="text-align: left;">&nbsp;</td>
        </tr>
        <tr>
            <td>Address:*</td>
            <td style="text-align: left;" class="auto-style11">
                <asp:TextBox ID="address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Field cannot be left empty" ControlToValidate="address" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="text-align: left;">&nbsp;</td>
        </tr>
        <tr>
            <td>Date of Birth:* </td>
            <td class="auto-style11">
                <table style="width: 77%; height: 77px;">
                    <tr>
                        <td class="auto-style6">Day:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="DayBox2" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style10">
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="DayBox2" ErrorMessage="Invalid Day" MaximumValue="30" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Day Required" ControlToValidate="DayBox2" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Month:</td>
                        <td>
                            <asp:TextBox ID="MonthBox2" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style10">
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="MonthBox2" ErrorMessage="Invalid Month" MaximumValue="12" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Month Required" ControlToValidate="MonthBox2" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Year:</td>
                        <td>
                            <asp:TextBox ID="YearBox2" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style10">
                            <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="YearBox2" ErrorMessage="Year Required" MaximumValue="3000" MinimumValue="1900" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Year Required" ControlToValidate="YearBox2" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: left;">&nbsp;</td>
        </tr>
        <tr>
            <td>Phone:* </td>
            <td style="text-align: left;" class="auto-style11">
                <asp:TextBox ID="phone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Field cannot be left empty" ControlToValidate="phone" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td style="text-align: left;">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">Emergency Contact: </td>
            <td style="text-align: left;" class="auto-style12">
                <asp:TextBox ID="emergency" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left;" class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td>Date of Registration:*
            </td>
            <td class="auto-style11">
                <table style="width: 77%; height: 77px;">
                    <tr>
                        <td class="auto-style6">Day:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="DayBox" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style9">
                            <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="DayBox" ErrorMessage="Invalid Day" MaximumValue="30" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Day Required" ControlToValidate="DayBox" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Month:</td>
                        <td>
                            <asp:TextBox ID="MonthBox" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Month Required" ControlToValidate="MonthBox" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="MonthBox" ErrorMessage="Invalid Month" MaximumValue="12" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Year:</td>
                        <td>
                            <asp:TextBox ID="YearBox" runat="server" Style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Year Required" ControlToValidate="YearBox" Display="Static" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="YearBox" ErrorMessage="Year Required" MaximumValue="3000" MinimumValue="1900" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                        </td>
                    </tr>
                </table>

            </td>

            <td></td>

        </tr>
        <tr>
            <td style="text-align: left;">
                <asp:TextBox ID="idBox" runat="server"  type="hidden"></asp:TextBox>
            </td>
            <td style="text-align: left;" class="auto-style11">
                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" style="text-align: center"></asp:Label>
            </td>
            <td style="text-align: left;">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
