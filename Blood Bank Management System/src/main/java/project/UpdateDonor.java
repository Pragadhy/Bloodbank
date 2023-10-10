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

@WebServlet("/UpdateDonor")
public class UpdateDonor extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String father = request.getParameter("father");
		String mother = request.getParameter("mother");
		String mobilenumber = request.getParameter("mobilenumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
			PreparedStatement ps = con.prepareStatement(
					"update donor set name=?,father=?,mother=?,mobilenumber=?,email=?,address=? where id=?");
			ps.setString(1, name);
			ps.setString(2, father);
			ps.setString(3, mother);
			ps.setString(4, mobilenumber);
			ps.setString(5, email);
			ps.setString(6, address);
			ps.setString(7, id);

			ps.executeUpdate();
			response.sendRedirect("donorList.jsp?msg=valid");
		}
		catch (Exception e) {
			response.sendRedirect("donorList.jsp?msg=invalid");
		}
	}
}