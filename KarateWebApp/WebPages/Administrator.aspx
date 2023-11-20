<%@ Page Title="" Language="C#" MasterPageFile="~/WebPages/Roles.Master" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="KarateWebApp.WebPages.Administrator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function ($) {
            // alert('a');
            $("#ContentPlaceHolder1_userTypeDDL").val("Member");
            $("#ContentPlaceHolder1_userTypeDDL").change(function () {
                // alert('check');
                switch ($(this).val()) {
                    case "Member":
                        $("#ContentPlaceHolder1_dateJoinedLabel").show();
                        $("#ContentPlaceHolder1_dateJoinedCalendar").show();
                        $("#ContentPlaceHolder1_emailLabel").show();
                        $("#ContentPlaceHolder1_emailTextBox").show();
                        break;
                    case "Instructor":
                        $("#ContentPlaceHolder1_dateJoinedLabel").hide();
                        $("#ContentPlaceHolder1_dateJoinedCalendar").hide();
                        $("#ContentPlaceHolder1_emailLabel").hide();
                        $("#ContentPlaceHolder1_emailTextBox").hide();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex flex-row justify-content-center">
        <!-- TABLE COLUMN -->
        <div class="d-flex flex-column justify-content-center">
            <!-- MEMBERS TABLE -->
            <div class="p-2">
                <h3 class="text-center">Members</h3>
                <div class="d-flex flex-row justify-content-center">

                    <div class="mx-3">
                        <asp:GridView ID="memberGridView" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="600px" OnRowDeleting="memberGridView_RowDeleting">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                            </Columns>
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
                    </div>
                </div>
            </div>

            <!-- INSTRUCTORS TABLE -->
            <div class="p-2">
                <h3 class="text-center">Instructors</h3>
                <div class="d-flex flex-row justify-content-center">
                    <asp:GridView ID="instructorGridView" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="300px" OnRowDeleting="instructorGridView_RowDeleting">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" />
                        </Columns>
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
                </div>
            </div>
        </div>

        <!-- INSERT FORM COLUMN -->
        <div>
            <div class="p-2">
                <div class="d-flex flex-column justify-content-center">

                    <h4 class="text-center">Insert User</h4>

                    <hr class="hr" />

                    <asp:DropDownList CssClass="mb-2" ID="userTypeDDL" runat="server">
                        <asp:ListItem>Member</asp:ListItem>
                        <asp:ListItem>Instructor</asp:ListItem>
                    </asp:DropDownList>

                    <asp:Label ID="usernameLabel" Text="Username:" AssociatedControlID="usernameTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="usernameTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Label ID="passwordLabel" Text="Password:" AssociatedControlID="passwordTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="passwordTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Label ID="firstNameLabel" Text="First Name:" AssociatedControlID="firstNameTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="firstNameTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Label ID="lastNameLabel" Text="Last Name:" AssociatedControlID="lastNameTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="lastNameTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Label ID="dateJoinedLabel" Text="Date Joined:" AssociatedControlID="dateJoinedCalendar" runat="server"></asp:Label>
                    <asp:Calendar ID="dateJoinedCalendar" runat="server" CssClass="mb-2" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="145px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="209px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>

                    <asp:Label ID="phoneNumberLabel" Text="Phone #:" AssociatedControlID="phoneNumberTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="phoneNumberTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Label ID="emailLabel" Text="Email:" AssociatedControlID="emailTextBox" runat="server"></asp:Label>
                    <asp:TextBox ID="emailTextBox" runat="server" CssClass="mb-2"></asp:TextBox>

                    <asp:Button ID="insertButton" runat="server" Text="Submit" CssClass="btn btn-primary mt-2" OnClick="insertButton_Click" />

                    <asp:Label ID="statusLabel" runat="server"></asp:Label>

                </div>
            </div>
        </div>

        <!-- SECTION ASSIGNMENT COLUMN -->
        <div>
            <div class="d-flex flex-column justify-content-center p-2">
                <h4 class="text-center">Section Assignment</h4>

                <hr class="hr" />

                <asp:DropDownList CssClass="mb-2" ID="memberIDDDL" runat="server">
                </asp:DropDownList>
            </div>
        </div>

    </div>

</asp:Content>
