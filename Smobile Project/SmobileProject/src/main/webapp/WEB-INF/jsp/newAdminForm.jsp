<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="header.jsp">
	<c:param name="title" value="New Admin"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">

		<form class="m-5 p-5 bg-light rounded-3" id="login_form"
			action='<c:url value="/account/doAdd?type=admin"/>' method="post">

			<!-- Error form -->
			<div class="text-center text-danger">
				<p>
					<i><strong>${error}</strong></i>
				</p>
			</div>

			<!-- Email input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="username">Admin mail(*)</label> <input
					type="text" id="username" name="admin_mail"
					value="${param.admin_mail}" class="form-control"
					placeholder="name@example.com" />
			</div>

			<!-- Password input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="password">Password(*)</label> <input
					type="password" id="password" name="password"
					value="${param.password}" class="form-control" />
			</div>
			
			<!-- Admin name input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="admin_name">Admin name(*)</label> <input
					type="text" id="admin_name" name="admin_name"
					value="${param.admin_name}" class="form-control" />
			</div>

			<!-- Admin address input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="admin_address">Admin address</label>
				<input type="text" id="admin_address" name="admin_address"
					value="${param.admin_address}" class="form-control" />
			</div>

			<!-- Admin phone input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="admin_phone">Admin phone</label> <input
					type="text" id="admin_phone" name="admin_phone"
					value="${param.admin_phone}" class="form-control" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-success btn-block mt-5">Add
					new admin</button>
			</div>

		</form>
	</div>
</main>

<c:import url="footer.jsp" />