<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:if test="${empty admin_mail}">
	<c:redirect url="/account" />
</c:if>
<c:import url="header.jsp">
	<c:param name="title" value="Admin Infomation"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">

			<form class="m-5 p-5 bg-light rounded-3" id="login_form"
				action='<c:url value="/account/doEdit?type=admin"/>' method="post">

				<!-- Error form -->
				<div class="text-center text-danger">
					<p>
						<i><strong>${error}</strong></i>
					</p>
				</div>

				<!-- Email input -->
				<div class="form-outline mb-2">
					<label class="form-label m-0" for="username">Admin mail(*)</label>
					<input type="text" id="username" name="admin_mail"
						value="${admin_mail}" class="form-control"
						readonly />
				</div>

				<!-- Password input -->
				<div class="form-outline mb-2">
					<label class="form-label m-0" for="password">Password(*)</label> <input
						type="password" id="password" name="password"
						value="${password}" class="form-control" />
				</div>

				<div class="form-outline mb-2">
					<label class="form-labe m-0l" for="admin_name">Admin
						name(*)</label> <input type="text" id="admin_name" name="admin_name"
						value="${admin_name}" class="form-control" />
				</div>

				<div class="form-outline mb-2">
					<label class="form-label m-0" for="admin_address">Admin
						address</label> <input type="text" id="admin_address" name="admin_address"
						value="${admin_address}" class="form-control" />
				</div>

				<div class="form-outline mb-2">
					<label class="form-label m-0" for="admin_phone">Admin phone</label>
					<input type="text" id="admin_phone" name="admin_phone"
						value="${admin_phone}" class="form-control" />
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