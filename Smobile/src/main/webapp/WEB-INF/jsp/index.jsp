<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!--Page title-->
    <title>${param.title}</title>

    <!-- Icon-shortcut -->
    <link rel="shortcut icon" href="<c:url value="/resources/media/favicon.io/favicon.ico"/>" type="image/x-icon">
    

    <!-- Font body-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

    <!-- Link CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
	
    <!-- Jquery-->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <!-- Link JS -->
    <script src="<c:url value="/resources/js/main.js"/>"></script>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- BS5 icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>

<body>
    <header>

        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid d-flex justify-content-between">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggler" aria-controls="navbarToggler01" aria-expanded="false" aria-label="Toggle navigation">
                        <em class="bi bi-list text-secondary"></em>
                </button>
                <a class="navbar-brand order-lg-0" href="#">
                    <img src="<c:url value="/resources/media/favicon.io/favicon-32x32.png"/>" alt="Smobile" width="30" height="24">
                </a>
                <!-- Button trigger modal -->
                <button type="button" class="btn order-lg-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <em class="bi bi-bag text-secondary"></em>
                </button>

                <!-- Navbar-expand-list -->
                <div class="collapse navbar-collapse order-lg-1" id="navbarToggler">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link text-secondary" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-secondary" href="#">Link</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex input-group w-auto mx-5">
                        <input type="search" class="form-control shadow-none" placeholder="IPhone 13 XS Max" aria-label="Search" />
                        <button class="btn btn-outline-secondary" type="button" data-mdb-ripple-color="dark">
                            <em class="bi bi-search text-secondary"></em>
                        </button>
                    </form>
                </div>

            </div>
        </nav>

        <!-- Modal body -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-body">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item p-5 mx-auto">Your bag is empty now..</li>
                            <li class="list-group-item"><a class="text-decoration-none" href="#"><em class="bi bi-bag-fill"> Cart</em></a></li>
                            <li class="list-group-item"><a class="text-decoration-none" href="#"><em class="bi bi-bookmark-star"> Saved Items</em></a></li>
                            <li class="list-group-item"><a class="text-decoration-none" href="#"><em class="bi bi-box-seam"> Orders</em></a></li>
                            <li class="list-group-item"><a class="text-decoration-none" href="#"><em class="bi bi-person-circle"> Account</em></a></li>
                            <li class="list-group-item"><a class="text-decoration-none" href="#"><em class="bi bi-gear-wide-connected"> Sign in</em></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <main>
        <div class="bg-light mx-5">
            <h2 class="ms-5">Smobile</h2>
			<div class="row d-flex justify-content-between mx-3">
				<c:if test="${not empty listProducts}">
					<c:forEach var="row" items="${listProducts}">
						<div class="card col-md-6 col-lg-3 m-3 rounded-5" style="width: 18rem;">
							<a class="text-decoration-none text-dark" href='#'>
								<img src="${row.product_img_source}" class="card-img-top mt-3" alt="#">
								<div class="card-body">
									<h5 class="card-title fw-bold">${row.product_name}</h5>
									<p class="card-text fst-italic">${row.product_des}</p>
									<p class="card-text fst-italic text-danger fw-bold">${row.product_price} $</p>
									<a href='<c:url value="/cart?action=additem&product_id=${row.product_id}"></c:url>' class="btn btn-secondary float-end">Add to cart</a>
								</div>
							 </a>
						</div>
					</c:forEach>
				</c:if>
			</div>
        </div>
    </main>
    <footer class="m-3 p-4">
        <div>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquam nisl in dui luctus vehicula. Phasellus dapibus turpis leo, ut lobortis metus scelerisque et. Vestibulum vel gravida quam, eget sagittis quam. Sed iaculis nibh non ante pulvinar
            tincidunt a vel diam. Nullam porta placerat justo, ut pharetra leo varius sed. In congue rhoncus odio, at mattis mi bibendum eu. Ut in ex posuere, eleifend nisl non, pulvinar sapien. Quisque id nisl ut felis semper vehicula non in ipsum. Praesent
            quis mi eget enim porttitor ullamcorper eu quis eros. Nam efficitur sed nisi eget scelerisque. Suspendisse potenti. Duis nec diam sed orci iaculis ultrices et vitae ex. Phasellus ac ornare turpis. Sed nunc orci, interdum congue eros vitae,
            porttitor lacinia ligula. Cras pretium, magna quis bibendum commodo, orci enim tincidunt lorem, et sagittis nulla tortor ut diam. Phasellus blandit augue eu ante fringilla pharetra. Curabitur eleifend ipsum nunc, sit amet rutrum diam sodales
            et. Nullam varius a nulla vitae faucibus. Etiam quis felis eget ex suscipit porta ut ac nibh. Donec eget sem commodo, suscipit elit non, sagittis velit. Nam ultricies magna non nunc pretium, eget tristique dui vehicula. Curabitur quis leo
            vel nulla cursus molestie. Integer feugiat non sapien eget ornare. Donec porta neque eu felis congue mattis sed vitae mi. Nulla facilisis libero erat, vitae volutpat nisi varius non. Donec suscipit lorem risus, non facilisis neque varius imperdiet.
            Nulla facilisi. Sed ex lacus, dapibus a finibus ac, euismod ut turpis. Nulla facilisi. Phasellus malesuada est lorem, non luctus mauris semper in. Nam eu tortor vitae sapien efficitur dignissim. Aliquam sagittis mauris eros, sit amet sagittis
            nisi posuere a. Sed porta, justo ut lobortis lobortis, dui justo viverra mauris, eu condimentum orci nunc non diam. Ut euismod, nisl vel volutpat tristique, arcu orci faucibus augue, sit amet mollis quam enim sit amet dolor. Donec eros lorem,
            egestas a ante at, lobortis euismod libero. Vivamus in sem suscipit, feugiat nulla sed, interdum nunc. Proin malesuada venenatis volutpat. Aliquam quis egestas sapien, vestibulum sollicitudin tortor. Vestibulum nisi neque, sodales ac tincidunt
            non, aliquet id nulla. Aenean pretium felis ac tellus viverra, vel dignissim nulla congue. Nam et venenatis ex. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean nec turpis non felis elementum
            tempus id sit amet metus. Suspendisse sollicitudin semper elit, ut sagittis neque rutrum volutpat. Praesent lobortis dui ac sagittis facilisis. Nullam in urna vehicula, sagittis enim in, elementum sapien. Duis gravida erat sit amet interdum
            molestie. Duis et ullamcorper neque, in cursus purus. Curabitur sit amet massa a mi fringilla gravida ut ut lorem. Proin justo lectus, ultricies vel porttitor sit amet, venenatis sed justo. Quisque dapibus, tellus eu sodales ultrices, urna
            leo scelerisque nibh, ut ultrices purus enim placerat massa. Ut lorem elit, sagittis id varius eget, ultrices nec sem. Donec tempus mi accumsan nibh fringilla gravida. Aenean mollis ultricies lectus. Proin cursus pharetra metus vitae vulputate.
            Sed id mi elementum, cursus diam et, luctus lectus. Ut porta sit amet arcu a tincidunt. Donec est justo, viverra eget aliquet vitae, mattis at ante.
        </div>
        <hr/>
        <div class="container-fluid d-lg-flex justify-content-between p-lg-0">
            <div class="order-lg-2">Viet Nam</div>
            <div class="order-lg-0">Copyright © 2022 Smobile Inc. All rights reserved.</div>
            <div class="order-lg-1">
                <a class="text-decoration-none text-secondary" href="#">Privacy Policy  </a>
                <a class="text-decoration-none text-secondary" href="#">|   Terms of Use Sales and Refunds  </a>
                <a class="text-decoration-none text-secondary" href="#">|   Legal </a>
                <a class="text-decoration-none text-secondary" href="#">|   Site Map</a>
            </div>
        </div>

    </footer>
</body>

</html>