<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success Page</title>
</head>
<body>
<jsp:include page="header.jsp" />

<div id="fh5co-contact">
		<div class="container">
			<!--
			 <div class="row top-line animate-box">
				<div class="col-md-6 col-md-offset-3 col-md-push-2 text-left fh5co-heading">
					<h2>Say Hello</h2>
					<h3>Free html5 templates Made by <a href="http://freehtml5.co/" target="_blank">freehtml5.co</a></h3>
					<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove</p>
				</div>
			</div>
			-->
			<div class="row">
				<div class="col-md-8 col-md-offset-2">
					<div>
						<div class="fh5co-contact-info">
							<h2>Payment Successful Information</h2>
							<h5>Please record for future purpose.</h5>
							<ul>
								<li>Order id : <%=request.getParameter("id")%></li>
								<li>Transaction id : <%=request.getParameter("transaction_id")%></li>
								<li>Payment id : <%=request.getParameter("payment_id")%></li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>

<jsp:include page="footer.jsp" />
</body>
</html>