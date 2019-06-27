<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
					<div class="col-md-5 col-md-pull-1 animate-box">
						<div class="fh5co-contact-info">
							<h3>Contact Information</h3>
							<ul>
								<li class="address">Competition Hub</li>
								<li class="phone"><a href="#">7070634348</a></li>
								<li class="email"><a href="#">info@competitionHub.com</a></li>
								<li class="url"><a href="#">New Block, Station Road, Begusarai.</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-7 animate-box">
						<h3>Get In Touch</h3>
					
						<form action="contact" method="post">
							<div class="row form-group">
								<div class="col-md-12">
									<label for="fname">Your Name</label>
									<input type="text" name="name" id="fname" class="form-control">
								</div>
								
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label for="email">Email</label>
									<input type="email" name="emaill" id="email" class="form-control">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label for="message">Message</label>
									<textarea name="message" id="message" cols="30" rows="10" class="form-control"></textarea>
								</div>
							</div>
							<div class="form-group">
								<input type="submit" value="Send Message" class="btn btn-primary">
							</div>

						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 
	<div id="fh5co-started">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<h2>Get Started</h2>
					<p>We create beautiful themes for your site behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					<p><a href="#" class="btn btn-primary">Let's work together</a></p>
				</div>
			</div>
		</div>
	</div>
-->

<jsp:include page="footer.jsp" />
</body>
</html>