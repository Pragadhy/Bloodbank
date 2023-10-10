package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDonor")
public class DeleteDonor extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        PrintWriter pw= response.getWriter();
		String id = request.getParameter("id");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
			Statement st = con.createStatement();
			st.executeUpdate("delete from donor where id='" + id + "'");
			response.sendRedirect("donorList.jsp?msg=deleted");
		}

		catch (Exception e) {

			pw.println(e);
		}
	}
}
