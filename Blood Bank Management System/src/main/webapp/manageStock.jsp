<%@include file="header.html"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="submit"], select {
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
.container form {
    margin-left: 35%;
    width: 30%;
    text-align: center;
    margin-top: 20px;
}

#customers {
    border-collapse: collapse;
    width: 50%;
    margin:auto;
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
<div class="container">
    <br>
    <%
    String msg = request.getParameter("msg");
    if ("valid".equals(msg)) {
    %>
           <div class="message">Updated Successfully</div>
    <%
    }
    if ("invalid".equals(msg)) {
    %>
   
        <div class="error-message">Something went wrong! Try Again!</div>
    
    <%
    }
    %>
    <form action="ManageStock" method="post">
        <div class="form-group">
            <h2>Select Blood Group</h2>
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
        </div>
        <div class="form-group">
            <h2>Select Increase/Decrease</h2>
            <select name="incdec">
                <option value="inc">Increase</option>
                <option value="dec">Decrease</option>
            </select>
        </div>
        <div class="form-group">
            <h2>Units</h2>
            <input type="text" name="units" placeholder="Enter Units">
        </div>
        <button type="submit" class="button">Save</button>
    </form>
    <br>
    <table id="customers">
        <tr>
            <th>Blood Group</th>
            <th>Units</th>
        </tr>
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from stock");
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
        </tr>
        <%
        }
        } 
        catch (Exception e) {
        System.out.println(e);
        }
        %>
    </table>
</div>
</body>
</html>
