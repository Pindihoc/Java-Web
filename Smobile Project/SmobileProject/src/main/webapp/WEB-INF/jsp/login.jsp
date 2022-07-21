<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="header.jsp">
	<c:param name="title" value="Log in"></c:param>
</c:import>

<main>
	<div class="d-flex justify-content-center col">
		<form class="m-5 p-5 bg-light rounded-3" id="login_form"
			action='<c:url value="/dologin"/>' method="post">

			<!-- Error form -->
			<div class="text-center text-danger">
				<p>
					<i><strong>${error}</strong></i>
				</p>
			</div>

			<!-- Email input -->
			<div class="form-outline mb-8">
				<input type="text" id="username" name="username"
					value="${param.username}" class="form-control" placeholder="name@example.com"/> <label
					class="form-label" for="username">Username</label>
			</div>

			<!-- Password input -->
			<div class="form-outline mb-8">
				<input type="password" id="password" name="password"
					value="${param.password}" class="form-control" /> <label
					class="form-label" for="password">Password</label>
			</div>

			<!-- 2 column grid layout for inline styling -->
			<div class="row mb-8">
				<div class="col">
					<!-- Checkbox -->
					<div class="form-check">
						<input class="form-check-input bg-secondary border-secondary"
							type="checkbox" value="" id="rememberme" checked /> <label
							class="form-check-label" for="rememberme"> Remember me </label>
					</div>
				</div>

				<div class="col">
					<!-- Simple link -->
					<a class="text-secondary" href="#!">Forgot password?</a>
				</div>
			</div>

			<!-- Submit button -->
			<div class="d-flex justify-content-center">
				<button type="submit" class="btn btn-secondary btn-block mb-4">Log
					in</button>
			</div>

			<!-- Register buttons -->
			<div class="text-center">
				<p>
					Not a member? <a class="text-secondary"
						href='<c:url value="/register"/>'>Register</a>
				</p>
			</div>
		</form>
	</div>
</main>

<c:import url="footer.jsp" />