package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RequestDone")
public class RequestDone extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 PrintWriter pw= response.getWriter();
		String mobilenumber = request.getParameter("mobilenumber");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
			PreparedStatement ps = con
					.prepareStatement("update bloodrequest set status='completed' where mobilenumber=?");
			ps.setString(1, mobilenumber);
			ps.executeUpdate();
			response.sendRedirect("requestForBlood.jsp");
		}

		catch (Exception e) {
			pw.println(e);
		}
	}
}
