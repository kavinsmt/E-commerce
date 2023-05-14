<%@page import="servlets.CartPojo"%>
<%@page import="servlets.HelpingClass"%>
<%@page import="servlets.ProductShow"%>
<%@page import="servlets.ProductPojo"%>
<%@page import="java.util.ArrayList"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to ShopAt !</title>
<link rel = "icon" href = "productImages/e-comlogo3.png" type = "image/x-icon">
<style type="text/css">
/*slider*/
.carousel-inner img{
        width: 600px;
        height: 450px;
        margin-left: auto;
        margin-right: auto;
}
 #demo{
        margin-top: 27px;
        margin-bottom: 27px;
      }
</style>
<%@ include file="includes/head.jsp" %>
</head>
<body>
 <%
		ProductShow ps = new ProductShow(HelpingClass.getDbConnection());
		ArrayList<ProductPojo> product =  ps.getAllProducts();
		
		ArrayList<CartPojo> cart_list = (ArrayList<CartPojo>)session.getAttribute("cart-list");
    
    	if(cart_list != null){
    		request.setAttribute("cart_list", cart_list);
    	}
%> 
<%@ include file="includes/navbar.jsp" %>

<div class="container">
<div id="demo" class="carousel slide" data-bs-ride="carousel">

 <!-- Indicators/dots -->
 <div class="carousel-indicators">
   <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
   <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
 </div>
<div class="carousel-inner">
   <div class="carousel-item active">
     <img src="productImages/curosol-offer.jpg" alt="Los Angeles" class="d-block ">
   </div>
   <div class="carousel-item">
     <img src="productImages/watch-offer.jpg" alt="Chicago" class="d-block ">
   </div>
   
 </div>

 <!-- Left and right controls/icons -->
 <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
   <span class="carousel-control-prev-icon"></span>
 </button>
 <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
   <span class="carousel-control-next-icon"></span>
 </button>
</div>

		<div class="card-header my-3">All Products</div>
		<div class="row">
 <%
	if(!product.isEmpty()){
	for(ProductPojo p : product){
	%>
		<div class="col-md-3 my-3">
		<div class="card w-100">
			<img class="card-img-top" src="<%=p.getImage()%>"
				alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title"> <%= p.getName() %></h5>
				<h6 class="price">Price: <%= p.getPrice() %>  </h6>
				<h6 class="category">Category :<%=p.getCategory() %>  </h6>
				<div class="mt-3 d-flex justify-content-between">
					<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId() %>">Add to Cart</a> <a
						class="btn btn-primary" href="order-now?quantity=1&id=">Buy Now</a>
				</div>
			</div>
		</div>
	</div>
    <%
	}
	}
	%> 
		</div>
	</div>
<%@ include file="includes/foot.jsp" %>
</body>
</html>