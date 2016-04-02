<script>
    function orderDrink(drinkId) {
        comments = $('#comments'+drinkId).val();
        $('#comments'+drinkId).val('');
        $.ajax({
            type: "POST",
            url: '<c:url value="/api/orderdrink" />',
            data: {drinkId: drinkId, userId: '${userId}', barId: '${barId}', comments: comments},
            beforeSend: function(xhr, settings) {
                var token = $("meta[name='_csrf']").attr("content");
                var header = $("meta[name='_csrf_header']").attr("content");
                xhr.setRequestHeader(header, token);
            },
            success: function(a) {
                console.log(a);
            },
            error: function(xhr, status, err) {
                console.log("Error");
                console.log(status);
                console.log(err);
            }
        });
    }

    function unhide(drinkId) {
        $('#extra'+drinkId).show();
    }
</script>
