<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1><strong>Profile</strong></h1>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <c:if test="${not empty username}">
                <div class="row">
                    <div class="col-xs-0 col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
			<h3><strong>Username:</strong> ${username}</h3>
                        <h3><strong>Email Address:</strong> ${username}</h3>
                        <h3><strong>Password:</strong> <a href="<c:url value="/changepassword" />" class="btn btn-primary btn-lrg">Change Password</a></h3>
                        <h3><strong>Recent Drinks:</strong></h3>
                        <c:forEach items="${drinks}" var="drink">
                            <a href="#">
                                <div class="row">
                                    <div class="col-xs-0 col-md-1"></div>
                                    <div class="col-xs-3 col-md-1 drink-icon">
                                        <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" />
                                    </div>
                                    <div class="col-xs-9 col-md-5 drink-text">
                                        <h3><strong>${drink.getDrinkName()}</strong></h3>
                                        <p>
                                            <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                        </p>
                                    </div>
                                    <div class="col-xs-0 col-md-5"></div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                    <div class="col-xs-0 col-md-3"></div>
                </div>
            </c:if>
            <c:if test="${empty username}">
                <div class="row">
                    <div class="col-xs-0 col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                        <h1>Please log in!</h1>
                        <p>
                            You must be logged in to view your profile.
                        </p>
                    </div>
                    <div class="col-xs-0 col-md-3"></div>
                </div>
                <div class="row">
                    <div class="col-xs-0 col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                        <p>
                            <a href="<c:url value="/login" />" class="btn btn-primary btn-lrg btn-block"><strong>Login!</strong></a><br />
                            <a href="<c:url value="/register" />" class="btn btn-primary btn-lrg btn-block"><strong>Register!</strong></a>
                        </p>
                    </div>
                    <div class="col-xs-0 col-md-3"></div>
                </div>
            </c:if>
        </div>
    </body>
</html>
