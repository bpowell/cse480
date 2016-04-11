<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9 invisible">
            </div>
            <div class="col-md-9 col-md-pull-3">
            <c:if test="${not empty error}">
                <div class="row bg-danger">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${error}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="row bg-danger">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${msg}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-0 col-md-1"></div>
                <div class="col-xs-12 col-md-10">
                    <h1><strong>Please Sign In</strong></h1>
                    <form method="POST" name="loginForm" action="<c:url value='/login' />" class="form-signin">
                        <div class="form-group">
                            <label for="username">Email address</label>
                            <input name="username" type="email" id="username" class="form-control" placeholder="Email address" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input name="password" type="password" id="password" class="form-control" placeholder="Password" required>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember-me" type="checkbox" value="remember-me"> Remember me
                            </label>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Sign in</strong></button>
                        <a class="btn btn-primary btn-lg btn-block" href="<c:url value="/register" />"><strong>Register for an account!</strong></a>
                    </form>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        </div>
    </body>
</html>
