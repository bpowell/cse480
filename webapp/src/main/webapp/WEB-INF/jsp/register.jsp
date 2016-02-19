<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>CSE480</title>

                <%-- Bootstrap core CSS --%>
                <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css" />
        </head>

        <body>
                <div class="container">
                        <h2 class="form-signin-heading">Sign Up</h2>
                        <div class="col-sm-4">
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
                </div>
        </body>
</html>
