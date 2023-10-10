package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Index")
public class Index extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String mobilenumber = request.getParameter("mobilenumber");
		String email = request.getParameter("email");
		String bloodgroup = request.getParameter("bloodgroup");
		String status = "Pending";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
			PreparedStatement ps = con.prepareStatement("insert into bloodrequest values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, mobilenumber);
			ps.setString(3, email);
			ps.setString(4, bloodgroup);
			ps.setString(5, status);
			ps.executeUpdate();
			response.sendRedirect("index.jsp?msg=valid");
		}

		catch (Exception e) {
			response.sendRedirect("index.jsp?msg=invalid");
		}

	}

}