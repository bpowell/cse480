<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <jsp:directive.include file="/WEB-INF/jsp/admin/adminmenu.jsp"/>
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
                    <h1><strong>Add Bar</strong></h1>
                    <c:url value="/admin/addbar" var="post_url" />
                    <form:form method="POST" action="${post_url}" class="form-signin" commandName="addBar">
                        <div class="form-group">
                            <label for="businessId">Business Name</label><br />
                            <select name="businessId">
                                <c:forEach items="${businesses}" var="business">
                                    <option value="${business.getId()}">${business.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="ownerId">Bar Owner</label><br />
                            <select name="ownerId">
                                <c:forEach items="${users}" var="user">
                                    <option value="${user.getId()}">${user.getEmail()} - ${user.getRole()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name">Bar Name</label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" name="address" id="address" class="form-control" placeholder="123 Main Street" required>
                        </div>
                        <div class="form-group col-xs-6 col-sm-7">
                                <label for="city" class="sr-only">City</label>
                                <input type="text" name="city" id="city" class="form-control" placeholder="Rochester" required>
                        </div>
                        <div class="form-group col-xs-2 col-sm-2">
                                <label for="state" class="sr-only">State</label>
                                <input type="text" name="state" id="state" class="form-control" placeholder="MI" required>
                        </div>
                        <div class="form-group col-xs-4 col-sm-3">
                                <label for="zipcode" class="sr-only">ZipCode</label>
                                <input type="number" name="zipcode" id="zipcode" class="form-control" placeholder="48309" required>
                        </div>
                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="number" name="phoneNumber" id="phoneNumber" class="form-control" placeholder="5865551234" required>
                        </div>
                        <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Create Bar</strong></button>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
            </div>
        </div>
    </body>
</html>
