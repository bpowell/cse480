<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container mainContent">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1><strong>Owner Options</strong></h1>
                    <p>
                        <a class="btn btn-primary" href="<c:url value='/owner/addbartender'/>"><strong>Add Bartender</strong></a>
                    </p>
                    <p>
                        <a class="btn btn-primary" href="<c:url value='/owner/removebartender'/>"><strong>Remove Bartender</strong></a>
                    </p>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div> 
        </div>
    </body>
</html>
