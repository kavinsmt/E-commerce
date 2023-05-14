package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		
		try(PrintWriter out = resp.getWriter()) {
			ArrayList<CartPojo> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(req.getParameter("id"));
			CartPojo cm = new CartPojo();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = req.getSession();
			ArrayList<CartPojo> cart_list = (ArrayList<CartPojo>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				resp.sendRedirect("index.jsp");
			}
			else {
				cartList = cart_list;

                boolean exist = false;
                for (CartPojo c : cart_list) {
                    if (c.getId() == id) {
                        exist = true;
                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
                    }
                }

                if (!exist) {
                    cartList.add(cm);
                    resp.sendRedirect("index.jsp");
                }
			}
		}
		catch (Exception e) {
			System.out.println("Error in  addtocart");
		}
	}
}
