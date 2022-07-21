<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="header.jsp">
	<c:param name="title" value="User Infomation"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">
		<form class="m-5 p-5 bg-light rounded-3" id="login_form"
			action='<c:url value="/account/doEdit?type=user"/>' method="post">

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
					value="${user_mail}" class="form-control"
					readonly />
			</div>

			<!-- Password input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="password">Password(*)</label> <input
					type="password" id="password" name="password"
					value="${password}" class="form-control" />
			</div>

			<!-- Account role input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="account_role">Account role(*)</label> <input
					type="text" id="account_role" name="account_role"
					value="${account_role}" class="form-control" />
			</div>

			<!-- User name input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="user_name">User name(*)</label> <input
					type="text" id="user_name" name="user_name"
					value="${user_name}" class="form-control" />
			</div>

			<div class="form-outline mb-2">
				<label class="form-label m-0" for="user_address">User
					address</label> <input type="text" id="user_address" name="user_address"
					value="${user_address}" class="form-control" />
			</div>

			<div class="form-outline mb-2">
				<label class="form-label m-0" for="user_phone">User phone</label> <input
					type="text" id="user_phone" name="user_phone"
					value="${user_phone}" class="form-control" />
			</div>
			
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="account_state">Account state</label> <input
					type="text" id="account_state" name="account_state"
					value="${account_state}" class="form-control" />
			</div>
			
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="false_login_count">False login count</label> <input
					type="text" id="false_login_count" name="false_login_count"
					value="${false_login_count}" class="form-control" />
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center">
				<a type="button" href="<c:url value="/account"/>"
					class="btn btn-secondary btn-block btn-sm mt-5 mx-3">Back to
					view</a>
				<button type="submit"
					class="btn btn-secondary btn-block btn-sm mt-5 mx-3">Edit</button>
			</div>
		</form>
	</div>
</main>

<c:import url="footer.jsp" />