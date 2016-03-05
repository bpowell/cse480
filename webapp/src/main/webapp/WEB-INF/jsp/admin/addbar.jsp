<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container">
            <h2 class="form-signin-heading">Add Bar</h2>
            <div class="col-sm-4">
                <c:url value="/admin/addbar" var="post_url" />
                <form:form method="POST" action="${post_url}" class="form-signin" commandName="addBar">
                    <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty success}">
                    <div class="has-success">${success}</div>
                    </c:if>
                    <label for="name" class="sr-only">Name</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Name" required autofocus>
                    <select name="businessId">
                        <c:forEach items="${businesses}" var="business">
                        <option value="${business.getId()}">${business.getName()}</option>
                        </c:forEach>
                    </select>
                    <br />
                    <select name="userId">
                        <c:forEach items="${users}" var="user">
                        <option value="${user.getId()}">${user.getEmail()} - ${user.getRole()}</option>
                        </c:forEach>
                    </select>
                    <label for="address" class="sr-only">Address</label>
                    <input type="text" name="address" id="address" class="form-control" placeholder="123 Main Street" required>
                    <label for="city" class="sr-only">City</label>
                    <input type="text" name="city" id="city" class="form-control" placeholder="Rochester" required>
                    <label for="state" class="sr-only">State</label>
                    <input type="text" name="state" id="state" class="form-control" placeholder="MI" required>
                    <label for="zipcode" class="sr-only">ZipCode</label>
                    <input type="number" name="zipcode" id="zipcode" class="form-control" placeholder="48309" required>
                    <label for="phonenumber" class="sr-only">Phonenumber</label>
                    <input type="number" name="phonenumber" id="phonenumber" class="form-control" placeholder="5865551234" required>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Create Business</button>
                </form:form>
            </div>
        </div>
    </body>
</html>
