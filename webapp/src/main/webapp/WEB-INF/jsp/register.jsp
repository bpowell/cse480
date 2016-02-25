<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
        <body>
                <div class="col-lg-12 mainContent">
                        <h2 class="form-signin-heading">New User Sign Up</h2>
                        <c:url value="/register" var="post_url" />
                        <form:form method="POST" action="${post_url}" class="form-signin" commandName="registerNewUser">
                                <c:if test="${not empty error}">
                                <div class="error">${error}</div>
                                </c:if>
                                <label for="inputEmail" class="sr-only">Email address</label>
                                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                <label for="inputPassword" class="sr-only">New Password</label>
                                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="New Password" required>
                                <label for="reInputPassword" class="sr-only">Re-enter Password</label>
                                <input type="password" name="passwordConfirm" id="reInputPassword" class="form-control" placeholder="Re-enter Password" required>
                                <label for="newUsername" class="sr-only">Enter New Username</label>
                                <input type="text" name="name" id="enterNewUserName" class="form-control" placeholder="Enter new username" required>
                                <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
                        </form:form>
                </div>
        </body>
</html>
