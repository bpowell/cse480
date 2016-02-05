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
            <div>
                <a href="<c:url value='/category/all' />">All</a>
            </div>
            <div class="col-sm-8">
                <h3>By ID</h3>
                <c:url value="/category/byId" var="post_url" />
                <form:form method="POST" action="${post_url}">
                    <label for="id" class="sr-only">ID</label>
                    <input name="id" id="id" class="form-control" placeholder="id" required autofocus>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </form:form>
            </div>
            <div class="col-sm-8">
                <h3>By Name</h3>
                <c:url value="/category/byName" var="post_url" />
                <form:form method="POST" action="${post_url}">
                    <label for="name" class="sr-only">Name</label>
                    <input name="name" id="name" class="form-control" placeholder="name" required autofocus>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </form:form>
            </div>
            <div class="col-sm-8">
                <h3>Insert</h3>
                <c:url value="/category/insert" var="post_url" />
                <form:form method="POST" action="${post_url}">
                    <label for="name" class="sr-only">Name</label>
                    <input name="name" id="name" class="form-control" placeholder="name" required autofocus>
                    <label for="description" class="sr-only">Description</label>
                    <input name="description" id="description" class="form-control" placeholder="description" required autofocus>
                    <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </form:form>
            </div>
        </div>
    </body>
</html>
