<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--Page title-->
<title>${param.title}</title>

<!-- Icon-shortcut -->
<link rel="shortcut icon"
	href="<c:url value="/resources/media/favicon.io/favicon.ico"/>"
	type="image/x-icon">


<!-- Font body-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap"
	rel="stylesheet">

<!-- Link CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">

<!-- Jquery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<!-- Link JS -->
<script src="<c:url value="/resources/js/main.js"/>"></script>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- BS5 icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>

<body>
	<header>

		<nav class="navbar navbar-expand-lg fixed-top">
			<div class="container-fluid d-flex justify-content-between">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarToggler"
					aria-controls="navbarToggler01" aria-expanded="false"
					aria-label="Toggle navigation">
					<em class="bi bi-list text-secondary"></em>
				</button>
				<a class="navbar-brand order-lg-0" href='<c:url value="/"/>'> <img
					src="<c:url value="/resources/media/favicon.io/favicon-32x32.png"/>"
					alt="Smobile" width="30" height="24">
				</a>
				<!-- Button trigger modal -->
				<button type="button" class="btn order-lg-2" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<em class="bi bi-bag text-secondary"></em>
				</button>

				<!-- Navbar-expand-list -->
				<div class="collapse navbar-collapse order-lg-1" id="navbarToggler">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link text-secondary"
							aria-current="page" href='<c:url value="/"/>'>Home</a></li>
						<li class="nav-item"><a class="nav-link text-secondary"
							href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link disabled">Disabled</a>
						</li>
					</ul>
					<form class="d-flex input-group w-auto mx-5">
						<input type="search" class="form-control shadow-none"
							placeholder="IPhone 13 XS Max" aria-label="Search" />
						<button class="btn btn-outline-secondary" type="button"
							data-mdb-ripple-color="dark">
							<em class="bi bi-search text-secondary"></em>
						</button>
					</form>
				</div>

			</div>
		</nav>

		<!-- Modal body -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item p-5 mx-auto"><c:if
									test="${empty cart}">
									<em>Your cart is empty now..</em>
								</c:if> <c:if test="${not empty cart}">
									<em>Seems like you got some stuffs in your bag.</em>
									<p>
										<a class="text-decoration-none" href="<c:url value="/cart"/>"><em
											class="float-end pt-3"> > Go check it</em></a>
									</p>
								</c:if></li>
							<li class="list-group-item"><a class="text-decoration-none"
								href="<c:url value="/cart"/>"><em class="bi bi-bag-fill">
										Cart</em></a></li>
							<li class="list-group-item"><a class="text-decoration-none"
								href="#"><em class="bi bi-bookmark-star"> Saved Items</em></a></li>
							<li class="list-group-item"><a class="text-decoration-none"
								href="#"><em class="bi bi-box-seam"> Orders</em></a></li>
							<li class="list-group-item"><a class="text-decoration-none"
								href='<c:url value="/account"/>'><em
									class="bi bi-person-circle"> Account</em></a></li>
							<li id="login-btn" class="list-group-item"><a
								class="text-decoration-none" href='<c:url value="/login"/>'><em
									class="bi bi-gear-wide-connected"> Sign in</em></a></li>
							<li id="logout-btn" class="list-group-item d-none"><a
								class="text-decoration-none" href='<c:url value="/logout"/>'><em
									class="bi bi-power"> Log Out</em></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</header>

	<%
	String script = "<script>$(document).ready(function() {$(\"#logout-btn\").removeClass(\"d-none\");$(\"#login-btn\").addClass(\"d-none\");});</script>";
	%>

	<c:if test="${not empty cookie.accountType.value}"><%=script%></c:if>
