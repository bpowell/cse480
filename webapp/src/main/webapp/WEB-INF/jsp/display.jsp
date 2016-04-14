<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <div class="row">
                    <div class="col-xs-12">
                        <c:forEach items="${bar}" var="b">
                        <h3><strong>${b.getName()}</strong></h3>
                        <p>
                            <script>
                                var phone = '${b.getPhoneNumber()}';
                                var format = '<a href="tel:1' + phone + '">(' + phone.substr(0, 3) + ') ' + phone.substr(3, 3) + '-' + phone.substr(6,4) + '</a>';
                                document.write(format);
                            </script>
                        </p>
                        <p>
                            ${b.getAddress()}<br />
                            ${b.getCity()}, ${b.getState()} ${b.getZipcode()}
                        </p>
                        </c:forEach>
                        <p>
                            <strong>Wait Time:</strong> ${waittime}<br />
                            <strong>Drinks in Queue:</strong> ${drinksinqueue}<br />
                            <strong>Drinks Served:</strong> ${drinksserved}<br />
                            <strong>Drinks Available:</strong> ${availabledrinks}<br />
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-md-pull-3">
                <c:if test="${empty display}">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h1><strong>Drink Queue</strong></h1>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                </c:if>
                <c:if test="${empty queue}">
                <div id="empty-queue" class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <p>
                            <strong>Lucky you!</strong><br />
                            There are currently no drinks in the queue.
                        </p>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                </c:if>
                <div class="page-info">
                    <c:forEach items="${queue}" var="drink">
                    <a href="#" data-toggle="modal" data-target="#id${drink.getId()}">
                    <div class="row">
                            <div class="col-xs-0 col-md-1"></div>
                            <div class="col-xs-3 col-md-1 drink-icon">
                                <img src="<c:url value="${drink.getDrinkIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getDrinkName()} icon" />
                            </div>
                            <div class="col-xs-9 col-md-6 drink-text">
                                <h3><strong>${drink.getDrinkName()}</strong></h3>
                                <p>
                                    <strong>User:</strong> ${drink.getUserName()}<br />
                                    <strong>Quantity:</strong> ${drink.getDrinkCount()}<br />
                                </p>
                            </div>
                            <div class="col-xs-12 col-md-3 drink-clearorder">
                                <c:if test="${canClear}">
                                    <a onclick="clearOrder(${drink.getId()});" type="button" class="btn btn-primary btn-block"><strong>Clear Order</strong></a>
                                </c:if>
                            </div>
                            <div class="col-xs-0 col-md-1"></div>
                        </div>
                    </a>
                    <sec:authorize access="!hasRole('ROLE_DISPLAY')">
                    <div class="modal fade drink-modal-md" id="id${drink.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${drink.getDrinkName()}" />Modal" aria-hidden="true">
                        <div class="modal-dialog modal-md">
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
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-7">
                                            <p>
                                                <strong>Make Time:</strong> ${drink.getMakeTime()} Seconds<br />
                                                <strong>Ingredients:</strong> <c:forEach items="${drink.getIngredients()}" var="first" end="0">${first.getName()}</c:forEach><c:forEach items="${drink.getIngredients()}" var="ing" begin="1">, ${ing.getName()}</c:forEach>
                                            </p>
                                        </div>
                                        <div class="col-xs-12 col-sm-5">
                                            <textarea name="comments" id="comments${drink.getId()}" style="width: 100%;" rows="3" placeholder="Special requests&hellip;"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    Qty: <input name="quantity" id="quantity${drink.getId()}" value="1" size="2">
                                    <sec:authorize access="isAuthenticated()">
                                    <a onclick="orderDrink(${drink.getId()})" type="button" class="btn btn-primary">Order ${drink.getDrinkName()}</a>
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
                </div>
                <sec:authorize access="!hasRole('ROLE_DISPLAY')">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <a href="<c:url value="/drinklist/${bar_id}" />" class="btn btn-primary btn-lrg btn-block"><strong>Order a Drink!</strong></a>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                </sec:authorize>
            </div>
        </div>
        <jsp:directive.include file="/WEB-INF/jsp/orderdrinkjs.jsp"/>
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
