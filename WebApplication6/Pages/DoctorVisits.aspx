<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DoctorVisits.aspx.cs" Inherits="WebApplication6.Pages.DoctorVisits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Select" runat="server" Style="background-color: silver">
        <br />
        <asp:Label ID="Label1" runat="server" Text="Select doctor to see all his patients."></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="true">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Panel ID="SlctPatPnl" runat="server" Style="background-color: silver; width: inherit; border-top: 1px solid black" Visible="false">
            <br />
            <asp:Label ID="Label2" runat="server" Text="Select a patient to create visit with this doctor."></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="False" AppendDataBoundItems="true">
            </asp:DropDownList>
            <asp:Button ID="CreateVisit" runat="server" OnClick="DisplayCreateVisit_Click" Text="Create Visit" />
            <br />
            <br />
        </asp:Panel>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="PnlForGrdVw" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5">
                <Columns>
                    <asp:BoundField DataField="DoctorId" HeaderText="Doctor Id" />
                    <asp:BoundField DataField="PatientId" HeaderText="Patient Id" />
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
                    <asp:BoundField DataField="BedId" HeaderText="BedId" />
                    <asp:BoundField DataField="DateOfVisit" HeaderText="Start Of Visit" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="DateOfDischarge" HeaderText="Discharge Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Symptoms" HeaderText="Symptoms" />
                    <asp:BoundField DataField="Disease" HeaderText="Disease" />
                    <asp:BoundField DataField="Treatment" HeaderText="Treatment" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Panel ID="CreateVisitPanel" runat="server" Visible="false">
        <asp:Table ID="Table1" runat="server" Width="240px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label5" runat="server" Text="Patient Type"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:RadioButtonList ID="PatientType" runat="server" AutoPostBack="false">
                        <asp:ListItem Selected="True" Text="In" Value="0" />
                        <asp:ListItem Text="Out" Value="1" />
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label7" runat="server" Text="Bed Type"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:DropDownList ID="BedType" runat="server" AutoPostBack="False" AppendDataBoundItems="false">
                    </asp:DropDownList>
                    <asp:Label ID="BedError" runat="server" Text="" ForeColor="Red"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label6" runat="server" Text="Symptoms"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="Symptoms" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Disease"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="Disease" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                    <asp:Label ID="Label4" runat="server" Text="Treatment"></asp:Label>
                </asp:TableCell>
                <asp:TableCell runat="server">
                    <asp:TextBox ID="Treatment" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Button ID="Button1" runat="server" Text="Create Visit" OnClick="CreateVisit_Click" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>       
    </asp:Panel>
    <asp:Panel ID="SuccessPanel" runat="server">
        <asp:Label ID="Success" runat="server"></asp:Label>
    </asp:Panel>
</asp:Content>
