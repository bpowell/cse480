<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:if test="${not empty error}">
                <div class="row bg-danger">
                    <div class="col-xs-0 col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                        <h3>${error}</h3>
                    </div>
                    <div class="col-xs-0 col-md-3"></div>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="row bg-success">
                    <div class="col-xs-0 col-md-3"></div>
                    <div class="col-xs-12 col-md-6">
                        <h3>${success}</h3>
                    </div>
                    <div class="col-xs-0 col-md-3"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1><strong><a href="<c:url value='/admin/'/>">Admin</a> &frasl;<br />
                        Add Business</strong></h3>
                    <c:url value="/admin/addbusiness" var="post_url" />
                    <form:form method="POST" action="${post_url}" class="form-signin" commandName="addBusiness">
                        <div class="form-group">
                            <label for="name">Business Name</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="info">Business Description</label>
                            <textarea name="info" id="info" class="form-control" rows="4" placeholder="Description" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="iconUrl">Business Image URL</label>
                            <input type="text" name="iconUrl" id="iconUrl" class="form-control" placeholder="https://mycompany.com/logo.png" required>
                        </div>
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Create Business</strong></button>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
