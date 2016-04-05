<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:if test="${empty display}">
                <div class="row">
                    <div class="col-xs-0 col-md-2"></div>
                    <div class="col-xs-12 col-md-8">
                        <h1><strong>Drink Queue</strong></h1>
                    </div>
                    <div class="col-xs-0 col-md-2"></div>
                </div>
            </c:if>
            <c:forEach items="${drinks}" var="drink">
                <a href="#" data-toggle="modal" data-target="#id${drink.getId()}">
                    <div class="row">
                        <div class="col-xs-0 col-md-2"></div>
                        <div class="col-xs-3 col-md-1 drink-icon">
                            <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" />
                        </div>
                        <div class="col-xs-9 col-md-5 drink-text">
                            <h3><strong>${drink.getDrinkName()}</strong></h3>
                            <p>
                                <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                <strong>User:</strong> ${drink.getUserName()}<br />
                                <strong>Price: $</strong>${drink.getPrice()}
                            </p>
                        </div>
                        <c:if test="${canClear}">
                            <div class="col-xs-12 col-md-2 drink-clearorder">
                                <a onclick="clearOrder(${drink.getId()});" type="button" class="btn btn-primary btn-block"><strong>Clear Order</strong></a>
                            </div>
                        </c:if>
                        <div class="col-xs-0 col-md-2"></div>
                    </div>
                </a>
                <sec:authorize access="!hasRole('ROLE_DISPLAY')">
                    <div class="modal fade drink-modal-lg" id="id${drink.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${drink.getDrinkName()}" />Modal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-xs-10 col-md-11">
                                        <strong class="h3">${drink.getDrinkName()}</strong>
                                    </div>
                                    <div class="col-xs-2 col-md-1">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    </div>
                                </div>
                                <div class="modal-body">  
                                    <p>
                                        <strong>Stuff goes here!</strong>
                                        Right? We want stuff here?<br />
                                        Yes... yes we do.
                                    </p>
                                </div>
                                <div class="modal-footer">
                                    <sec:authorize access="isAuthenticated()">
                                        <a href="#" type="button" class="btn btn-primary">Order ${q.getDrinkName()}</a>
                                    </sec:authorize>
                                    <sec:authorize access="isAnonymous()">
                                        <a href="<c:url value="/login" />" type="button" class="btn btn-primary">Sign in to Order!</a>
                                    </sec:authorize>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </sec:authorize>
            </c:forEach>
            <c:if test="${empty display}">
                <sec:authorize access="!hasRole('ROLE_DISPLAY')">
                <div class="row">
                    <div class="col-xs-0 col-md-2"></div>
                    <div class="col-xs-12 col-md-8">
                        <a href="<c:url value="/drinklist/${bar_id}" />" class="btn btn-primary btn-lrg btn-block"><strong>Order a Drink!</strong></a>
                    </div>
                    <div class="col-xs-0 col-md-2"></div>
                </div>
                </sec:authorize>
            </c:if>
        </div>
        <script>
            function clearOrder(drinkOrderId) {
                $.ajax({
                    type: "POST",
                    url: '<c:url value="/api/clearorder" />',
                    data: {drinkOrderId: drinkOrderId},
                    beforeSend: function(xhr, settings) {
                        var token = $("meta[name='_csrf']").attr("content");
                        var header = $("meta[name='_csrf_header']").attr("content");
                        xhr.setRequestHeader(header, token);
                    },
                    success: function(a) {
                        console.log(a);
                        location.reload();
                    },
                    error: function(xhr, status, err) {
                        console.log("Error");
                        console.log(status);
                        console.log(err);
                    }
                });
            }
        </script>
    </body>
</html>
