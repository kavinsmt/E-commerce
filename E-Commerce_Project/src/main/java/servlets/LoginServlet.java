package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String mail = req.getParameter("mail");
	String password = req.getParameter("password");
	
	//HelpingClass.setContext(getServletContext());
	
	String userName = HelpingClass.loginValidation(mail, password);
	RequestDispatcher dispatcher = null;
	
	if(userName != null) {
		Cookie cookie = new Cookie("userName", userName);
		cookie.setMaxAge(86400);
		resp.addCookie(cookie);
		
		req.setAttribute("userName", userName);
		
		dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
	}
	else {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.print("Invalid Login Details");
		
		req.getRequestDispatcher("login.jsp").include(req, resp);
	}

}
}
