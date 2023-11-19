<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Roles.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateWebApp.WebPages.Administrator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 41px;
        }
        .auto-style3 {
            height: 41px;
            width: 161px;
        }
        .auto-style4 {
            width: 161px;
        }
        .auto-style5 {
            height: 41px;
            width: 371px;
        }
        .auto-style6 {
            width: 371px;
        }
        .auto-style7 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="memberGridView" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <asp:GridView ID="instructorGridView" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <br />
    <span class="auto-style7"><strong>Add New Member</strong></span><br />
    <table style="width:100%;">
        <tr>
            <td class="auto-style3">Member ID: </td>
            <td class="auto-style5">
                <asp:TextBox ID="idTxtBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td class="auto-style4">First Name: </td>
            <td class="auto-style6">
                <asp:TextBox ID="fnameTxtBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Last Name: </td>
            <td class="auto-style6">
                <asp:TextBox ID="lnameTxtBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Phone Number: </td>
            <td class="auto-style6">
                <asp:TextBox ID="phoneTxtBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Email: </td>
            <td class="auto-style6">
                <asp:TextBox ID="emailTxtBox" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Add New Member" />
            </td>
        </tr>
    </table>
    <br />
</asp:Content>
