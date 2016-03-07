<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="col-md-4">
            <%-- Profile Image --%>
            <div id="accountSettings">
                <%-- Account Settings --%>
            </div>
        </div>
        <div class="container mainContent">
            <h1>${username}</h1>
            <div id="userStats">
                <h3>Drink Score: x</h3>
                <h3>Recent Drinks:</h3>
                <c:forEach items="${drinks}" var="drink">
                    <div class="row">
                        <a href="#">
                            <div class="col-xs-3 col-md-2">
                                <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" width="150"/>
                            </div>
                            <div class="col-xs-9 col-md-10">
                                <h3>${drink.getDrinkName()}</h3>
                                <p>
                                    <strong>Comments:</strong> ${drink.getComments()}
                                </p>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
