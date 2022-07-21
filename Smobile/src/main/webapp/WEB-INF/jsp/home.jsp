<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp">
	<c:param name="title"  value="Smobile"></c:param>
</c:import>
	<main>
        <div class="bg-light mx-5">
            <h2 class="ms-5 pt-5">Smobile</h2>
			<div class="row d-flex justify-content-evenly mx-3">
				<c:if test="${not empty listProducts}">
					<c:forEach var="row" items="${listProducts}">
						<div class="card col-md-6 col-lg-3 m-3 rounded-5" style="width: 18rem;">
							<a class="text-decoration-none text-dark" href='#'>
								<img src="${row.product_img_source}" class="card-img-top mt-3" alt="#">
								<div class="card-body">
									<h5 class="card-title fw-bold">${row.product_name}</h5>
									<p class="card-text fst-italic">${row.product_des}</p>
									<p class="card-text fst-italic text-danger fw-bold">${row.product_price} $</p>
									
									<form method="post" action="<c:url value="/cart/add?product_id=${row.product_id}"/>" class="float-end mb-3">
									  <button type="submit" class="btn btn-secondary">
									    Add to cart
									  </button>
									</form>
									
									
								</div>
							 </a>
						</div>
					</c:forEach>
				</c:if>
			</div>
        </div>
    </main>
<c:import url="footer.jsp"/>