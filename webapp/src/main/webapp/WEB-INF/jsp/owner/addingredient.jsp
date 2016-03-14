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
                    <h1><strong><a href="<c:url value='/owner/'/>">Owner</a> &frasl;<br />
                        Add Ingredient</strong></h1>
                        <c:url value="/owner/addingredient" var="post_url" />
                        <div class="row">
                            <div class="col-md-2">Name</div>
                            <div class="col-md-2">Description</div>
                            <div class="col-md-2">Category</div>
                            <div class="col-md-2">Icon Url</div>
                        </div>
                        <c:forEach items="${ingredients}" var="i">
                            <div class="row">
                                <div class="col-md-2">${i.getName()}</div>
                                <div class="col-md-2">${i.getDescription()}</div>
                                <div class="col-md-2">${i.getCategoryName()}</div>
                                <div class="col-md-2">${i.getIconUrl()}</div>
                            </div>
                        </c:forEach>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
