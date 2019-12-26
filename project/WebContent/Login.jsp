<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.navbar-custom {
	background-color: grey;
}
</style>
</head>
<body>
	<nav class="navbar navbar-custom navbar-expand-sm">
		<div class="container-fluid">
			<img src="logo.jpg" alt="logo" height="70px" width="150px"
				class="rounded ">

			<!-- comments -->

			<ul class="nav">
				<li class="nav-item">
					<button class="btn btn-success" data-toggle="modal"
						data-target="#my1">
						<i class="fas fa-sign-in-alt" class="text text-custom"></i>&nbsp;SignIn
					</button>
				</li>&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><button class="btn btn-success"
						data-toggle="modal" data-target="#myModal">
						<i class="fas fa-user-plus"></i>&nbsp;SignUp
					</button></li>
			</ul>
		</div>
	</nav>


	<!-- The Modal -->
	<div class="modal" id="my1">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter Credentials</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="master" method="post">
					<!-- Modal body -->
					<div class="modal-body">

						<div>
							Enter MailId :<input type="email" name="n4" size="30" required />

						</div>
						<br>
						<div>

							Enter the Password: <input type="password" name="n5" size="30"
								required />

						</div>

						<br>


					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" name="action" value="Login"
							class="btn btn-primary" />
					</div>
				</form>

			</div>
		</div>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Enter Details</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="master" method="post">
					<!-- Modal body -->
					<div class="modal-body">

						<div>
							Enter Name:<input type="text" name="n1" size="30" required />
						</div>
						<br>
						<div>

							Enter EmailId:<input type="email" name="n2" size="30" required />
						</div>
						<br>
						<div>
							Enter Password:<input type="password" name="n3" required />
						</div>
						<br>

					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<input type="submit" name="action" value="Register"
							class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="container">
		<div id="demo" class="carousel slide" data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
				<li data-target="#demo" data-slide-to="3"></li>
				<li data-target="#demo" data-slide-to="4"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="health.jpg" alt="ADs" width="1100" height="300">
				</div>
				<div class="carousel-item">
					<img src="toys.jpg" alt="ADs" width="1100" height="300">
				</div>
				<div class="carousel-item">
					<img src="fashion.jpg" alt="ADs" width="1100" height="300">
				</div>
				<div class="carousel-item">
					<img src="bath.jpg" alt="ADs" width="1100" height="300">
				</div>
				<div class="carousel-item">
					<img src="footwear.jpg" alt="ADs" width="1100" height="300">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<form action="master" method="post">
			<table>
				<tr>
					<td><select name="select">
							<option>select</option>
							<c:forEach var="obj1" items="${ilist}">
								<option>${obj1}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" name="action" value="Go"
						class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<br>
	<div class="container">

		<table border="1" class="table table-striped">
			<thead>
				<tr>
					<th>Image</th>
					<th>Name</th>
					<th>UnitPrice</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="obj" items="${list}">
					<tr>
						<td><img src="images/${obj.getImage_url()}"
							alt="image notFound" height="100" width="100"></td>
						<td>${obj.getName()}</td>
						<td>${obj.getPrice()}</td>


					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</body>
</html>