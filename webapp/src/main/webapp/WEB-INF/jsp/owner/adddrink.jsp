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
                        <c:url value="/owner/adddrink" var="post_url" />
                        <form:form method="POST" action="${post_url}" class="form-signin" commandName="addDrink">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                            </div>
                            <div class="form-group">
                                <label for="info">Description</label>
                                <textarea rows="5" cols="50" type="text" name="info" id="info" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="makeTime">Make time (in seconds)</label>
                                <input type="text" name="makeTime" id="makeTime" class="form-control" placeholder="60" required>
                            </div>
                            <div class="form-group">
                                <label for="iconUrl">Icon Url</label>
                                <input type="text" name="iconUrl" id="iconUrl" class="form-control" placeholder="http://mycompany.com/logo.png" required>
                            </div>
                            <div class="form-group">
                                <label for="i1">Ingredient #1</label>
                                <select name="i1">
                                    <option value="0">None</option>
                                    <c:forEach items="${ingredients}" var="i">
                                    <option value="${i.getId()}">${i.getName()}</option>
                                    </c:forEach>
                                </select>
                                <br />
                                <label for="i2">Ingredient #2</label>
                                <select name="i2">
                                    <option value="0">None</option>
                                    <c:forEach items="${ingredients}" var="i">
                                    <option value="${i.getId()}">${i.getName()}</option>
                                    </c:forEach>
                                </select>
                                <br />
                                <label for="i3">Ingredient #3</label>
                                <select name="i3">
                                    <option value="0">None</option>
                                    <c:forEach items="${ingredients}" var="i">
                                    <option value="${i.getId()}">${i.getName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Submit</strong></button>
                        </form:form>
                        <div><div id="content"></div><nav><ul class="pagination" id="paginator"></ul></nav></div>
                        <jsp:directive.include file="/WEB-INF/jsp/javascript.jsp"/>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
