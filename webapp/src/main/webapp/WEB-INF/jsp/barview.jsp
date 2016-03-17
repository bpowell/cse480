<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1><strong>Bar List</strong></h1>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                    </div>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <c:forEach items="${businesses}" var="b">
                <c:forEach items="${b.getBars()}" var="bar">
                    <div class="bar-info container">
                        <div class="row">
                        <%-- TEMPORARY --%>
                            <div class="col-xs-0 col-md-4"></div>
                            <div class="col-xs-12 col-md-4 bar-text">
                                <h1><strong>${bar.getName()}</strong></h1>
                            </div>
                            <div class="col-xs-0 col-md-4"></div>
                        <%-- When we get icons working for each business
                            <div class="col-xs-3 col-md-2 bar-icon">
                                <img class="img-fluid img-rounded" alt="${bar.getName()} icon" src="<c:url value="${b.getIconUrl()}" />" />
                            </div>
                            <div class="col-xs-9 col-md-10 bar-text">
                                <h3><strong>${bar.getName()}</strong></h3>
                            </div>
                        --%>
                        </div>
                        <div class="row">
                            <div class="col-xs-0 col-md-4"></div>
                            <div class="col-xs-3 col-md-1">
                                <p>
                                    <strong>Phone</strong>
                                </p>
                            </div>
                            <div class="col-xs-9 col-md-3">
                                <p>
                                        ${bar.getPhoneNumber()}<br />
                                </p>
                            </div>
                            <div class="col-xs-0 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-0 col-md-4"></div>
                            <div class="col-xs-3 col-md-1">
                                <p>
                                    <strong>Address</strong><br />
                                </p>
                            </div>
                            <div class="col-xs-9 col-md-3">
                                <p>
                                        ${bar.getAddress()}<br />
                                        ${bar.getCity()} ${bar.getZipcode()} ${bar.getState()}<br />
                                </p>
                            </div>
                            <div class="col-xs-0 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-0 col-md-4"></div>
                            <div class="col-xs-3 col-md-1">
                                <p>
                                    <strong>Hours</strong><br />
                                </p>
                            </div>
                            <div class="col-xs-9 col-md-3">
                                <p>
                                        Monday: ${bar.getMondayHours()}<br />
                                        Tuesday: ${bar.getTuesdayHours()}<br />
                                        Wednesday: ${bar.getWednesdayHours()}<br />
                                        Thursday: ${bar.getThursdayHours()}<br />
                                        Friday: ${bar.getFridayHours()}<br />
                                        Saturday: ${bar.getSaturdayHours()}<br />
                                        Sunday: ${bar.getSundayHours()}
                                </p>
                            </div>
                            <div class="col-xs-0 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-0 col-md-4"></div>
                            <div class="col-xs-12 col-md-4">
                                <a href="<c:url value="/display/${bar.getId()}" />" class="btn btn-primary btn-lrg btn-block"><strong>Order Drinks Here!</strong></a>
                            </div>
                            <div class="col-xs-0 col-md-4"></div>
                        </div>
                    </div>
                </c:forEach>
            </c:forEach>
        </div>
    </body>
</html>
