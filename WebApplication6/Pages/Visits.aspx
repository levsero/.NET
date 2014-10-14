<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Visits.aspx.cs" Inherits="WebApplication6.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            height: 23px;
            width: 74px;
        }
        .auto-style8 {
            width: 74px;
        }
        .auto-style9 {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background: silver;">
    <table style="width: 100%; margin: 0 auto; text-align:center">
    <tr>
        <td style="margin-left: 40px">
            Filter the visits here:<br />
            It will filter by all filled sections. </td>
    </tr>
    <tr>
        <td style="margin-left: 40px">
            <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
            :<br/>
            <asp:TextBox ID="NameBox" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style9">
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label2" runat="server" Text="Date of Visit"></asp:Label>
            :<br/>
            <table style="width:100%; height: 77px;">
                <tr>
                    <td class="auto-style6">Day</td>
                    <td class="auto-style7">Month</td>
                    <td class="auto-style6">Year</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="DayBox" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="MonthBox" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RangeValidator ID="RangeValidator3" runat="server"  ControlToValidate="DayBox" ErrorMessage="Invalid Day"
                             MaximumValue="30" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td class="auto-style8">
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="MonthBox" ErrorMessage="Invalid Month"
                             MaximumValue="12" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid Year"
                             MaximumValue="3000" MinimumValue="1900" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
        <tr>
            <td>

                Date of Discharge:</td>
        </tr>
    <tr>
        <td>
            <table style="width:100%; height: 77px;">
                <tr>
                    <td class="auto-style6">Day</td>
                    <td class="auto-style7">Month</td>
                    <td class="auto-style6">Year</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="DayBox2" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="MonthBox2" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="YearBox2" runat="server" style="margin-bottom: 4px" Width="59px" Height="16px"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RangeValidator ID="RangeValidator4" runat="server"  ControlToValidate="DayBox2" ErrorMessage="Invalid Day"
                             MaximumValue="30" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td class="auto-style8">
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="MonthBox2" ErrorMessage="Invalid Month"
                             MaximumValue="12" MinimumValue="01" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="YearBox2" ErrorMessage="Invalid Year"
                             MaximumValue="3000" MinimumValue="1900" ForeColor="Red" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" />
        </td>
    </tr>
</table>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="height: 600px; overflow: scroll; ">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5">
        <Columns>
            <asp:boundfield datafield="PatientType" HeaderText="PatientType" DataFormatString=""/>
            <asp:boundfield datafield="DoctorId" HeaderText="Doctor Id"/>
            <asp:boundfield datafield="PatientId" HeaderText="Patient Id"/>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label runat="server" ID="TypeLabel" OnDataBinding="TypeLabel_DataBinding2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <ItemTemplate>
                    <asp:Label runat="server" ID="TypeLabel" OnDataBinding="TypeLabel_DataBinding"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:boundfield datafield="BedId" HeaderText="BedId"/>
            <asp:boundfield datafield="DateOfVisit" HeaderText="Start Of Visit" dataformatstring="{0:dd/MM/yyyy}" />   
            <asp:boundfield datafield="DateOfDischarge" HeaderText="Discharge Date" dataformatstring="{0:dd/MM/yyyy}" />         
            <asp:boundfield datafield="Symptoms" HeaderText="Symptoms"/>
            <asp:boundfield datafield="Disease" HeaderText="Disease"/>
            <asp:boundfield datafield="Treatment" HeaderText="Treatment"/>            
        </Columns>
</asp:GridView>
        </div>
</asp:Content>
