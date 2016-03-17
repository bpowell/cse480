<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1><strong>Drink List</strong></h1>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <c:forEach items="${drinks}" var="drink">
                <a href="#" data-toggle="modal" data-target="#id${drink.getId()}">
                    <div class="row">
                        <div class="col-xs-0 col-md-3"></div>
                        <div class="col-xs-3 col-md-1 drink-icon">
                            <img src="<c:url value="${drink.getIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getName()} icon"/>
                        </div>
                        <div class="col-xs-9 col-md-5 drink-text">
                            <h3><strong>${drink.getName()}</strong></h3>
                            <p>
                                <strong>Make Time:</strong> ${drink.getMakeTime()} Seconds<br />
                                <strong>Description:</strong> ${drink.getInfo()}
                            </p>
                        </div>
                        <div class="col-xs-0 col-md-3"></div>
                    </div>
                </a>
                    <div class="modal fade drink-modal-lg" id="id${drink.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${drink.getName()}" />Modal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <div class="col-xs-10 col-md-11">
                                        <h3>${drink.getName()}</h3>
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
                                    <button type="button" class="btn btn-primary">Order ${drink.getName()}</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                
            </c:forEach>
        </div>
    </body>
</html>
