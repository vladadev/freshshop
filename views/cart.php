
<!-- Start All Title Box -->
<div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Cart</h2>
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->


    <!-- Start Cart  -->
    <div class="cart-box-main">
        <div class="container">

            <?php if (isset($_SESSION['artikli'])):

                $artikliSession = $_SESSION['artikli'];
                // var_dump($artikliSession);
                // die();
                $objSession = (object) $artikliSession;
                ?>

            <div class="row" id="">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Images</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Remove</th>
                                </tr>
                            </thead>
                            <tbody id="tbody-cart-items">

                            <?php foreach ($artikliSession as $key => $artikal):

                                $totalCena =
                                    $artikal['cena'] * $artikal['kolicina'];

                                $putanjaCartSlike =
                                    BASE_URL . 'images/artikli/';
                                ?>
                                <tr class="cart-content">
                                    <td class="thumbnail-img">
                                        <a href="<?php echo 'index.php?page=shop_detail&id=' .
                                            $artikal['id_artikal']; ?>">
									        <img class="img-fluid" src="<?php echo $putanjaCartSlike .
                     $artikal[
                         'putanja'
                     ]; ?>" alt="<?php echo $putanjaCartSlike .
    $artikal['alt']; ?>" />
                                        </a>
                                    </td>
                                    <td class="name-pr">
                                        <a href="<?php echo 'index.php?page=shop_detail&id=' .
                                            $artikal['id_artikal']; ?>">
									        <?php echo $artikal['naziv']; ?>
								        </a>
                                    </td>
                                    <td class="price-pr">
                                        <p><?php echo '$' .
                                            $artikal['cena']; ?>.00</p>
                                    </td>
                                    <td class="quantity-box"><input type="number" size="4" value="<?php echo $artikal[
                                        'kolicina'
                                    ]; ?>" min="1" step="1" class="input-quantity" class="c-input-text qty text" data-product-cena="<?php echo $artikal[
    'cena'
]; ?>" data-update-price-url="<?php echo NEW_BASE_URL; ?>"></td>
                                    <td class="total-pr">
                                        <p class="total-price-text"><?php echo '$' .
                                            $totalCena; ?>.00</p>
                                    </td>
                                    <td class="remove-pr">
                                        <a class="remove-product" href="#" data-product-id="<?php echo $artikal[
                                            'id_artikal'
                                        ]; ?>" data-cart-url="<?php echo NEW_BASE_URL; ?>">
									        <i class="fas fa-times"></i>
								        </a>
                                    </td>
                                </tr>
                            <?php
                            endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row my-5">
                <div class="col-lg-6 col-sm-6">
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <div class="update-box">
                                <input type="hidden" name="clearCartSession" value="1">
                                <input id="clear-cart" value="Clear Cart" type="submit" data-clear-msg="Cart cleared" data-clear-url="<?php echo BASE_URL; ?>">
                            </div>
                            <div class="update-box">
                                <input type="hidden" name="clearCartSession" value="1">
                                <input id="update-summary" value="Update summary" type="submit" data-update-msg="Summary updated">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <?php if (isset($_SESSION['artikli'])):

                $total = 0;
                $ukupnaKolicina = 0;
                foreach ($_SESSION['artikli'] as $artikal) {
                    $cenaArtikla = $artikal['cena'];
                    $kolicinaArtikla = $artikal['kolicina'];

                    $ukupnaCenaArtikla = $cenaArtikla * $kolicinaArtikla;

                    $total += $ukupnaCenaArtikla;
                }
                ?>
            <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <h3>Order summary</h3>
                    <hr class="my-1">
                    <div class="d-flex">
                        <h4>Sub Total</h4>
                        <div id="sub-total" class="ml-auto font-weight-bold"> $ <?php echo $total; ?>.00 </div>
                    </div>
                    <div class="d-flex">
                        <h4>Shipping Cost</h4>
                        <div class="ml-auto font-weight-bold"> Free </div>
                    </div>
                    <hr>
                    <div class="d-flex gr-total">
                        <h5>Grand Total</h5>
                        <div id="grand-total" class="ml-auto h5"> $ <?php echo $total; ?>.00 </div>
                    </div>
                    <hr> 
                </div>
                <div class="update-box checkout-div">
                    <input class="checkout" value="Checkout" type="submit">Checkouts currently disabled
                </div>
            </div>
            </div>
            <?php
            else:
                 ?>
            <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <h3>Order summary</h3>
                    <hr class="my-1">
                    <div class="d-flex">
                        <h4>Sub Total</h4>
                        <div class="ml-auto font-weight-bold"> $ 0 </div>
                    </div>
                    <hr>
                    <div class="d-flex gr-total">
                        <h5>Grand Total</h5>
                        <div class="ml-auto h5"> $ 0 </div>
                    </div>
                    <hr> 
                </div>
                
            </div>
            </div>
            <?php
            endif; ?>
            <?php
            else:
                 ?>

            <div class="row">
                <div class="col-lg-12">

                    <h1>Your cart is empty!</h1>

                </div>
            </div>

            <?php
            endif; ?>


            

            
        </div>
    </div>
    <!-- End Cart -->