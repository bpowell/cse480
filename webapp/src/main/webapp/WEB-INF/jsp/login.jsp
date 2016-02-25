<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <c:if test="${not empty error}">
        <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
        </c:if>

        <div class="col-lg-12 mainContent">
            <h2 class="form-signin-heading">Returning Users: Please Sign In</h2>
            <form method="POST" name="loginForm" action="<c:url value='/login' />" class="form-signin">
                <label for="username" class="sr-only">Email address</label>
                <input name="username" type="email" id="username" class="form-control" placeholder="Email address" required autofocus>
                <label for="password" class="sr-only">Password</label>
                <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
			    <div class="checkbox">
				    <label>
						<input name="remeber-me" type="checkbox" value="remember-me"> Remember me
					</label>
				</div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            </form>
        </div>
    </body>
</html>
