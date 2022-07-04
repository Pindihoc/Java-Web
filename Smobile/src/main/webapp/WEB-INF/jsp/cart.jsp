<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:import url="header.jsp">
	<c:param name="title"  value="Cart"></c:param>
</c:import>

<main>
	<div class="m-5 p-5">
		<c:if test="${empty cart}">
			<h2 class=" d-flex justify-content-center">Your cart is empty
				now..</h2>
		</c:if>

		<c:if test="${not empty cart}">
			<div class="row d-flex justify-content-evenly mx-3">
				<h2 class="m-3">Your Cart</h2>
				<hr />
				<c:forEach var="e" items="${cart}">
					<div class="card col-md-6 col-lg-3 m-3 rounded-5"
						style="width: 18rem;">
						<a class="text-decoration-none text-dark" href='#'> <img
							src="${e.key.product_img_source}" class="card-img-top mt-3"
							alt="#">
							<div class="card-body">
								<h5 class="card-title fw-bold">${e.key.product_name}</h5>
								<p class="card-text fst-italic">${e.key.product_des}</p>
								<p class="card-text fst-italic text-danger fw-bold">${e.key.product_price}$</p>
								<p class="float-end mb-3 border rounded-pill">
									<c:out value="${e.value}" />
								</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</main>

<c:import url="footer.jsp"/>