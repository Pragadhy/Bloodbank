package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageStock")
public class ManageStock extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String bloodgroup = request.getParameter("bloodgroup");
		String incdec = request.getParameter("incdec");
		String units = request.getParameter("units");
		int units1 = Integer.parseInt(units);

		if (units != null && !units.isEmpty()) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "");
				Statement st = con.createStatement();

				if (incdec.equals("inc")) {
					st.executeUpdate(
							"update stock set units = units + " + units1 + " where bloodgroup='" + bloodgroup + "'");
				} else {
					st.executeUpdate(
							"update stock set units = units - " + units1 + " where bloodgroup='" + bloodgroup + "'");
				}
				response.sendRedirect("manageStock.jsp?msg=valid");
			} 
			catch (Exception e) {

				response.sendRedirect("manageStock.jsp?msg=invalid");
			}
		}
	}
}
