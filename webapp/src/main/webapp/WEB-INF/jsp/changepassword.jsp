<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
        <body>
                        <div class="col-lg-12 mainContent">
                        <h2 class="form-signin-heading">Change Password</h2>
                                <c:url value="/changepassword" var="post_url" />
                                <form:form method="POST" action="${post_url}" class="form-signin" commandName="changepassword">
                                        <c:if test="${not empty error}">
                                        <div class="error">${error}</div>
                                        </c:if>
                                        <c:if test="${not empty success}">
                                        <div class="has-success">${success}</div>
                                        </c:if>
                                        <label for="inputEmail" class="sr-only">Email address</label>
                                        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                        <label for="username" class="sr-only">Username</label>
                                        <input type="text" name="name" id="username" class="form-control" placeholder="Username" required>
                                        <label for="currentpassword" class="sr-only">Current Password</label>
                                        <input type="password" name="currentpassword" id="currentpassword" class="form-control" placeholder="Current Password" required>
                                        <br />
                                        <label for="inputPassword" class="sr-only">New Password</label>
                                        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="New Password" required>
                                        <label for="reInputPassword" class="sr-only">Re-enter Password</label>
                                        <input type="password" name="passwordConfirm" id="reInputPassword" class="form-control" placeholder="Re-enter Password" required>
                                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Change Password</button>
                                </form:form>
                        </div>
        </body>
</html>
