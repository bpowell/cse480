<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="row">
            <div class="col-lg-12 mainContent">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">Go!</button>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="card-deck-wrapper">
                <div class="card-deck">
                    <c:forEach items="${businesses}" var="b">
                        <c:forEach items="${b.getBars()}" var="bar">
                        <div class="card">
                            <%-- <img class="card-img"> --%>
                            <div class="card-block">
                                <h4 class="card-title">${bar.getName()}</h4>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Phone: ${bar.getNumber()}</li>
                                    <li class="list-group-item">Address: ${bar.getAddress()} ${bar.getCity()} ${bar.getZipcode()} ${bar.getState()}</li>
                                    <li class="list-group-item">Hours: Monday ${bar.getMondayHours()}<br />Tuesday ${bar.getTuesdayHours()}<br />Wednesday ${bar.getWednesdayHours()}<br />Thursday ${bar.getThursdayHours()}<br />Friday ${bar.getFridayHours()}<br />Saturday ${bar.getSaturdayHours()}<br />Sunday ${bar.getSundayHours()}</li>
                                </ul>
                                <div class="card-block">
                                    <a href="#" class="btn btn-primary">Order Drinks Here!</a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
</html>
