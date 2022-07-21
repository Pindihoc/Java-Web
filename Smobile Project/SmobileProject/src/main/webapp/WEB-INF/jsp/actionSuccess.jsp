<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="header.jsp">
	<c:param name="title" value="Success"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">
		<div class="m-5 p-5 bg-light rounded-3 d-flex flex-column">

				<h1>Action complete!</h1>

				<a class="btn btn-secondary mt-5" href="<c:url value="/account"/>"
					role="button">Back to view results</a>

		</div>
	</div>
</main>

<c:import url="footer.jsp" />