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
                    <h1><strong>Add Ingredient</strong></h1>
                        <c:url value="/owner/addingredient" var="post_url" />
                        <form:form method="POST" action="${post_url}" class="form-signin" commandName="addIngredient">
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
                            <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Submit</strong></button>
                        </form:form>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <div class="row">
                        <table id="ing-table" class="table table-condensed">
                            <tr>
                                <th class="col-xs-3">Name</th>
                                <th class="col-xs-3">Desc.</th>
                                <th class="col-xs-3">Cat.</th>
                                <th class="col-xs-3">Icon Url</th>
                            </tr>
                            <c:forEach items="${ingredients}" var="i">
                            <tr>
                                <td class="col-xs-3">${i.getName()}</td>
                                <td class="col-xs-3">${i.getDescription()}</td>
                                <td class="col-xs-3">${i.getCategoryName()}</td>
                                <td class="col-xs-3">${i.getIconUrl()}</td>
                            </tr>
                            </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
