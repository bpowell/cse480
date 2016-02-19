<%@page session="true"%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>CSE480</title>

        <%-- Bootstrap core CSS --%>
        <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <%-- Placeholder for BarQue logo --%>
        <div class="col-md-6">
            <div class="card">
                <%-- <img class="card-img"> --%>
                <div class="card-block">
                    <h4 class="card-title">Best Bar</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Order Drinks Here!</a>
                </div>
            </div>
            <div class="card">
                <%-- <img class="card-img"> --%>
                <div class="card-block">
                    <h4 class="card-title">Sketchy Bar</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Order Drinks Here!</a>
                </div>
            </div>
            <div class="card">
                <%-- <img class="card-img"> --%>
                <div class="card-block">
                    <h4 class="card-title">Boring Bar</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Order Drinks Here!</a>
                </div>
            </div>
        </div>
    </body>
</html>
