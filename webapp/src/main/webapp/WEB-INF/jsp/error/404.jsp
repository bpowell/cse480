<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="jumbotron">
                    <h2>404 - Page Not Found!</h2>
                    <img src="<c:url value="/img/404.png"/>" class="img-rounded img-responsive" alt="404" width="800">
                </div>
            </div>
            <div class="row">
                <a href="<c:url value="barview"/>" class="btn btn-primary">Return to Bars!</a>
            </div>
        </div>
    </body>
</html>
