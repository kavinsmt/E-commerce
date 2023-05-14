package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	Cookie cookie =null;
	Cookie[] ls =req.getCookies();


	for(Cookie c:ls) {
		
		if(("userUniqId").equalsIgnoreCase(c.getName()))
			cookie=new Cookie("userUniqId", c.getValue());
			
	}
	
	if(cookie !=null){
		cookie.setMaxAge(0);
		resp.addCookie(cookie);
		req.setAttribute("userName", null);
	}
	
	req.getRequestDispatcher("login.jsp").forward(req, resp);
}
}
