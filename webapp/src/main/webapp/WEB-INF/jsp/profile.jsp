<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
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
