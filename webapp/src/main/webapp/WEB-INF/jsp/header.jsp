<%@page session="true"%>
<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>CSE480</title>

        <%-- Bootstrap core CSS --%>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">

        <%-- jQuery and Bootstrap core JS --%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>

        <%-- drinkQ CSS --%>
        <link href="<c:url value="/css/drinkQ.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <div class="headerContent">
        <div class="row">
            <div class="col-sm-3">
                <img src="<c:url value="/img/drinkQ_logo.png" />" alt="Drink Q"/>
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
