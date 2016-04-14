<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:if test="${not empty username}">
                <div class="col-md-3 col-md-push-9">
                    <div class="row">
                        <div class="col-xs-0"></div>
                        <div class="col-xs-12">
                            <h3><strong>Profile</strong></h3>
                            <table id="profile-table" class="table table-responsive table-condensed">
                                <tr><th>Username:</th><td>${username}</td></tr>
                                <tr><th>Total Orders:</th><td>${totaldrinks}</td></tr>
                                <tr><th>Favorite Drink:</th><th>Times Ordered:</th></tr>
                                <tr><td>${topdrink.get('name')}</td><td>${topdrink.get('count')}</td></tr>
                            </table>
                        </div>
                        <div class="col-xs-0"></div>
                    </div>
            </c:if>
            <c:if test="${empty username}">
                <div class="col-md-3 col-md-push-9 invisible">
            </c:if>
            </div>
            <div class="col-md-9 col-md-pull-3">
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <h1><strong>Bar List</strong></h1>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <div class="row">
                    <div class="col-xs-0 col-md-1"></div>
                    <div class="col-xs-12 col-md-10">
                        <c:url value="/barview" var="post_url" />
                        <form:form action="${post_url}" method="POST" class="search-box" role="search">
                            <div class="col-md-12 input-group">
                                <input id="barName" name="barName" type="text" class="search-hints form-control" placeholder="Search for..." />
                                <span class="input-group-btn">
                                    <button class="btn btn-default" value="submit" type="submit">Go!</button>
                                    <c:if test="${clearSearch}">
                                        <a class="btn btn-default" value="submit" href="<c:url value="/barview" />" type="Button">Clear!</a>
                                    </c:if>
                                </span>
                            </div>
                        </form:form>
                    </div>
                    <div class="col-xs-0 col-md-1"></div>
                </div>
                <div class="bar-info">
                    <c:forEach items="${businesses}" var="b">
                    <c:forEach items="${b.getBars()}" var="bar">
                    <a href="#" data-toggle="modal" data-target="#id${bar.getId()}">
                        <div class="row">
                            <div class="col-xs-0 col-md-1"></div>
                            <div class="col-xs-3 col-md-2 business-icon">
                                <img src="<c:url value="${b.getIconUrl()}"/>" class="img-fluid img-rounded img-responsive" alt="${bar.getName()} icon" />
                            </div>
                            <div class="col-xs-9 col-md-6 bar-text">
                                <h3><strong>${bar.getName()}</strong></h3>
                                <p>
                                    <strong>Phone: </strong>
                                    <script>
                                        var phone = '${bar.getPhoneNumber()}';
                                        var format = '<a href="tel:1' + phone + '">(' + phone.substr(0, 3) + ') ' + phone.substr(3, 3) + '-' + phone.substr(6,4) + '</a>';
                                        document.write(format);
                                    </script><br />
                                    <strong>Location:</strong> ${bar.getCity()}, ${bar.getState()}<br />
                                    <!-- foritem dayofweek thevalue -->
                                    <strong>Today's Hours:</strong> ${bar.getWednesdayHours()}
                                </p>
                            </div>
                            <div class="col-xs-12 col-md-2 bar-quick-links">
                                <a href="<c:url value="/display/${bar.getId()}" />" type="button" class="btn btn-primary btn-block"><strong>Queue</strong></a>
                                <a href="<c:url value="/drinklist/${bar.getId()}" />" type="button" class="btn btn-primary btn-block"><strong>Drink List</strong></a>
                            </div>
                            <div class="col-xs-0 col-md-1"></div>
                        </div>
                    </a>
                    <div class="modal fade drink-modal-md" id="id${bar.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${bar.getName()}" />Modal" aria-hidden="true">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-xs-10 col-md-11">
                                        <strong class="h1">${bar.getName()}</strong>
                                    </div>
                                    <div class="col-xs-2 col-md-1">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-1"></div>
                                        <div class="col-xs-3 col-sm-2">
                                            <img src="<c:url value="${b.getIconUrl()}"/>" class="img-fluid img-rounded img-responsive" alt="${bar.getName()} icon" />
                                        </div>
                                        <div class="col-xs-7">
                                            <p>
                                                <strong>Phone:</strong><br />
                                                ${bar.getPhoneNumber()}
                                            </p>
                                            <p>
                                                <strong>Address:</strong><br />
                                                ${bar.getAddress()}<br />
                                                ${bar.getCity()} ${bar.getZipcode()} ${bar.getState()}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-1"></div>
                                        <div class="col-xs-5 col-sm-3">
                                            <p>
                                                <strong>Hours:</strong><br />
                                                Monday :<br />
                                                Tuesday :<br />
                                                Wednesday :<br />
                                                Thursday :<br />
                                                Friday :<br />
                                                Saturday :<br />
                                                Sunday :
                                            </p>
                                        </div>
                                        <div class="col-xs-4 col-sm-8">
                                            <p>
                                                <br />
                                                ${bar.getMondayHours()}<br />
                                                ${bar.getTuesdayHours()}<br />
                                                ${bar.getWednesdayHours()}<br />
                                                ${bar.getThursdayHours()}<br />
                                                ${bar.getFridayHours()}<br />
                                                ${bar.getSaturdayHours()}<br />
                                                ${bar.getSundayHours()}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="col-xs-0 col-sm-6"></div>
                                    <div class="col-xs-4 col-sm-2">
                                        <a href="<c:url value="/display/${bar.getId()}" />" type="button" class="btn btn-primary">Queue</a>
                                    </div>
                                    <div class="col-xs-4 col-sm-2">
                                        <a href="<c:url value="/drinklist/${bar.getId()}" />" type="button" class="btn btn-primary">Drink List</a>
                                    </div>
                                    <div class="col-xs-4 col-sm-2">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    </c:forEach>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                var search_hints_query = new Bloodhound({
                datumTokenizer: function (d) {
                    return Bloodhound.tokenizers.whitespace(d.value);
                },
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                prefetch: {
                    url: '<c:url value="/api/allbars" />',
                    filter: function (search_hints_list) {
                        return $.map(search_hints_list, function (bar) {
                            return {
                               value: bar.name
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
