<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <div class="jumbotron text-center">
                        <h3><strong>404</strong> - Page Not Found!</h3>
                        <img src="<c:url value="/img/404.png"/>" class="img-rounded img-responsive" alt="404" width="800">
                    </div>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-4"></div>
                <div class="col-xs-12 col-md-4">
                    <a href="<c:url value="barview"/>" class="btn btn-primary btn-lrg btn-block">Return to Bars!</a>
                </div>
                <div class="col-xs-0 col-md-4"></div>
            </div>
        </div>
    </body>
</html>
