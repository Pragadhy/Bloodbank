<%@include file="header.html"%>
<%@page import="java.sql.*"%>
<html>
<head>
<style>
.container {
    max-width: 100%;
    margin: 0 auto;
    padding: 0 2%;
}
#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 95%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align:left;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}
</style>
</head>
<body>
	<br>
	<div class="container">
		<table id="customers">
			<tr>
				<th>Name</th>
				<th>Mobile Number</th>
				<th>Email</th>
				<th>Blood Group</th>
				<th>Done</th>
			</tr>
			<%
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from bloodrequest where status='pending'");
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="RequestDone?mobilenumber=<%=rs.getString(2)%>">Done</a></td>
			</tr>
			<%
			}
			} catch (Exception e) {
			System.out.println(e);
			}
			%>
		</table>
	</div>
	</body>
</html>