<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="col-lg-12 mainContent">
            <div class="card-deck-wrapper">
                <div class="card-deck">
                    <c:forEach items="${drinks}" var="drink">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-6">
                                <div class="card">
                                    <%-- <img class="card-img"> --%>
                                    <div class="card-block display-drink">
                                        <img src="${drink.getIconUrl()}" class="img-thumbnail" alt="${drink.getName()} icon" width="150" height="150"/>
                                        <h4 class="card-title">${drink.getName()}</h4>
                                        <p class="card-text">Make Time:<br />${drink.getMakeTime()}</p>
                                        <p class="card-text">Description:<br />${drink.getInfo()}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3"></div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
