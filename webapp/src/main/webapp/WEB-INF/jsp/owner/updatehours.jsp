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
                    <h1><strong>Update Hours</strong></h1>
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
                                <input id="sundayHours" type="text" name="sundayHours" value="${bar.getSundayHours()}" >
                                <br />
                                <label for="mondayHours">Monday Hours</label><br />
                                <input id="mondayHours" type="text" name="mondayHours" value="${bar.getMondayHours()}" >
                                <br />
                                <label for="tuesdayHours">Tuesday Hours</label><br />
                                <input id="tuesdayHours" type="text" name="tuesdayHours" value="${bar.getTuesdayHours()}" >
                                <br />
                                <label for="wednesdayHours">Wednesday Hours</label><br />
                                <input id="wednesdayHours" type="text" name="wednesdayHours" value="${bar.getWednesdayHours()}" >
                                <br />
                                <label for="thursdayHours">Thursday Hours</label><br />
                                <input id="thursdayHours" type="text" name="thursdayHours" value="${bar.getThursdayHours()}" >
                                <br />
                                <label for="fridayHours">Friday Hours</label><br />
                                <input id="fridayHours" type="text" name="fridayHours" value="${bar.getFridayHours()}" >
                                <br />
                                <label for="saturdayHours">Saturday Hours</label><br />
                                <input id="saturdayHours" type="text" name="saturdayHours" value="${bar.getSaturdayHours()}" >
                            </div>
                            <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit"><strong>Update</strong></button>
                        </form:form>
                    </c:forEach>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        </div>
    </body>
</html>
