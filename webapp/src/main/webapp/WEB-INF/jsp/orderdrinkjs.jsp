<div class="modal fade drink-modal-md" id="orderSuccess" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-xs-10 col-md-11">
                    <strong class="h3">Success!</strong>
                </div>
                <div class="col-xs-2 col-md-1">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-7">
                        <p>
                        Your drink will be ready soon!
                        </p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade drink-modal-md" id="orderFailure" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <div class="col-xs-10 col-md-11">
                    <strong class="h3">We are having some trouble!</strong>
                </div>
                <div class="col-xs-2 col-md-1">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-12 col-sm-7">
                        <p>
                        Please try again, sorry for the problems!
                        </p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script>
    function orderDrink(drinkId) {
        comments = $('#comments'+drinkId).val();
        quantity = $('#quantity'+drinkId).val();
        $('#comments'+drinkId).val('');
        $('#quantity'+drinkId).val('1');
        $.ajax({
            type: "POST",
            url: '<c:url value="/api/orderdrink" />',
            data: {drinkId: drinkId, userId: '${userId}', barId: '${barId}', comments: comments, quantity: quantity},
            beforeSend: function(xhr, settings) {
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                xhr.setRequestHeader(header, token);
            },
            success: function(a) {
                $('.modal').modal('hide');
                $('#orderSuccess').modal('show');
            },
            error: function(xhr, status, err) {
                $('.modal').modal('hide');
                $('#orderFailure').modal('show');
            }
        });
    }

    function unhide(drinkId) {
        $('#extra'+drinkId).show();
    }
</script>
