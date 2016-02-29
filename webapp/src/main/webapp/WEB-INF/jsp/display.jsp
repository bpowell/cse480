<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:forEach items="${drinks}" var="drinkorder">
                <div class="row">
                    <a href="#">
                        <div class="col-xs-3 col-md-2">
                            <img src="<c:url value="${drinkorder.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drinkorder.getDrinkName()} icon" width="150"/>
                        </div>
                        <div class="col-xs-9 col-md-10">
                            <h3>${drinkorder.getDrinkName()}</h3>
                            <p>
                                <strong>Quantity:</strong> ${drinkorder.getDrinkCount()}<br />
                                <strong>User:</strong> ${drinkorder.getUserId()}
                            </p>
                        </div>
                    </a>
                    <hr />
                </div>
            </c:forEach>
        </div>
    </body>
</html>
