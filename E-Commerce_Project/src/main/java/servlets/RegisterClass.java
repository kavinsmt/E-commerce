package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterClass extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String name = req.getParameter("name");
	String mail = req.getParameter("mail");
	String mobile = req.getParameter("mobile");
	String gender = req.getParameter("gender");
	String dob = req.getParameter("dob");
	String password = req.getParameter("password");
	
	//HelpingClass.setContext(getServletContext());
	
	int result = HelpingClass.addNewUser(name, mail, mobile, gender, dob, password);
	
	resp.setContentType("text/html");
	PrintWriter out = resp.getWriter();
	RequestDispatcher dispatcher = null;
	
	if(result !=0) {
		dispatcher = req.getRequestDispatcher("login.jsp");
		dispatcher.forward(req, resp);
	}
	else {
		out.print("Registration failed pls try again later!!");
		dispatcher= req.getRequestDispatcher("register.jsp");
		dispatcher.include(req, resp);
	}
}
}
