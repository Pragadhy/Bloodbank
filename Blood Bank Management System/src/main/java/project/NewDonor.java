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

@WebServlet("/NewDonor")
public class NewDonor extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String father = request.getParameter("father");
		String mother = request.getParameter("mother");
		String gender = request.getParameter("gender");
		String mobilenumber = request.getParameter("mobilenumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String bloodgroup = request.getParameter("bloodgroup");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
			PreparedStatement ps = con.prepareStatement("insert into donor values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, father);
			ps.setString(4, mother);
			ps.setString(5, gender);
			ps.setString(6, mobilenumber);
			ps.setString(7, email);
			ps.setString(8, address);
			ps.setString(9, bloodgroup);
			ps.executeUpdate();
			response.sendRedirect("addNewDonor.jsp?msg=valid");
		} catch (Exception e) {
			response.sendRedirect("addNewDonor.jsp?msg=invalid");
		}
	}
}