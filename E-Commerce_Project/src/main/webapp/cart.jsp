<%@page import="servlets.HelpingClass"%>
<%@page import="servlets.ProductShow"%>
<%@page import="java.util.List"%>
<%@page import="servlets.CartPojo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    	ArrayList<CartPojo> cart_list = (ArrayList<CartPojo>)session.getAttribute("cart-list");
    	List<CartPojo> cartProduct = null;
    
    	if(cart_list != null){
    		ProductShow ps = new ProductShow(HelpingClass.getDbConnection());
    		cartProduct = ps.getCartProducts(cart_list);
    		int total = ps.getTotalCartPrice(cart_list);
    		request.setAttribute("cart_list", cart_list);
    		request.setAttribute("total", total);
    	}
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@ include file="includes/head.jsp" %>
<style type="text/css">
.table tbody td{
vertical-align: middle;
}
.btn-incre, .btn-decre{
box-shadow: none;
font-size: 25px;
}
</style>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price:  ${(total>0)?total:0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				 <%
				if (cart_list != null) {
					for (CartPojo c : cartProduct) {
				%> 
					<tr>
					<td> <%=c.getName()%></td>
					<td> <%=c.getCategory()%></td>
					<td> <%= c.getPrice() %></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
								<input type="text" name="quantity" class="form-control"  value="<%= c.getQuantity() %>" readonly> 
								<a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%> "><i class="fas fa-plus-square"></i></a> 
								
								
							</div>
							
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%-- <%=c.getId() %> --%>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				 <%
				}}%> 
			</tbody>
		</table>
	</div>


<%@ include file="includes/foot.jsp" %>
</body>
</html>