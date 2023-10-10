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
	width: 100%;
	border-radius: 25px;
}

body {
	text-align: center;
}

.container {
	margin-left: 20%;
	width: 60%;
	text-align: left;
}

h2 {
	margin-left: 0;
	color: black;
}

hr {
	width: 100%;
}
</style>
</head>
<body>
	<%
	String msg = request.getParameter("msg");
	if ("valid".equals(msg)) {
	%>
	<div class="message">Updated Successfully</div>
	<%
	}
	if ("invalid".equals(msg)) {
	%>
	<div class="error-message">Please update the correct details and Try Again!</div>
	<%
	}
	int id = 1;
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select max(id) from donor");
	if (rs.first()) {
		id = rs.getInt(1);
		id = id + 1;
	}
	} catch (Exception e) {
	}
	%>
	<div class="container">
		<h1 style="color: red;">
			Donor ID:<%=id%></h1>
		<form action="NewDonor" method="post">
			<h2>Name</h2>
			<input type="text" name="name" placeholder="Enter Your Name" required>
			<hr>
			<h2>Father</h2>
			<input type="text" name="father" placeholder="Enter Your Father Name"
				required>
			<hr>
			<h2>Mother</h2>
			<input type="text" name="mother" placeholder="Enter Your Mother Name"
				required>
			<hr>
			<h2>Gender</h2>
			<select name="gender">
				<option value="Male">Male</option>
				<option value="Female">Female</option>
			</select>
			<hr>
			<h2>Mobile Number</h2>
			<input type="number" name="mobilenumber"
				placeholder="Enter Your Mobile Number" required>
			<hr>
			<h2>Email</h2>
			<input type="email" name="email" placeholder="Enter Your Email"
				required>
			<hr>
			<h2>Address</h2>
			<input type="text" name="address" placeholder="Enter Your Address"
				required>
			<hr>
			<h2>Blood Group</h2>
			<select name="bloodgroup">
				<option value="A+">A+</option>
				<option value="A-">A-</option>
				<option value="B+">B+</option>
				<option value="B-">B-</option>
				<option value="O+">O+</option>
				<option value="O-">O-</option>
				<option value="AB+">AB+</option>
				<option value="AB-">AB-</option>
			</select>
			<hr>
			<button type="submit" class="button">Save</button>
		</form>
	</div>
	<br>
	<br>
	<br>
</body>
</html>
