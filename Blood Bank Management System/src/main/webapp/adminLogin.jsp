<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"] {
    border: none;
    background: silver;
    height: 50px;
    font-size: 16px;
    padding: 15px;
    width: 100%;
    border-radius: 25px;
    margin-bottom: 20px;
}
.form-group {
    margin-left: 35%;
    width: 30%;
    text-align: center;
    margin-top: 50px;
}
 body {
    text-align: center;
  }

h1 {
    color: black;
}
</style>
</head>
<body>
    <div class="header">
        <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
        <div class="header-right">
            <a href="index.jsp">Home</a> <a class="active" href="adminLogin.jsp">AdminLogin</a>
        </div>
    </div>
        <%
        String msg = request.getParameter("msg");
        if ("invalid".equals(msg)) {
        %>
        <div class="error-message">Invalid Username and Password</div>
        <%
        }
        %>
        <form action="Admin" method="post">
            <div class="form-group">
                <h1>Username</h1>
                <input type="text" name="username" placeholder="Enter Username" required>
                <h1>Password</h1>
                <input type="password" name="password" placeholder="Enter Password" required>
                <button type="submit" class="button">Login</button>
            </div>
        </form>
      </body>
</html>
