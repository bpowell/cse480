<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <jsp:directive.include file="/WEB-INF/jsp/owner/ownermenu.jsp"/>
            </div>
            <div class="col-md-9 col-md-pull-3">
            <c:if test="${not empty error}">
                <div class="row bg-danger">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${error}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="row bg-success">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3>${success}</h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
            </c:if>
            <div class="row">
                <div class="col-xs-0 col-md-1"></div>
                <div class="col-xs-12 col-md-10">
                    <h1><strong>Add Drink</strong></h1>
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
                                <label for="price">Price</label>
                                <input type="text" name="price" id="orice" class="form-control" placeholder="2.00" required>
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
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
            <hr />
            <div class="row">
                <div>
                    <div class="col-md-6">
                        <center>Drinks At This Bar:</center>
                        <div id="bardrinks"></div>
                        <nav><ul class="pagination" id="barpaginator"></ul></nav>
                    </div>
                    <div class="col-md-6">
                        <center>All Drinks:</center>
                        <div id="alldrinks"></div>
                        <nav><ul class="pagination" id="allpaginator"></ul></nav>
                    </div>
                </div>
                <jsp:directive.include file="/WEB-INF/jsp/javascript2.jsp"/>
            </div>
        </div>
        </div>
    </body>
</html>
