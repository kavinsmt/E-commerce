<%

	 Cookie[] cookie =  request.getCookies();
	 String uName = null;
	for(Cookie c: cookie){
		if(c.getName().equalsIgnoreCase("userName")){
			uName = c.getValue();
		}
	}

%>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">ShopAt</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				
				<%
				/* String UserName = (String)request.getAttribute("userName"); */
				if(uName != null){%>
					<li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="profile.jsp">Hi ! <%= uName %></a></li>
					<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
				<%
				}
				else{%>
				
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
				
				<% }
				%>
			</ul>
		</div>
	</div>
</nav>