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
        addContent("#bardrinks", dataAtThisBar[i], '<a type="button" class="btn btn-primary" onclick="removeDrink(' + dataAtThisBar[i].id + ')">Remove from bar!</a>');
    }
}

function displayDrinksAtAllBars(page) {
    $('#alldrinks').html("");

    start = page*page_size;
    for(i=start; i<start+page_size && i<dataAtAllBars.length; i++) {
        addContent("#alldrinks", dataAtAllBars[i], '<a type="button" class="btn btn-primary" onclick="show('+dataAtAllBars[i].id+')">Add to bar!</a>');
    }
}

function addContent(divid, item, extra) {
    var ingredient_list = '';
    if (item.ingredients.length <= 1) {
        ingredient_list += item.ingredients[0].name;
    } else {
        ingredient_list += item.ingredients[0].name;
        for (j = 1; j < item.ingredients.length; j++) {
            ingredient_list += ', ' + item.ingredients[j].name;
        }
    }

    var template = '' +
        ' <a href="#" data-toggle="modal" data-target="#id' + item.id + '">  ' +
        '     <div class="row">' +
        '         <div class="col-xs-0 col-md-1"></div>' +
        '         <div class="col-xs-3 col-md-1 drink-icon">' +
        '             <img src="<c:url value="' + item.icon_url + '"/>" class="img-fluid img-rounded" alt="' + item.name + ' icon"/>' +
        '         </div>' +
        '         <div class="col-xs-9 col-md-9 drink-text">' +
        '             <h3><strong>' + item.name + '</strong></h3>' +
        '             <p>' +
        '                 <strong>Make Time:</strong> ' + item.makeTime + ' Seconds<br />' +
                           (item.price == 0 ? '' : '<strong>Price: $</strong>' + item.price + '<br />') +
        '                 <strong>Description:</strong> ' + item.info + '' +
        '             </p>' +
        '         </div>' +
        '         <div class="col-xs-0 col-md-1"></div>' +
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
        '                     <div class="row">' +
        '                         <div class="col-xs-12 col-sm-7">' +
        '                             <p>' +
        '                                 <strong>Make Time:</strong> ' + item.makeTime + ' Seconds<br />' +
        '                                 <strong>Ingredients:</strong> ' + ingredient_list + '<br />' +
        '                             </p> ' +
        '                         </div>' +
        '                     </div>' +
        '                     <div id="extra' + item.id +'">' +
        '                         <input name="price" id="price' + item.id +'" placeholder="2.00" /><br />' +
        '                         <a onclick="addDrink(' + item.id + ');" type="button" class="btn btn-primary">Add ' + item.name + '</a>' +
        '                     </div>' +
        '                 </div>' +
        '                 <div class="modal-footer">' +
                                extra +
        '                     <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>' +
        '                 </div>' +
        '             </div>' +
        '         </div>' +
        '     </div>';
    $(divid).append(template);
    $('#extra'+item.id).hide();
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

function addDrink(drinkId) {
    price = $('#price'+drinkId).val();
    $('#price'+drinkId).val('');
    $.ajax({
        type: "POST",
        url: '<c:url value="/api/adddrink" />',
        data: {drinkId: drinkId, barId: '${barId}', price: price},
        beforeSend: function(xhr, settings) {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            xhr.setRequestHeader(header, token);
        },
        success: function(a) {
            console.log(a);
            $('.modal').modal('hide');
            location.reload();
        },
        error: function(xhr, status, err) {
            console.log("Error");
            console.log(status);
            console.log(err);
        }
    });
}

function removeDrink(drinkId) {
    $.ajax({
        type: "POST",
        url: '<c:url value="/api/removedrink" />',
        data: {drinkId: drinkId, barId: '${barId}'},
        beforeSend: function(xhr, settings) {
            var token = $("meta[name='_csrf']").attr("content");
            var header = $("meta[name='_csrf_header']").attr("content");
            xhr.setRequestHeader(header, token);
        },
        success: function(a) {
            console.log(a);
            $('.modal').modal('hide');
            location.reload();
        },
        error: function(xhr, status, err) {
            console.log("Error");
            console.log(status);
            console.log(err);
        }
    });
}

function getDrinkListForBar() {
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
}

function getAllDrinkLists() {
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
}

function show(id) {
    $('#extra'+id).show();
}

$(document).ready(function() {
    getDrinkListForBar();
    getAllDrinkLists();
});
</script>
