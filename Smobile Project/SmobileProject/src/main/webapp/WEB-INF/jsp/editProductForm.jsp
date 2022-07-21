<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:import url="header.jsp">
	<c:param name="title" value="New Product"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">
		<form class="m-5 p-5 bg-light rounded-3" id="login_form"
			action='<c:url value="/account/doEdit?type=product"/>' method="post">

			<!-- Error form -->
			<div class="text-center text-danger">
				<p>
					<i><strong>${error}</strong></i>
				</p>
			</div>

			<!-- Email input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="product_id">Product ID(*)</label>
				<input type="text" id="product_id" name="product_id"
					value="${product_id}" class="form-control" readonly />
			</div>

			<!-- Email input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="product_name">Product
					name(*)</label> <input type="text" id="product_name" name="product_name"
					value="${product_name}" class="form-control" />
			</div>

			<!-- Password input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="product_des">Product
					description</label>
				<textarea id="product_des" name="product_des" class="form-control"
					aria-label="With textarea">${product_des}</textarea>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-2">
				<label class="form-label m-0" for="product_price">Product
					price(*)</label> <input type="text" id="product_price" name="product_price"
					value="${product_price}" class="form-control" />
			</div>

			<!-- User name input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="product_img_source">Product
					image source</label> <input type="text" id="product_img_source"
					name="product_img_source" value="${product_img_source}"
					class="form-control" />
			</div>

			<!-- Account role input -->
			<div class="form-outline mb-2">
				<label class="form-labe m-0" for="category_id">Category ID</label> <input
					type="text" id="category_id" name="category_id"
					value="${category_id}" class="form-control" />
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