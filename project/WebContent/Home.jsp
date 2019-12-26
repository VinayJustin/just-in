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
					<button class="btn btn-success">Welcome&nbsp;${name}</button>
				</li> &nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a href="logout.jsp"><button
							type="submit" name="action" class="btn btn-success">
							SignOut&nbsp;<i class="fas fa-sign-out-alt"></i>
						</button></a></li>
			</ul>

		</div>
	</nav>

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
							<c:forEach var="obj1" items="${ilist}">
								<option>${obj1}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" name="action" value="Filter"
						class="btn btn-primary" required></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<br>
	<div class="container">
		<form action="master" method="post">
			<table border="1" class="table table-striped" class="container-fluid">
				<thead>
					<tr>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="obj" items="${list}">
						<tr>
							<input type="hidden" name="id" value="${obj.id}" />
							<td><img src="images/${obj.getImage_url()}"
								alt="image notFound" height="100" width="100"></td>
							<td class="name">${obj.getName()}</td>
							<td>${obj.getPrice()}</td>
							<td><input type="number" value="0" min="0" max="50"
								name="quantity" /></td>

						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" align="right"><input type="submit"
							name="action" value="AddToCart" class="btn btn-primary"></td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

</body>
</html>