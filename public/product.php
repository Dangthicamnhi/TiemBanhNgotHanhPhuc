<?php

require_once "config.php";
require_once "models/db.php";
require_once "models/product.php";
require_once "models/protype.php";
require_once "models/manufacturer.php";

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $productModel = new Product();
    $product = $productModel->getProductById($id);
}

$template = new Template();

$data = [
    'title' => $product['name'],
    'slot'  => $template->render('product-detail', ['product' => $product] )
];
$template->view('layout', $data);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<!-- <div class="container">
    <div class="row">
        <div class="col-md">
            <img src="public/images/<?php echo $product['image'] ?>" alt="" class="img-fluid">
        </div>
        <div class="col-md">
            <h1><?php echo $product['name'] ?></h1>
            <p><?php echo $product['price'] ?></p>
            <?php echo $product['description'] ?>
        </div>
        <div class="col-md">
            <div class="d-grid gap-2 mt-5">
                <a href="#" class="btn btn-danger">Mua ngay</a>
                <a href="#" class="btn btn-outline-primary">Thêm vào giỏ</a>
            </div>
        </div>
    </div> -->
    cứu mấy ní ơi
</div>
</body>
</html>