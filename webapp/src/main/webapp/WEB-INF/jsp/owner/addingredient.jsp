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
                        <form:form method="POST" action="${post_url}" class="form-signin">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea rows="5" cols="50" type="text" name="description" id="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="iconUrl">Image URL</label>
                                <input type="text" name="iconUrl" id="iconUrl" class="form-control" placeholder="https://mybeer.com/logo.png" required>
                            </div>
                            <div class="form-group">
                                <label for="ownerId">Category</label><br />
                                <select name="category">
                                    <c:forEach items="${categories}" var="c">
                                    <option value="${c.getId()}">${c.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Update</strong></button>
                        </form:form>

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
