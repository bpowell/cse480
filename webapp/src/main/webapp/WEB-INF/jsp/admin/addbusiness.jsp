<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <h2 class="form-signin-heading">Add Business</h2>
            <div class="col-sm-4">
                <c:url value="/admin/addbusiness" var="post_url" />
                <form:form method="POST" action="${post_url}" class="form-signin" commandName="addBusiness">
                    <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                    <div class="has-success">${success}</div>
                    </c:if>
                    <label for="name" class="sr-only">Name</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                    <label for="info" class="sr-only">Description</label>
                    <input type="text" name="info" id="info" class="form-control" placeholder="Description" required>
                    <label for="iconUrl" class="sr-only">Icon url</label>
                    <input type="text" name="iconUrl" id="iconUrl" class="form-control" placeholder="https://mycompany.com/logo.png" required>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Create Business</button>
                </form:form>
            </div>
        </div>
    </body>
</html>
