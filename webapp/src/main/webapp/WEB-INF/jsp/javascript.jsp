<script>
//the data from the json API
var d;
//number of drinks per page
var page_size = 15;

function display(page) {
    $('#content').html("");
    pages(d.length);
    document.getElementById('page'+page).className = "active";

    start = page*page_size;
    for(i=start; i<start+page_size && i<d.length; i++) {
        var template = '' +
            ' <a href="#" data-toggle="modal" data-target="#did' + d[i].id + '">  ' +
            '     <div class="row drink">' +
            '         <div class="col-xs-0 col-md-2"></div>' +
            '         <div class="col-xs-3 col-md-1 drink-icon">' +
            '             <img src="<c:url value="/' + d[i].icon_url + '" context="/cse480" />" class="img-fluid img-rounded" alt="' + d[i].name + ' icon"/>' +
            '         </div>' +
            '         <sec:authorize access="isAnonymous()">' +
            '         <div class="col-xs-9 col-md-7 drink-text">' +
            '             <h3><strong>' + d[i].name + '</strong></h3>' +
            '             <p>' +
            '                 <strong>Make Time:</strong> ' + d[i].makeTime + ' Seconds<br />' +
            '                 <strong>Description:</strong> ' + d[i].info + '' +
            '             </p>' +
            '         </div>' +
            '         </sec:authorize>' +
            '         <sec:authorize access="isAuthenticated()">' +
            '         <div class="col-xs-9 col-md-5 drink-text">' +
            '             <h3><strong>' + d[i].name + '</strong></h3>' +
            '             <p>' +
            '                 <strong>Make Time:</strong> ' + d[i].makeTime + ' Seconds<br />' +
            '                 <strong>Description:</strong> ' + d[i].info + '' +
            '             </p>' +
            '         </div>' +
            '         <div class="col-xs-12 col-md-2 drink-quickorder">' +
            '             <a onclick="orderDrink(' + d[i].id + ');" type="button" class="btn btn-primary btn-block"><strong>Quick Order</strong></a>' +
            '         </div>' +
            '         </sec:authorize>' +
            '         <div class="col-xs-0 col-md-2"></div>' +
            '     </div>' +
            ' </a>' +
            '     <div class="modal fade drink-modal-lg" id="did' + d[i].id + '" tabindex="-1" role="dialog" aria-labelledby="<c:url value="' + d[i].name + '" /> Modal" aria-hidden="true">' +
            '         <div class="modal-dialog modal-lg">' +
            '             <div class="modal-content">' +
            '                 <div class="modal-header">' +
            '                     <div class="col-xs-10 col-md-11">' +
            '                         <strong class="h3">' + d[i].name + '</strong>' +
            '                     </div>' +
            '                     <div class="col-xs-2 col-md-1">' +
            '                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">' +
            '                         <span aria-hidden="true">&times;</span>' +
            '                     </button>' +
            '                     </div>' +
            '                 </div>' +
            '                 <div class="modal-body">  ' +
            '                     <p>' +
            '                         <strong>Stuff goes here!</strong>' +
            '                         Right? We want stuff here?<br />' +
            '                         Yes... yes we do.' +
            '                     </p>' +
            '                     <div id="extra' + d[i].id +'">' +
            '                         <textarea name="comments" id="comments' + d[i].id +'" rows="3" placeholder="Extras??"></textarea><br />' +
            '                         <a onclick="orderDrink(' + d[i].id + ');" type="button" class="btn btn-primary">Order ' + d[i].name + '</a>' +
            '                     </div>' +
            '                 </div>' +
            '                 <div class="modal-footer">' +
            '                     <sec:authorize access="isAuthenticated()">' +
            '                         <a onclick="unhide(' + d[i].id + ')" type="button" class="btn btn-primary">Order ' + d[i].name + '</a>' +
            '                     </sec:authorize>' +
            '                     <sec:authorize access="isAnonymous()">' +
            '                         <a href="<c:url value="/login" />" type="button" class="btn btn-primary">Sign in to Order!</a>' +
            '                     </sec:authorize>' +
            '                     <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>' +
            '                 </div>' +
            '             </div>' +
            '         </div>' +
            '     </div>';
        $('#content').append(template);
        $('#extra'+d[i].id).hide();
    }
}

function pages(size) {
    $('#paginator').html("");
    num_pages = Math.floor(size/page_size);
    if((size%page_size)==0) {
        num_pages = num_pages - 1;
    }

    for(i=0; i<=num_pages; i++) {
        $('#paginator').append('<li><a onclick="display(' + i + ')" id="page' + i + '">' + (i+1) + '</a></li>');
    }
}

$(document).ready(function() {
    <c:choose>
        <c:when test="${not empty drinks}">
            d = ${drinks};
            pages(d.length);
            display(0);
        </c:when>
        <c:otherwise>
            $.ajax({
                type: "GET",
                url: '<c:url value="/api/drinklist/${barId}" />',
                success: function(a) {
                    console.log(a);
                    d = a;
                    pages(d.length);
                    display(0);
                },
                error: function() {
                    console.log("Error");
                },
                dataType: 'json'
            });
        </c:otherwise>
    </c:choose>
});
</script>
