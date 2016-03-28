<script>
    function orderDrink() {
        $.ajax({
            type: "POST",
            url: '<c:url value="/api/orderdrink" />',
            data: 'drinkId=1&userId=1&barId=1&comments=none',
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
</script>
