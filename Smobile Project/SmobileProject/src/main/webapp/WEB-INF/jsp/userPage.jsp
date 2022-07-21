<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="header.jsp">
	<c:param name="title" value="User page"></c:param>
</c:import>

<main>
	<div class="m-5">
		<h1>
			<em class="bi bi-person-workspace"> Welcome to admin-page,
				${username}!</em>
		</h1>
		<table class="table table-striped m-5">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Sales</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>10</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>11</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Kris</td>
					<td>12</td>
				</tr>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			$("#logout-btn").removeClass("d-none");
			$("#login-btn").addClass("d-none");
		});
	</script>
</main>

<c:import url="footer.jsp" />