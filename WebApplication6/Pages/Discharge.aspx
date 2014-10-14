<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Discharge.aspx.cs" Inherits="WebApplication6.Pages.Discharge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
        });
        $(document).ready(function () {
            $('.cc-container').ccvalidate({
                onvalidate: function (isValid) {
                    if (!isValid) {
                        alert('Incorrect Credit Card format');
                        return false;
                    } else {
                        // presses the hidden discharge button
                        $("input[id$='DischargeButton']").click();
                    }
                }
            });
        });
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background-color: silver">
        <asp:Label ID="Instruction" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div id="Grid">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="true" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="5">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" />
                <asp:BoundField DataField="DoctorId" HeaderText="Doctor Id" />
                <asp:BoundField DataField="PatientId" HeaderText="Patient Id" />
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="TypeLabel" OnDataBinding="TypeLabel_DataBinding"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="BedId" HeaderText="BedId" />
                <asp:BoundField DataField="DateOfVisit" HeaderText="Start Of Visit" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Symptoms" HeaderText="Symptoms" />
                <asp:BoundField DataField="Disease" HeaderText="Disease" />
                <asp:BoundField DataField="Treatment" HeaderText="Treatment" />
            </Columns>
        </asp:GridView>
    </div>
    <div id="Price" runat="server" visible="false">
        <asp:Label ID="Success" runat="server" Text="Label"></asp:Label>
        <asp:Label ID="PriceLabel" runat="server" Text="Price"></asp:Label><br />
        <div id="cc-container" class="cc-container">
            <asp:DropDownList ID="ccTypes" class="cc-ddl-type" runat="server">
                <asp:ListItem Value="mcd">Master Card</asp:ListItem>
                <asp:ListItem Value="vis">Visa Card</asp:ListItem>
                <asp:ListItem Value="amx">American Express</asp:ListItem>
                <asp:ListItem Value="dnr">Dinner Club</asp:ListItem>
                <asp:ListItem Value="dis">Discover</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:TextBox ID="cardNUM" class="cc-card-number" runat="server"></asp:TextBox>
            <br />
            <input type="button" value="Checkout" class="cc-checkout" id="check-out" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="Cancel_Click" />            
        </div>
        <div>
            <asp:Button ID="DischargeButton" runat="server" Text="Discharge" OnClick="Discharge_Click" Visible="false"/>
        </div>
    </div>

</asp:Content>
