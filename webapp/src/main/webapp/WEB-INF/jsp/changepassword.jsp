<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-4 col-md-push-8 invisible">
            </div>
            <div class="col-md-8 col-md-pull-4">
            <c:if test="${not empty error}">
                <div class="row bg-danger">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${error}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="row bg-success">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${success}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-0 col-md-1"></div>
                <div class="col-xs-12 col-md-10">
                    <h1><strong>Change Password</strong></h1>
                    <c:url value="/changepassword" var="post_url" />
                    <form:form method="POST" action="${post_url}" class="form-signin" commandName="changepassword">
                        <div class="form-group">
                            <label for="inputEmail">Email address</label>
                            <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" name="name" id="username" class="form-control" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <label for="currentpassword">Current Password</label>
                            <input type="password" name="currentpassword" id="currentpassword" class="form-control" placeholder="Current Password" required>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword">New Password</label>
                            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="New Password" required>
                        </div>
                        <div class="form-group">
                            <label for="reInputPassword">Confirm New Password</label>
                            <input type="password" name="passwordConfirm" id="reInputPassword" class="form-control" placeholder="Re-enter Password" required>
                        </div>
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Change Password</strong></button>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        </div>
    </body>
</html>
