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
                    <h1><strong>Register</strong></h1>
                    <c:url value="/register" var="post_url" />
                    <form:form method="POST" action="${post_url}" class="form-signin" commandName="registerNewUser">
                        <div class="form-group">
                            <label for="inputEmail">Email address</label>
                            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">New Password</label>
                            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="New Password" required>
                        </div>
                        <div class="form-group">
                            <label for="reInputPassword">Confirm Password</label>
                            <input type="password" name="passwordConfirm" id="reInputPassword" class="form-control" placeholder="Re-enter Password" required>
                        </div>
                        <div class="form-group">
                            <label for="newUsername">Enter New Username</label>
                            <input type="text" name="name" id="enterNewUserName" class="form-control" placeholder="Enter new username" required>
                        </div>
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Sign up</strong></button>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        </div>
    </body>
</html>
