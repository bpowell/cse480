<script>
//the data from the json API
var d;
//number of drinks per page
var page_size = 15;
var start = 0;

function display() {
    $('#content').html("");
    for(i=start; i<start+page_size && i<d.length; i++) {
        var template = '' +
            ' <a href="#" data-toggle="modal" data-target="#id' + d[i].id + '">  ' +
            '     <div class="row">' +
            '         <div class="col-xs-0 col-md-2"></div>' +
            '         <div class="col-xs-3 col-md-1 drink-icon">' +
            '             <img src="<c:url value="' + d[i].icon_url + '"/>" class="img-fluid img-rounded" alt="' + d[i].name + ' icon"/>' +
            '         </div>' +
            '         <div class="col-xs-9 col-md-7 drink-text">' +
            '             <h3><strong>' + d[i].name + '</strong></h3>' +
            '             <p>' +
            '                 <strong>Make Time:</strong> ' + d[i].makeTime + ' Seconds<br />' +
            '                 <strong>Description:</strong> ' + d[i].info + '' +
            '             </p>' +
            '         </div>' +
            '         <div class="col-xs-0 col-md-2"></div>' +
            '     </div>' +
            ' </a>' +
            '     <div class="modal fade drink-modal-lg" id="id' + d[i].id + '" tabindex="-1" role="dialog" aria-labelledby="<c:url value="' + d[i].name + '" />Modal" aria-hidden="true">' +
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
            '                 </div>' +
            '                 <div class="modal-footer">' +
            '                     <sec:authorize access="isAuthenticated()">' +
            '                         <a href="#" type="button" class="btn btn-primary">Order ' + d[i].name + '</a>' +
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
    }
}

function nextpage() {
    if((start+page_size)>=d.length) {
        return;
    } else {
        start = start + page_size;
    }
    display();
}

function prevpage() {
    if((start-page_size)<0) {
        start = 0;
    } else {
        start = start - page_size;
    }
    display();
}

$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: '<c:url value="/api/drinklist/${barId}" />',
        success: function(a) {
            console.log(a);
            d = a;
            display();
        },
        error: function() {
            console.log("poop");
        },
        dataType: 'json'
    });
});
</script>
