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
				<li class="nav-item">
					<form action="master" method="post">
						<button type="submit" name="action" class="btn btn-success">
							SignOut&nbsp;<i class="fas fa-sign-out-alt"></i>
						</button>
					</form>
				</li>

			</ul>

		</div>
	</nav>
	<div class="container">
		<form action="master" method="post">
			<table border="1" class="table table-striped" class="container-fluid">
				<thead>
					<tr>
						<th>ProductId</th>
						<th>Image</th>
						<th>Name</th>
						<th>UnitPrice</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="obj" items="${slist}" varStatus="st">
						<tr>

							<td>${obj.getId()}</td>
							<td><img src="images/${obj.getImage_url()}"
								alt="image notFound" height="100" width="100"></td>
							<td>${obj.getName()}</td>
							<td>${obj.getPrice()}</td>
							<td>${qList.get(st.index)}</td>

						</tr>
					</c:forEach>
				</tbody>

			</table>
			<div class="container">
				<center>
					<h4>
						<b>Total Price:${tp}</b>
					</h4>
				</center>
			</div>
			<br> <br>
			<div class="container">
				<center>
					<input type="submit" name="action" value="CheckOut"
						class="btn btn-primary" />
				</center>
			</div>
			<br> <br>
			<div class="container">
				<center>
					<a href="NykaaHome.jsp"><input type="submit"
						class="btn btn-primary" name="action" value="ContinueShopping"></a>
				</center>
			</div>
		</form>
	</div>
</body>
</html>