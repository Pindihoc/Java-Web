<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="header.jsp">
	<c:param name="title" value="New User"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">
		<form class="m-5 p-5 bg-light rounded-3" id="login_form"
			action='<c:url value="/account/doAdd?type=user"/>' method="post">

			<!-- Error form -->
			<div class="text-center text-danger">
				<p>
					<i><strong>${error}</strong></i>
				</p>
			</div>

			<!-- Email input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="username">User mail(*)</label> <input
					type="text" id="username" name="user_mail"
					value="${param.user_mail}" class="form-control"
					placeholder="name@example.com" />
			</div>

			<!-- Password input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="password">Password(*)</label> <input
					type="password" id="password" name="password"
					value="${param.password}" class="form-control" />
			</div>

			<!-- Account role input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="account_role">Account
					role(*)</label> <select name="account_role" class="form-select"
					id="account_role">
					<option selected>Choose...</option>
					<option value="0">0 - Normal account</option>
				</select>
			</div>

			<!-- User name input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="user_name">User name(*)</label> <input
					type="text" id="user_name" name="user_name"
					value="${param.user_name}" class="form-control" />
			</div>

			<div class="form-outline mb-2">
				<label class="form-label m-0" for="user_address">User
					address</label> <input type="text" id="user_address" name="user_address"
					value="${param.user_address}" class="form-control" />
			</div>

			<div class="form-outline mb-2">
				<label class="form-label m-0" for="user_phone">User phone</label>
				<input type="text" id="user_phone" name="user_phone"
					value="${param.user_phone}" class="form-control" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-success btn-block mt-5">Add
					new user</button>
			</div>
		</form>
	</div>
</main>

<c:import url="footer.jsp" />