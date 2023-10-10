<%@include file="header.html"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,
	input[type="number"] {
	border: none;
	background: silver;
	height: 50px;
	font-size: 16px;
	padding: 15px;
	width: 60%;
	border-radius: 25px;
	margin-left: 20%;
}

.container button {
	margin-left: 20%;
	margin-top: 1%;
}

h2 {
	margin-left: 20%;
}

hr {
	width: 60%;
}
</style>
</head>
<body>
	<%
String id=request.getParameter("id");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con= DriverManager.getConnection ("jdbc:mysql://localhost:3306/bloodbank","root","");
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select * from donor where id='"+id+"'");
		while(rs.next())
		{
%>
	<div class="container">
		<form action="UpdateDonor" method="post">
			<input type="hidden" value="<%out.println(id);%>" name="id">
			<h2>Name</h2>
			<input type="text" value="<%=rs.getString(2)%>" name="name">
			<hr>
			<h2>Father Name</h2>
			<input type="text" value="<%=rs.getString(3)%>" name="father">
			<hr>
			<h2>Mother Name</h2>
			<input type="text" value="<%=rs.getString(4)%>" name="mother">
			<hr>
			<h2>Mobile Number</h2>
			<input type="number" value="<%=rs.getString(6)%>" name="mobilenumber">
			<hr>
			<h2>Email</h2>
			<input type="email" value="<%=rs.getString(7)%>" name="email">
			<hr>
			<h2>Address</h2>
			<input type="text" value="<%=rs.getString(8)%>" name="address">
			<hr>
			<button type="sumbit" class="button">Save</button>
		</form>
	</div>
		<%
		}
		}
	catch(Exception e)
	{
		System.out.println(e);
	}	
	%>
	<br>
	<br>
</body>
</html>