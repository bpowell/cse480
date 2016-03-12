<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container">
            <h2 class="form-signin-heading">Remove Bartender</h2>
            <div class="col-sm-4">
                <c:url value="/owner/removebartender" var="post_url" />
                <form:form method="POST" action="${post_url}" class="form-signin">
                    <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                    <div class="has-success">${success}</div>
                    </c:if>
                    <select name="userId">
                        <c:forEach items="${users}" var="user">
                        <option value="${user.getId()}">${user.getEmail()}</option>
                        </c:forEach>
                    </select>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                </form:form>
            </div>
        </div>
    </body>
</html>
