<%@page import="servlets.CartPojo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<%@ include file="includes/head.jsp" %>

<%

ArrayList<CartPojo> cart_list = (ArrayList<CartPojo>)session.getAttribute("cart-list");

if(cart_list != null){
	request.setAttribute("cart_list", cart_list);
}

%>
</head>
<body>
<%@ include file="includes/navbar.jsp" %>

<%@ include file="includes/foot.jsp" %>
</body>
</html>