<%@page session="true"%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
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
        <div class="col-md-4">
            <%-- Profile Image --%>
            <div id="accountSettings">
                <%-- Account Settings --%>
            </div>
        </div>
        <div class="col-md-8">
            <h1>${username}</h1>
            <div id="userStats">
                <h3>Drink Score: x</h3>
                <h3>Recent Drinks:</h3>
                <div class="card">
                    <%-- <img class="card-img"> --%>
                    <div class="card-block">
                        <h4 class="card-title">Bud Light</h4>
                        <p class="card-text">If we need any more info.</p>
                    </div>
                </div>
                <div class="card">
                    <%-- <img class="card-img"> --%>
                    <div class="card-block">
                        <h4 class="card-title">Long Island</h4>
                        <p class="card-text">If we need any more info.</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
