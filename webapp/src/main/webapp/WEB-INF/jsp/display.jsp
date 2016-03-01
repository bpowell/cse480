<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:forEach items="${drinks}" var="drink">
                <div class="row">
                    <a href="#">
                        <div class="col-xs-3 col-md-2">
                            <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" width="150"/>
                        </div>
                        <div class="col-xs-9 col-md-10">
                            <h3>${drink.getDrinkName()}</h3>
                            <p>
                                <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                <strong>User:</strong> ${drink.getUserId()}
                            </p>
                        </div>
                    </a>
                    <hr />
                </div>
            </c:forEach>
        </div>
            <div class="row container">
                <div class="col-xs-2">
                <a href="../drinklist/${bar_id}" class="btn btn-primary">Order a Drink!</a>
                </div>
                <div class="col-xs-10"></div>
            </div>
        </div>
    </body>
</html>
