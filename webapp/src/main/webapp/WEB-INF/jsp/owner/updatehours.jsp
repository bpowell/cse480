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
                        Update Hours</strong></h1>
                    <c:url value="/owner/updatehours" var="post_url" />
                    <c:forEach items="${bars}" var="bar">
                        <form:form method="POST" action="${post_url}" class="form-signin" commandName="hours">
                            <div class="form-group">
                                Name: ${bar.getName()}<br />
                                Address: ${bar.getAddress()}<br />
                                City: ${bar.getCity()}<br />
                                State: ${bar.getState()}<br />
                                Phone Number: ${bar.getPhoneNumber()}
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="barId" value="${bar.getId()}" >
                                <label for="sundayHours">Sunday Hours</label><br />
                                <input type="text" name="sundayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="mondayHours">Monday Hours</label><br />
                                <input type="text" name="mondayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="tuesdayHours">Tuesday Hours</label><br />
                                <input type="text" name="tuesdayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="wednesdayHours">Wednesday Hours</label><br />
                                <input type="text" name="wednesdayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="thursdayHours">Thursday Hours</label><br />
                                <input type="text" name="thursdayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="fridayHours">Friday Hours</label><br />
                                <input type="text" name="fridayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="saturdayHours">Saturday Hours</label><br />
                                <input type="text" name="saturdayHours" value="${bar.getSundayHours()}" >
                            </div>
                            <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Update</strong></button>
                        </form:form>
                    </c:forEach>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
