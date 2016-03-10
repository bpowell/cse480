<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
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
            <c:forEach items="${drinks}" var="drink">
                <a href="#">
                    <div class="row">
                        <div class="col-xs-0 col-md-3"></div>
                        <div class="col-xs-3 col-md-1 drink-icon">
                            <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" />
                        </div>
                        <div class="col-xs-9 col-md-5 drink-text">
                            <h3><strong>${drink.getDrinkName()}</strong></h3>
                            <p>
                                <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                <strong>User:</strong> ${drink.getUserName()}
                            </p>
                        </div>
                        <div class="col-xs-0 col-md-3"></div>
                    </div>
                </a>
            </c:forEach>
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <a href="<c:url value="/drinklist/${bar_id}" />" class="btn btn-primary btn-lrg btn-block">Order a Drink!</a>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
    </body>
</html>
