<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <c:if test="${not empty username}">
                    <div class="row">
                        <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                            <h3><strong>User Menu</strong></h3>
                            <p><a href="<c:url value="/changepassword" />" class="btn btn-primary btn-lrg"><strong>Change Password</strong></a></p>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <jsp:directive.include file="/WEB-INF/jsp/admin/adminmenu.jsp"/>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_OWNER')">
                        <jsp:directive.include file="/WEB-INF/jsp/owner/ownermenu.jsp"/>
                    </sec:authorize>
                </div>
                <div class="col-md-9 col-md-pull-3">
                    <div class="row">
                     <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                            <h1><strong>Profile</strong></h1>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                			<h3><strong>Username:</strong> ${username}</h3>
                            <h3><strong>Email Address:</strong> ${email}</h3>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-5">
                            <h3><strong>Recent Drinks:</strong></h3>
                            <c:forEach items="${drinks}" var="drink">
                                <div class="row">
                                    <div class="col-xs-3 drink-icon">
                                        <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" />
                                    </div>
                                    <div class="col-xs-9 drink-text">
                                        <h3><strong>${drink.getDrinkName()}</strong></h3>
                                        <p>
                                            <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="col-xs-12 col-md-5">
                            <h3><strong>Recent Bars:</strong></h3>
                            <c:forEach items="${business}" var="bar">
                                <div class="row">
                                    <div class="col-xs-12 drink-text">
                                        <h3><strong>${bar.getName()}</strong></h3>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 drink-text">
                                        <p>
                                            ${bar.getAddress()}<br />
                                            ${bar.getCity()}, ${bar.getState()} ${bar.getZipcode()}
                                        </p>
                                    </div>
                                    <div class="col-xs-6 drink-text">
                                        <p>
                                            <strong>Phone Number:</strong><br />
                                            ${bar.getPhoneNumber()}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                </c:if>
                <c:if test="${empty username}">
                    <div class="row">
                     <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                            <h1><strong>Profile</strong></h1>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-10">
                            <h1>Please log in!</h1>
                            <p>
                                You must be logged in to view your profile.
                            </p>
                        </div>
                        <div class="col-xs-0 col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-xs-0 col-md-1"></div>
                        <div class="col-xs-12 col-md-5">
                            <p>
                                <a href="<c:url value="/login" />" class="btn btn-primary btn-lrg btn-block"><strong>Login!</strong></a><br />
                                <a href="<c:url value="/register" />" class="btn btn-primary btn-lrg btn-block"><strong>Register!</strong></a>
                            </p>
                        </div>
                        <div class="col-xs-0 col-md-6"></div>
                    </div>
                </c:if>
            </div>
        </div>
    </body>
</html>
