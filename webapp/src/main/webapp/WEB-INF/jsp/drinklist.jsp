<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="col-md-3 col-md-push-9">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h3><strong>Up Next</strong></h3>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <c:if test="${empty queue}">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <p>
                            <strong>Lucky you!</strong><br />
                            There are no drinks in the queue!
                        </p>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                </c:if>
                <c:forEach items="${queue}" var="q">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-3 col-md-1 drink-icon">
                        <img src="<c:url value='${q.getDrinkIconUrl()}'/>" class="img-fluid img-rounded" alt="${q.getDrinkName()} icon"/>
                    </div>
                    <div class="col-xs-9 col-md-9 drink-text">
                        <h3><strong>${q.getDrinkName()}</strong></h3>
                        <p>
                            <strong>Quantity:</strong>${q.getDrinkCount()}<br />
                            <strong>User:</strong>${q.getUserName()}<br />
                            <strong>Price: $</strong>${q.getPrice()}
                        </p>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                </c:forEach>
            </div>
            <div class="col-md-9 col-md-pull-3">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h1><strong>Drink List</strong></h1>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
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
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <div>
                    <div class="page-info" id="content"></div>
                    <nav>
                        <ul class="pagination" id="paginator"></ul>
                    </nav>
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
