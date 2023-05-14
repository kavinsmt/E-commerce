package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter writer = resp.getWriter();
		resp.setContentType("text/html");
		try {
			String action = req.getParameter("action");
			int id =Integer.parseInt(req.getParameter("id"));
			
			ArrayList<CartPojo> cart_list = (ArrayList<CartPojo>) req.getSession().getAttribute("cart-list");
			if (action != null && id >= 1) {
				if (action.equals("inc")) {
					for (CartPojo c : cart_list) {
						if (c.getId() == id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							resp.sendRedirect("cart.jsp");
						}
					}
				}

				if (action.equals("dec")) {
					for (CartPojo c : cart_list) {
						if (c.getId() == id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							break;
						}
					}
					resp.sendRedirect("cart.jsp");
				}
			} else {
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
		}
	}

}
