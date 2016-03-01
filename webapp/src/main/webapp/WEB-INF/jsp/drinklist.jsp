<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:forEach items="${drinks}" var="drink">
                <div class="row">
                    <a href="#">
                        <div class="col-xs-3 col-md-2">
                            <img src="<c:url value="${drink.getIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getName()} icon" width="150"/>
                        </div>
                        <div class="col-xs-9 col-md-10">
                            <h3>${drink.getName()}</h3>
                            <p>
                                <strong>Make Time:</strong> ${drink.getMakeTime()} Seconds<br />
                                <strong>Description:</strong><br />
                                ${drink.getInfo()}
                            </p>
                        </div>
                    </a>
                    <hr />
                </div>
            </c:forEach>
        </div>
    </body>
</html>
