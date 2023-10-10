<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="email"], input[type="number"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	margin-left: 2%;
	padding: 15px;
}
.form-container {
	max-width: 100%;
	margin: 0 auto;
	padding: 0 2%;
}
body {
    text-align: center;
  }
</style>
</head>
<body>
    <div class="header">
        <a href="#default" class="logo"><img class="logo" src="Logo1.png"></a>
        <div class="header-right">
            <a class="active" href="index.jsp">Home</a> 
            <a href="adminLogin.jsp">Admin Login</a>
        </div>
    </div>
    <div class="container">
        <img src="img1.jpg">
    </div>
    <br>
    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
    <div class="message">Form Submitted Successfully</div>
    <%
    }
    if ("invalid".equals(msg)) {
    %>
    <div class="error-message">Invalid Data! Try Again!</div>
    <%
    }
    %>
    <div class="form-container">
        <h1>Enter your details to request for blood</h1>
        <form action="Index" method="post">
            <input type="text" name="name" placeholder="Enter Your Name" required>
            <input type="number" name="mobilenumber" placeholder="Enter Your Mobile Number" required>
            <input type="email" name="email" placeholder="Enter Your Email Address" required>
            <input type="text" name="bloodgroup" placeholder="Enter Your Blood Group" required>
            <button class="button1">
                <span>Submit</span>
            </button>
        </form>
    </div>
    <br>
    <br>
</body>
</html>
