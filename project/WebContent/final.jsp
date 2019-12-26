<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FirstCry</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<nav class="navbar navbar-custom navbar-expand-sm">
	<div class="container-fluid">
		<img src="logo.jpg" alt="logo" height="70px" width="150px"
			class="rounded ">
		<ul class="nav">
			<input type="submit" name="bt" class="btn btn-primary"
				value="welcome ${name}"> &nbsp;&nbsp;&nbsp;
			<a href="logout.jsp" class="btn btn-primary"> logout</a>
		</ul>
	</div>
	</nav>
	<br>
	<br>
	<br>
	<h2 style="color: red;" align="center">You have successfully
		ordered your products</h2>
	<h3 align="center" style="color: red;">
		Thank you for visiting us.<br> <br>
		<img src="smile emoji.jpg">
	</h3>
	<br>
	<center>
		<a href="Home.jsp" class="btn btn-primary"> Home</a>
	</center>
</body>
</html>