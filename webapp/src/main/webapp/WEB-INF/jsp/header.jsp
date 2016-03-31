<%@page session="true"%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>CSE480</title>

        <%-- Bootstrap core CSS --%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

        <%-- jQuery and Bootstrap core JS --%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="http://twitter.github.com/typeahead.js/releases/latest/typeahead.bundle.min.js"></script>

        <%-- drinkQ CSS --%>
        <link href="<c:url value="/css/drinkQ.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <c:url var="logoutUrl" value="/j_spring_security_logout" />
        <form action="${logoutUrl}" id="logout" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        <nav class="navbar navbar-default navbar-fixed-top headerContent">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#drinkQNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value="/" />"><img src="<c:url value="/img/drinkQ_logo.png" />" alt="drinkQ" /></a>
                </div>
                <div class="collapse navbar-collapse" id="drinkQNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<c:url value="/barview" />"><strong>View Bars</strong></a></li>
                        <sec:authorize access="isAnonymous()">
                            <li><a href="<c:url value="/login" />"><strong>Log In</strong></a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <li><a href="<c:url value="/owner/" />"><strong>Owner Menu</strong></a></li>
                            <li><a href="<c:url value="/admin/" />"><strong>Admin Menu</strong></a></li>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ROLE_OWNER')">
                            <li><a href="<c:url value="/owner/" />"><strong>Owner Menu</strong></a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <li><a href="<c:url value="/profile" />"><strong>View Profile</strong></a></li>
                            <li><a href="#" onclick="document.getElementById('logout').submit();"><strong>Logout</strong></a></li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>
