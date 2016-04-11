<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <jsp:directive.include file="/WEB-INF/jsp/owner/ownermenu.jsp"/>
            </div>
            <div class="col-md-9 col-md-pull-3">
            <c:if test="${not empty error}">
                <div class="row bg-danger">
                    <div class="col-xs-0"></div>
                    <div class="col-xs-12">
                        <h3>${error}</h3>
                    </div>
                    <div class="col-xs-0"></div>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="row bg-success">
                    <div class="col-xs-0"></div>
                    <div class="col-xs-12">
                        <h3>${success}</h3>
                    </div>
                    <div class="col-xs-0"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-0 col-md-1"></div>
                <div class="col-xs-12 col-md-10">
                    <h1><strong>Remove Bartender</strong></h1>
                    <c:url value="/owner/removebartender" var="post_url" />
                    <form:form method="POST" action="${post_url}" class="form-signin">
                        <div class="form-group">
                            <label for="ownerId">Bartender</label><br />
                            <select name="userId">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.getId()}">${user.getEmail()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Update</strong></button>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        </div>
    </body>
</html>
