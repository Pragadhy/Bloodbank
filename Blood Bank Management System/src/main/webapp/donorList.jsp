<%@include file="header.html"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    text-align: center;
  }
#customers {
    border-collapse: collapse;
    width: 95%;
    margin: 20px auto; 
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
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
        <%
        String msg = request.getParameter("msg");
        if ("valid".equals(msg)) {
        %>
        <div class="message">Successfully updated</div>
        <%
        }
        if ("invalid".equals(msg)) {
        %>
        <div class="error-message">Something Went wrong, Try Again!</div>
        <%
        }
        if ("deleted".equals(msg)) {
        %>
        <div class="message">Successfully deleted</div>
        <%
        }
        %>
  
    <table id="customers">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Father Name</th>
            <th>Mother Name</th>
            <th>Gender</th>
            <th>Mobile Number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Blood Group</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from donor");
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><a href="updateDonor.jsp?id=<%=rs.getInt(1)%>">Edit</a></td>
            <td><a href="DeleteDonor?id=<%=rs.getInt(1)%>">Delete</a></td>
        </tr>
        <%
        }
        } catch (Exception e) {
        System.out.println(e);
        }
        %>
    </table>
</body>
</html>
