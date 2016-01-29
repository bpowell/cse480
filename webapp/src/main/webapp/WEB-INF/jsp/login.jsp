<%@page session="true"%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>CSE480</title>

        <%-- Bootstrap core CSS --%>
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <c:if test="${not empty error}">
        <div class="error">${error}</div>
        </c:if>
        <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
        </c:if>

        <div class="container">
            <h2 class="form-signin-heading">Please Sign In</h2>
            <div class="col-sm-8">
                <h3>Returning Users:</h3>
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
        </div>
    </body>
</html>
