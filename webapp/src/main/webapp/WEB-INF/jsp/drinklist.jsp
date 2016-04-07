<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-2"></div>
                <div class="col-xs-12 col-md-8">
                    <h1><strong>Drink List</strong></h1>
                </div>
                <div class="col-xs-0 col-md-2"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <c:url value="/drinklist/${barId}" var="post_url" />
                    <form:form action="${post_url}" method="POST" class="search-box" role="search">
                        <div class="col-md-12 input-group">
                            <input id="drinkName" name="drinkName" type="text" class="search-hints form-control" placeholder="Search for..." />
                            <span class="input-group-btn">
                                <button class="btn btn-default" value="submit" type="submit">Go!</button>
                                <c:if test="${clearSearch}">
                                    <a class="btn btn-default" value="submit" href="${post_url}" type="Button">Clear!</a>
                                </c:if>
                            </span>
                        </div>
                    </form:form>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-2"></div>
                <div class="col-xs-12 col-md-8">
                    <h3><strong>Up Next</strong></h3>
                </div>
                <div class="col-xs-0 col-md-2"></div>
            </div>
            <c:forEach items="${queue}" var="q">
                <a href="#" data-toggle="modal" data-target="#id${q.getId()}">
                    <div class="row">
                        <div class="col-xs-0 col-md-2"></div>
                        <div class="col-xs-3 col-md-1 drink-icon">
                            <img src="<c:url value='${q.getDrinkIconUrl()}'/>" class="img-fluid img-rounded" alt="${q.getDrinkName()} icon"/>
                        </div>
                        <div class="col-xs-9 col-md-7 drink-text">
                            <h3><strong>${q.getDrinkName()}</strong></h3>
                            <p>
                                <strong>Quantity:</strong>${q.getDrinkCount()}<br />
                                <strong>User:</strong>${q.getUserName()}<br />
                                <strong>Price: $</strong>${q.getPrice()}
                            </p>
                        </div>
                        <div class="col-xs-0 col-md-2"></div>
                    </div>
                </a>
                <div class="modal fade drink-modal-md" id="id${q.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${q.getDrinkName()}" />Modal" aria-hidden="true">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="col-xs-10 col-md-11">
                                    <strong class="h3">${q.getDrinkName()}</strong>
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
                                            <strong>Make Time:</strong> ${q.getMakeTime()} Seconds<br />
                                            <strong>Ingredients:</strong> <c:forEach items="${q.getIngredients()}" var="first" end="0">${first.getName()}</c:forEach><c:forEach items="${q.getIngredients()}" var="ing" begin="1">, ${ing.getName()}</c:forEach>
                                        </p>
                                    </div>
                                    <div class="col-xs-12 col-sm-5">
                                        <textarea name="comments" id="comments${q.getId()}" style="width: 100%;" rows="3" placeholder="Special requests&hellip;"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                Qty: <input name="quantity" id="quantity${q.getId()}" value="1" size="2">
                                <sec:authorize access="isAuthenticated()">
                                    <a onclick="orderDrink(${q.getId()})" type="button" class="btn btn-primary">Order ${q.getDrinkName()}</a>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                                    <a href="<c:url value="/login" />" type="button" class="btn btn-primary">Sign in to Order!</a>
                                </sec:authorize>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="row">
                <div class="col-xs-0 col-md-2"></div>
                <div class="col-xs-12 col-md-8">
                    <h3><strong>Order These Drinks</strong></h3>
                </div>
                <div class="col-xs-0 col-md-2"></div>
            </div>
            <div><div id="content"></div><nav><ul class="pagination" id="paginator"></ul></nav></div>
        </div>
        <div class="modal fade drink-modal-md" id="orderSuccess" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-xs-10 col-md-11">
                            <strong class="h3">Success!</strong>
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
                                Your drink will be ready soon!
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade drink-modal-md" id="orderFailure" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="col-xs-10 col-md-11">
                            <strong class="h3">We are having some trouble!</strong>
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
                                Please try again, sorry for the problems!
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:directive.include file="/WEB-INF/jsp/javascript.jsp"/>
        <jsp:directive.include file="/WEB-INF/jsp/orderdrinkjs.jsp"/>
        <script type="text/javascript">
            $(document).ready(function(){
                var search_hints_query = new Bloodhound({
                datumTokenizer: function (d) {
                    return Bloodhound.tokenizers.whitespace(d.value);
                },
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                prefetch: {
                    url: '<c:url value="/api/drinklist/${barId}" />',
                    filter: function (search_hints_list) {
                        return $.map(search_hints_list, function (drink) {
                            return {
                               value: drink.name
                            };
                        });
                    }
                }
              });

              // initialize the bloodhound suggestion engine
              search_hints_query.initialize();

              // instantiate the typeahead UI
              $('.search-hints').typeahead(null, {
                  displayKey: 'value',
                  source: search_hints_query.ttAdapter()
              });
              $(".tt-hint").addClass("form-control");
            });
        </script>
    </body>
</html>
