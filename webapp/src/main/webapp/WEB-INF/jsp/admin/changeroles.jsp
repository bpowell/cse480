<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <h2 class="form-signin-heading">Change User Roles</h2>
            <div class="col-sm-4">
                <c:url value="/admin/changeroles" var="post_url" />
                <form:form method="POST" action="${post_url}" class="form-signin" commandName="addBusiness">
                    <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                    <div class="has-success">${success}</div>
                    </c:if>
                    <select name="userId">
                        <c:forEach items="${users}" var="user">
                        <option value="${user.getId()}">${user.getEmail()} - ${user.getRole()}</option>
                        </c:forEach>
                    </select>
                    <select name="roleId">
                        <c:forEach items="${roles}" var="role">
                        <option value="${role.getId()}">${role.getInfo()}</option>
                        </c:forEach>
                    </select>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
                </form:form>
            </div>
        </div>
    </body>
</html>
