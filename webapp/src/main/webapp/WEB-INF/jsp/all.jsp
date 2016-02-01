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
        <div class="container">
            <h2>List of Ingredients</h2>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Description</th>
                </tr>
                <c:forEach items="${caterories}" var="t">
                <tr>      
                    <td>${t.getId()}</td>
                    <td>${t.getName()}</td>
                    <td>${t.getDescription()}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
