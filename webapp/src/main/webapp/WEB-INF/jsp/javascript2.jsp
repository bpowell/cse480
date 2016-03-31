<script>
//the data from the json API
var dataAtThisBar;
var dataAtAllBars;
//number of drinks per page
var page_size = 15;

function displayDrinksAtThisBar(page) {
    $('#bardrinks').html("");

    start = page*page_size;
    for(i=start; i<start+page_size && i<dataAtThisBar.length; i++) {
        addContent("#bardrinks", dataAtThisBar[i]);
    }
}

function displayDrinksAtAllBars(page) {
    $('#alldrinks').html("");

    start = page*page_size;
    for(i=start; i<start+page_size && i<dataAtAllBars.length; i++) {
        addContent("#alldrinks", dataAtAllBars[i]);
    }
}

function addContent(divid, item) {
    var template = '' +
        ' <a href="#" data-toggle="modal" data-target="#id' + item.id + '">  ' +
        '     <div class="row">' +
        '         <div class="col-xs-0 col-md-2"></div>' +
        '         <div class="col-xs-3 col-md-1 drink-icon">' +
        '             <img src="<c:url value="' + item.icon_url + '"/>" class="img-fluid img-rounded" alt="' + item.name + ' icon"/>' +
        '         </div>' +
        '         <div class="col-xs-9 col-md-7 drink-text">' +
        '             <h3><strong>' + item.name + '</strong></h3>' +
        '             <p>' +
        '                 <strong>Make Time:</strong> ' + item.makeTime + ' Seconds<br />' +
        '                 <strong>Description:</strong> ' + item.info + '' +
        '             </p>' +
        '         </div>' +
        '         <div class="col-xs-0 col-md-2"></div>' +
        '     </div>' +
        ' </a>' +
        '     <div class="modal fade drink-modal-lg" id="id' + item.id + '" tabindex="-1" role="dialog" aria-labelledby="<c:url value="' + item.name + '" />Modal" aria-hidden="true">' +
        '         <div class="modal-dialog modal-lg">' +
        '             <div class="modal-content">' +
        '                 <div class="modal-header">' +
        '                     <div class="col-xs-10 col-md-11">' +
        '                         <strong class="h3">' + item.name + '</strong>' +
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
        '                     <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>' +
        '                 </div>' +
        '             </div>' +
        '         </div>' +
        '     </div>';
    $(divid).append(template);
}

function pagesAtThisBar(size) {
    $('#barpaginator').html("");
    num_pages = Math.floor(size/page_size);

    for(i=0; i<=num_pages; i++) {
        $('#barpaginator').append('<li><a onclick="displayDrinksAtThisBar(' + i + ')" id="page' + i + '">' + (i+1) + '</a></li>');
    }
}

function pagesAtAllBars(size) {
    $('#allpaginator').html("");
    num_pages = Math.floor(size/page_size);

    for(i=0; i<=num_pages; i++) {
        $('#allpaginator').append('<li><a onclick="displayDrinksAtAllBars(' + i + ')" id="page' + i + '">' + (i+1) + '</a></li>');
    }
}

$(document).ready(function() {
    $.ajax({
        type: "GET",
        url: '<c:url value="/api/drinklist/${barId}" />',
        success: function(a) {
            dataAtThisBar = a;
            pagesAtThisBar(dataAtThisBar.length);
            displayDrinksAtThisBar(0);
        },
        error: function() {
            console.log("Error");
        },
        dataType: 'json'
    });

    $.ajax({
        type: "GET",
        url: '<c:url value="/api/alldrinks" />',
        success: function(a) {
            dataAtAllBars = a;
            pagesAtAllBars(dataAtAllBars.length);
            displayDrinksAtAllBars(0);
        },
        error: function() {
            console.log("Error");
        },
        dataType: 'json'
    });
});
</script>
