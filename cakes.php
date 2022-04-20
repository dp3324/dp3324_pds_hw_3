<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cakes Page</title>
    <link rel="stylesheet" href="css/index.css"/>

</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <?php
        include "db.php";

        if(!isset($_POST) || !isset($_POST['customer_id']))
            echo '<div class="error"> Customer ID field not present!</div>';
        else {
            $custid = $_POST['customer_id'];
            $customer = $db->query('select * from customer where custid = '.$custid.' limit 1');
            $custname = mysqli_fetch_assoc($customer)['custname'];
            if($customer->num_rows == 0) {
                echo '<div class="error"> Please enter valid Customer ID.</div>';
            } else {
                $qry = 'select C.cakeid as cakeid, cakename, status, price, pricepaid from Orders join Cake C on Orders.cakeid = C.cakeid where custid = ' . $custid . ' order by ordertime desc';
                $cakes = $db->query($qry);
                echo '<h3 class="heading">Cakes ordered by <u>'.$custname.'</u></h3>';
                echo '<table class="tables">';
                echo '<tr>' .
                    '<th>ID</th>' .
                    '<th>Cake Name</th>' .
                    '<th>Status</th>' .
                    '<th>Price</th>' .
                    '<th>Total Price Paid</th>' .
                    '</tr>';
                foreach ($cakes as $cake) {
                    $cake_id = $cake['cakeid'];
                    $cake_name = $cake['cakename'];
                    $cake_status = $cake['status'];
                    $cake_price = $cake['price'];
                    $cake_price_paid = $cake['pricepaid'];
                    echo '<tr onclick="select_cakeid(\''.$cake_id.'\',\''.$cake_name.'\')'.'">' .
                            '<td>'. $cake_id . '</td>' .
                            '<td>' . $cake_name . '</td>'.
                            '<td>' . $cake_status . '</td>'.
                            '<td>$' . $cake_price . '</td>'.
                            '<td>$' . $cake_price_paid . '</td>'.
                        '</tr>';
                }
                echo '</table>';
            }
        }

    ?>
    <h3 id="cakename" class="heading"></h3>
    <div id="response"></div>
    <script>
        function select_cakeid(cakeid, cakename) {




            var cakenameElement = document.getElementById('cakename');
            cakenameElement.innerText = `Ingredients for ${cakename}`;

            $.ajax({
                type: 'POST',
                url: 'ingredients.php',
                data: {cakeid},
                success: function (data) {

                    var response = document.getElementById('response')
                    if (response) {
                        response.style.display = 'block';
                        response.innerHTML = data;
                    }
                }
            })


        }
    </script>
</body>
</html>