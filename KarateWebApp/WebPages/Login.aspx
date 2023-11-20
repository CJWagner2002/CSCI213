<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KarateWebApp.WebPages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />

    <title>Karate Web Page</title>
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
    </style>

</head>
<body>

    <form style="max-width: 256px; margin: auto; margin-top: 60px;" runat="server">
        <div class="text-center">
            <img src="../Images/image.jpg" height="128" alt="karate logo" />
        </div>
        <h2 class="h3 mb-3 fornt-weight-normal text-center">Please log in</h2>

        <div class="mb-3">
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="userameTextBox" CssClass="form-control" placeholder="john.doe" runat="server"></asp:TextBox>
        </div>

        <div class="mb-3">
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="passwordTextBox" placeholder="********" TextMode="Password" class="form-control" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-block w-100 btn-primary" OnClick="Button1_Click"/>
        </div>
    </form>

    <!-- Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

</body>
</html>
