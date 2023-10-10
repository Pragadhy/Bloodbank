package project;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Admin")
public class Admin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username != null && password != null) {
			if (username.equals("admin") && password.equals("admin123")) {
				response.sendRedirect("home.jsp");
			} else {
				response.sendRedirect("adminLogin.jsp?msg=invalid");
			}

		}
	}
}
