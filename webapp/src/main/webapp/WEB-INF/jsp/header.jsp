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
        <%-- drinkQ CSS --%>
        <link href="<c:url value="/css/drinkQ.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <div class="headerContent">
        <div class="row">
            <div class="col-sm-3">
                <img src="<c:url value="/img/drinkQ_logo.png" />" alt="Drink Q" style="width:200px;height:80px;"/>
            </div>
            <div class="col-sm-3">
                <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">View Bars</button>
            </div>
            <div class="col-sm-3">
                <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">View Drinks</button>
            </div>
            <div class="col-sm-3">
                <button value="submit" class="btn btn-lg btn-primary btn-block" type="submit">Profile/Login</button>
            </div>
        </div>
    </div>
