<jsp:directive.include file="/WEB-INF/jsp/header.jsp"/>
    <body>
        <div class="container-fluid welcomeImage">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6 text-center">
                    <h1><strong>For the Thirsty and Impatient</strong></h1>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
        </div>
        <div class="container-fluid welcomeContentLight">
            <div class="row">
                <div class="col-xs-0 col-md-4"></div>
                <div class="col-xs-12 col-md-4">
                    <h1 class="text-center"><strong>Why use drinkQ?</strong></h1>
                </div>
                <div class="col-xs-0 col-md-4"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-2"></div>
                <div class="col-xs-12 col-md-4">
                    <h3><strong>As a Bar Patron</strong></h3>
                    <p>
                        Waiting sucks. You don't have to be fighting for a bartender's attention to know that.
                        So why do it?<br />
                    </p>
                    <p>
                        Join already existing members and secure your place in the queue: drinkQ!
                    </p>
                </div>
                <div class="col-xs-12 col-md-4">
                    <h3><strong>As a Business</strong></h3>
                    <p>
                        You like business. That's why you're <em>in business</em>, right?<br />
                        Streamline your bar's efficiency by allowing your customers to order drinks directly through our innovative system.
                    </p>
                    <p>
                        Increase the amount of drinks served per hour by enabling your bartenders to focus more time serving customers.
                    </p>
                </div>
                <div class="col-xs-0 col-md-2"></div>
            </div>
        </div>
        <div class="container-fluid welcomeContentDark">
            <div class="row">
                <div class="col-xs-0 col-md-3"></div>
                <div class="col-xs-12 col-md-6">
                    <h1 class="text-center"><strong>See when you will get served!</strong></h1>
                </div>
                <div class="col-xs-0 col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-xs-0 col-md-1"></div>
                <div class="col-xs-12 col-md-3">
                		<img src="<c:url value="/img/time.png" />"  class="img-responsive" alt="time" /></a>
                    <h3><strong>Drink Wait Estimations</strong></h3>
                    <p>
                        Before setting foot inside an establishment, now you can see just how long it is going to take to receive your drink.
                    </p>
                    <p>
                        If one bar has a long wait, find another!
                    </p>
                    <p>
                        You know, in case you're <strong>*really*</strong> thirsty.
                    </p>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="testimonial">
                        <div class="row">
                            <div class="col-xs-12 col-md-12">
                                <img src="<c:url value="/img/profile/steve.jpg" />"  class="stevesBeautifulFace img-circle img-responsive" alt="SteveWiggins" /></a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-0 col-sm-1"></div>
                            <div class="col-xs-12 col-sm-10">
                                <blockquote class="testim-quote">
                                    <p>Drink Q has changed the entire bar experience for me.  It eliminates the wait and adds to the fun!</p>
                                    <footer>Steven Wiggins</footer>
                                </blockquote>
                            </div>
                            <div class="col-xs-0 col-sm-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-2 col-sm-3"></div>
                            <div class="col-xs-8 col-sm-6">
                                <img src="<c:url value="/img/4stars.png" />"  class="steve-rating img-responsive" alt="SteveWiggins" /></a>
                            </div>
                            <div class="col-xs-2 col-sm-3"></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-3">
                		<img src="<c:url value="/img/notification.png" />"  class="img-responsive" alt="notification" /></a>
                    <h3><strong>Drink Notifications</strong></h3>
                    <p>
                        How long have you been sitting there for?<br />
                        5? 10? 20 minutes?
                    </p>
                    <p>
                        Still no sign of your drink, eh?
                    </p>
                    <p>
                        Now you can receive notifications of when your drink is being served!
                    </p>
                </div>
                <div class="col-xs-0 col-md-1"></div>
            </div>
        </div>
        <div class="container-fluid welcomeRegister"> 
            <div class="row">
                <div class="col-xs-0 col-md-2"></div>
                <div class="col-xs-12 col-md-8">
                    <div id="welcomeRegister">
                        <div class="col-xs-0 col-md-4"></div>
                        <div class="col-xs-12 col-md-4">
                            <h1 class="text-center"><strong>Want to Sign Up?</strong></h1>
                            <a href="<c:url value="/register" />" class="btn btn-default btn-lrg btn-block"><strong>Join drinkQ!</strong></a>
                        </div>
                        <div class="col-xs-0 col-md-4"></div>
                    </div>
                </div>
                <div class="col-xs-0 col-md-2"></div>
            </div>
        </div>
				<div class="credit">
					<div>Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
        </div>
    </body>
</html>
