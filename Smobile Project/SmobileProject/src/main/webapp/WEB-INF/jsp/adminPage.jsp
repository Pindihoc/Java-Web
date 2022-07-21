<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="header.jsp">
	<c:param name="title" value="Admin page"></c:param>
</c:import>

<main>
	<div class="container bg-light p-5 rounded-3">
		<h1>
			<em class="bi bi-person-workspace"> Welcome to admin-page,
				${username}!</em>
		</h1>
		<br>
		<form action="<c:url value="/account/delete"/>" method="post"
			class="d-inline">
			<div class="pb-3 ps-3">
				<div class="dropdown d-inline-block">
					<button class="btn btn-success dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">Add new</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="<c:url value="/account/add?type=admin"/>">Admin</a></li>
						<li><a class="dropdown-item" href="<c:url value="/account/add?type=user"/>">User</a></li>
						<li><a class="dropdown-item disabled" href="#">Category</a></li>
						<li><a class="dropdown-item" href="<c:url value="/account/add?type=product"/>">Product</a></li>
						<li><a class="dropdown-item disabled" href="#">Discount</a></li>
					</ul>
				</div>
				<button type="button" id="btn-mutil-delete" class="btn btn-danger">Mutil-delete</button>
				<button type="submit" class="btn btn-danger btn-mutil-delete">Confirm
					to delete</button>
			</div>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item"><a class="nav-link text-secondary active"
					data-bs-toggle="tab" href="#admin">Admin</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#user">User</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#category">Category</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#product">Product</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#discount">Discount</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#order">Order</a></li>
				<li class="nav-item"><a class="nav-link text-secondary"
					data-bs-toggle="tab" href="#order-detail">Order detail</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div id="admin" class="container tab-pane active">
					<br>
					<h3>ADMIN</h3>
					<div class="bg-light mx-5">
						<div class="row d-flex justify-content-evenly mx-3">
							<c:if test="${not empty adminList}">
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col"><div class="form-check">
													<input class="form-check-input btn-mutil-delete"
														type="checkbox" name="type" value="admin">
												</div></th>
											<th scope="col">Admin mail</th>
											<th scope="col">Password</th>
											<th scope="col">Admin name</th>
											<th scope="col">Admin address</th>
											<th scope="col">Admin phone</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${adminList}">
											<tr>
												<th scope="row">
													<div class="form-check">
														<input class="form-check-input btn-mutil-delete"
															type="checkbox" name="username" value="${row.admin_mail}">
													</div>
												</th>
												<td>${row.admin_mail}</td>
												<td>${row.password}</td>
												<td>${row.admin_name}</td>
												<td>${row.admin_address}</td>
												<td>${row.admin_phone}</td>
												<td><a
													href='<c:url value="/account/edit?type=admin&username=${row.admin_mail}"/>'
													class="btn btn-secondary btn-sm">Edit</a></td>
												<td><a
													href='<c:url value="/account/delete?type=admin&username=${row.admin_mail}"/>'
													class="btn btn-secondary btn-sm">Del</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>

				</div>
				<div id="user" class="container tab-pane fade">
					<br>
					<h3>USER</h3>
					<div class="bg-light mx-5">
						<div class="row d-flex justify-content-evenly mx-3">
							<c:if test="${not empty userList}">
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col"><div class="form-check">
													<input class="form-check-input btn-mutil-delete"
														type="checkbox" name="type" value="user">
												</div></th>
											<th scope="col">User mail</th>
											<th scope="col">Password</th>
											<th scope="col">Account role</th>
											<th scope="col">User name</th>
											<th scope="col">User address</th>
											<th scope="col">User phone</th>
											<th scope="col">Account state</th>
											<th scope="col">False login count</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${userList}">
											<tr>
												<th scope="row">
													<div class="form-check">
														<input class="form-check-input btn-mutil-delete"
															type="checkbox" name="username" value="${row.user_mail}">
													</div>
												</th>
												<th>${row.user_mail}</th>
												<td>${row.password}</td>
												<td>${row.account_role}</td>
												<td>${row.user_name}</td>
												<td>${row.user_address}</td>
												<td>${row.user_phone}</td>
												<td>${row.account_state}</td>
												<td>${row.false_login_count}</td>
												<td><a
													href='<c:url value="/account/resetPassword?type=user&username=${row.user_mail}"/>'
													class="btn btn-secondary btn-sm">RePw</a></td>
												<td><a
													href='<c:url value="/account/edit?type=user&username=${row.user_mail}"/>'
													class="btn btn-secondary btn-sm">Edit</a></td>
												<td><a
													href='<c:url value="/account/delete?type=user&username=${row.user_mail}"/>'
													class="btn btn-secondary btn-sm">Del</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<div id="category" class="container tab-pane fade">
					<br>
					<h3>CATEGORY</h3>
					<p>Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				</div>
				<div id="product" class="container tab-pane fade">
					<br>
					<h3>PRODUCT</h3>
					<div class="bg-light mx-5">
						<div class="row d-flex justify-content-evenly mx-3">
							<c:if test="${not empty productList}">
								<table class="table table-striped">
									<thead>
										<tr>
											<th scope="col"><div class="form-check">
													<input class="form-check-input btn-mutil-delete"
														type="checkbox" name="type" value="product">
												</div></th>
											<th scope="col">Product ID</th>
											<th scope="col">Product name</th>
											<th scope="col">Product description</th>
											<th scope="col">Product price</th>
											<th scope="col">Product image source</th>
											<th scope="col">Product image</th>
											<th scope="col">Category ID</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="row" items="${productList}">
											<tr>
												<th scope="row">
													<div class="form-check">
														<input class="form-check-input btn-mutil-delete"
															type="checkbox" name="product_id" value="${row.product_id}">
													</div>
												</th>
												<th>${row.product_id}</th>
												<td>${row.product_name}</td>
												<td>${row.product_des}</td>
												<td>${row.product_price}</td>
												<td>${row.product_img_source}</td>
												<td><img src="${row.product_img_source}"
													class="img-thumbnail" alt="${row.product_name}"></td>
												<td>${row.category_id}</td>
												<td><a
													href='<c:url value="/account/edit?type=product&product_id=${row.product_id}"/>'
													class="btn btn-secondary btn-sm">Edit</a></td>
												<td><a
													href='<c:url value="/account/delete?type=product&product_id=${row.product_id}"/>'
													class="btn btn-secondary btn-sm">Del</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
					</div>
				</div>
				<div id="discount" class="container tab-pane fade">
					<br>
					<h3>DISCOUNT</h3>
					<p>Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				</div>
				<div id="order" class="container tab-pane fade">
					<br>
					<h3>ORDER</h3>
					<p>Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				</div>
				<div id="order-detail" class="container tab-pane fade">
					<br>
					<h3>ORDER DETAIL</h3>
					<p>Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
				</div>
			</div>
		</form>
	</div>
</main>


<c:import url="footer.jsp" />