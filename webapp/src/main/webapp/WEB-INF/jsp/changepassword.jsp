<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
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
                        <h2 class="form-signin-heading">Change Password</h2>
                        <div class="col-sm-4">
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
                </div>
        </body>
</html>
