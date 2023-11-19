<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KarateWebApp.WebPages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <title></title>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>

    <div class="text-center mt-5">
<form style ="max-width:256px;margin:auto;">
    <img src="../Images/image.jpg" height="128" alt = "karate logo">
    <h2><class = "h3 mb-3 fornt-weight-normal"></class>Please log in</h2>

    <lable for ="UserName" class="sr-only">User Name</lable>
      <input type="UserName" id="UserName" class="form-control mb-3" placeholder ="User Name" class="form-control">

    <lable for "UserPassword" class ="sr-only"> Password</lable>
        <input type ="UserPassword" id ="UserPassword" placeholder ="Password" class="form-control"><script src="../Scripts/bootstrap.bundle.js"></script>
    
    <div class ="mt-3">
        <button class="mb-3 btn btn-lg btn-primary btn-block">Log In</button>
    </div>


    <!-- Separate Popper and Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>

</body>
</html>