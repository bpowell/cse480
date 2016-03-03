<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <c:forEach items="${drinks}" var="drink">
                <div class="row">
                    <a href="#" data-toggle="modal" data-target="#id${drink.getId()}">
                        <div class="col-xs-3 col-md-2">
                            <img src="<c:url value="${drink.getIconUrl()}"/>" class="img-fluid img-rounded" alt="${drink.getName()} icon" width="150"/>
                        </div>
                        <div class="col-xs-9 col-md-10">
                            <h3>${drink.getName()}</h3>
                            <p>
                                <strong>Make Time:</strong> ${drink.getMakeTime()} Seconds<br />
                                <strong>Description:</strong><br />
                                ${drink.getInfo()}
                            </p>
                        </div>
                    </a>
                    <div class="modal fade drink-modal-lg" id="id${drink.getId()}" tabindex="-1" role="dialog" aria-labelledby="<c:url value="${drink.getName()}" />Modal" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">  
                                    <h3>${drink.getName()}</h3>
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
                </div>
            </c:forEach>
        </div>
    </body>
</html>
