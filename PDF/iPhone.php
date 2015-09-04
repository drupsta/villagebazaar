<?php
if(isset($_POST['button_pdf']))
{
//require_once("C:\\xampp\\htdocs\\tcpdf\\examples\\ex1.php");
require_once("C:\\xampp\\htdocs\\VillageBazaar\\upload\\PDF\\PDF_SAN.php");
}
?>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>iPhone</title>
<base href="http://localhost/VillageBazaar/upload/" />
<link href="http://localhost/VillageBazaar/upload/image/data/cart.png" rel="icon" />
<link href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=40" rel="canonical" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
</head>
<body>
<div id="container">
<div id="header">
    <div id="logo"><a href="http://localhost/VillageBazaar/upload/index.php?route=common/home"><img src="http://localhost/VillageBazaar/upload/image/data/logo.png" width="300px" title="Your Store" alt="Your Store" /></a></div>
     <!-- <form action="http://localhost/VillageBazaar/upload/index.php?route=module/currency" method="post" enctype="multipart/form-data">
  <div id="currency">Currency<br />
                <a title="Euro" onclick="$('input[name=\'currency_code\']').attr('value', 'EUR'); $(this).parent().parent().submit();">€</a>
                        <a title="Pound Sterling" onclick="$('input[name=\'currency_code\']').attr('value', 'GBP'); $(this).parent().parent().submit();">£</a>
                        <a title="US Dollar"><b>$</b></a>
                <input type="hidden" name="currency_code" value="" />
    <input type="hidden" name="redirect" value="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=40" />
  </div>
</form>
-->
  <div id="cart">
  <div class="heading">
    <h4>Shopping Cart</h4>
    <a><span id="cart-total">1 item(s) - $120.68</span></a></div>
  <div class="content">
        <div class="mini-cart-info">
      <table>
                <tr>
          <td class="image">            <a href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=40"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_1-47x47.jpg" alt="iPhone" title="iPhone" /></a>
            </td>
          <td class="name"><a href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=40">iPhone</a>
            <div>
                                        </div></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total">$120.68</td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="Remove" title="Remove" onClick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=40::' : $('#cart').load('index.php?route=module/cart&remove=40::' + ' #cart > *');" /></td>
        </tr>
                      </table>
    </div>
    <div class="mini-cart-total">
      <table>
                <tr>
          <td class="right"><b>Sub-Total:</b></td>
          <td class="right">$101.00</td>
        </tr>
                <tr>
          <td class="right"><b>Eco Tax (-2.00):</b></td>
          <td class="right">$2.00</td>
        </tr>
                <tr>
          <td class="right"><b>VAT (17.5%):</b></td>
          <td class="right">$17.68</td>
        </tr>
                <tr>
          <td class="right"><b>Total:</b></td>
          <td class="right">$120.68</td>
        </tr>
              </table>
    </div>
    <div class="checkout"><a href="http://localhost/VillageBazaar/upload/index.php?route=checkout/cart">View Cart</a> | <a href="http://localhost/VillageBazaar/upload/index.php?route=checkout/checkout">Checkout</a></div>
      </div>
</div>  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="Search" value="" />
  </div>
  <div id="welcome">
        <b>Welcome visitor you can<span> <a href="http://localhost/VillageBazaar/upload/index.php?route=account/login" >login</a></span> or <a href="http://localhost/VillageBazaar/upload/index.php?route=account/register">create an account</a>.</b>      </div>
  <div class="links"><a href="http://localhost/VillageBazaar/upload/index.php?route=common/home">Home</a><a href="http://localhost/VillageBazaar/upload/index.php?route=account/account">My Account</a><a href="http://localhost/VillageBazaar/upload/index.php?route=checkout/cart">Shopping Cart</a><a href="http://localhost/VillageBazaar/upload/index.php?route=checkout/checkout">Checkout</a></div>
</div>
<div id="menu">
  <ul>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20">Desktops</a>
            <div>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20_26">PC (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20_27">Mac (1)</a></li>
                            </ul>
              </div>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18">Laptops &amp; Notebooks</a>
            <div>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18_46">Macs (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18_45">Windows (0)</a></li>
                            </ul>
              </div>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25">Components</a>
            <div>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_29">Mice and Trackballs (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_28">Monitors (2)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_30">Printers (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_31">Scanners (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_32">Web Cameras (0)</a></li>
                            </ul>
              </div>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=57">Tablets</a>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=17">Software</a>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=24">Phones &amp; PDAs</a>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=33">Cameras</a>
          </li>
        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34">MP3 Players</a>
            <div>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_43">test 11 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_44">test 12 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_47">test 15 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_48">test 16 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_49">test 17 (0)</a></li>
                            </ul>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_50">test 18 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_51">test 19 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_52">test 20 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_53">test 21 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_54">test 22 (0)</a></li>
                            </ul>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_55">test 23 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_56">test 24 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_38">test 4 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_37">test 5 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_39">test 6 (0)</a></li>
                            </ul>
                <ul>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_40">test 7 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_41">test 8 (0)</a></li>
                                        <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_42">test 9 (0)</a></li>
                                                                    </ul>
              </div>
          </li>
      </ul>
</div>
<div id="notification"></div>
<div id="column-left">
    <div class="box">
  <div class="box-heading">Categories</div>
  <div class="box-content">
    <ul class="box-category">
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20">Desktops (13)</a>
                        <ul>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20_26"> - PC (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=20_27"> - Mac (1)</a>
                      </li>
                  </ul>
              </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18">Laptops &amp; Notebooks (5)</a>
                        <ul>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18_46"> - Macs (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=18_45"> - Windows (0)</a>
                      </li>
                  </ul>
              </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25">Components (2)</a>
                        <ul>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_29"> - Mice and Trackballs (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_28"> - Monitors (2)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_30"> - Printers (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_31"> - Scanners (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=25_32"> - Web Cameras (0)</a>
                      </li>
                  </ul>
              </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=57">Tablets (1)</a>
                      </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=17">Software (0)</a>
                      </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=24">Phones &amp; PDAs (3)</a>
                      </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=33">Cameras (2)</a>
                      </li>
            <li>
                <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34">MP3 Players (4)</a>
                        <ul>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_43"> - test 11 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_44"> - test 12 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_47"> - test 15 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_48"> - test 16 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_49"> - test 17 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_50"> - test 18 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_51"> - test 19 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_52"> - test 20 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_53"> - test 21 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_54"> - test 22 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_55"> - test 23 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_56"> - test 24 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_38"> - test 4 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_37"> - test 5 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_39"> - test 6 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_40"> - test 7 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_41"> - test 8 (0)</a>
                      </li>
                    <li>
                        <a href="http://localhost/VillageBazaar/upload/index.php?route=product/category&amp;path=34_42"> - test 9 (0)</a>
                      </li>
                  </ul>
              </li>
          </ul>
  </div>
</div>
  </div>
 
<div id="content">  <div class="breadcrumb">
        <a href="http://localhost/VillageBazaar/upload/index.php?route=common/home">Home</a>
         &raquo; <a href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=40">iPhone</a>
      </div>
  <h1>iPhone</h1>
  <div class="product-info">
        <div class="left">
            <div class="image"><a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_1-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_1-228x228.jpg" title="iPhone" alt="iPhone" id="image" /></a></div>
                  <div class="image-additional">
                <a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_6-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_6-74x74.jpg" title="iPhone" alt="iPhone" /></a>
                <a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_2-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_2-74x74.jpg" title="iPhone" alt="iPhone" /></a>
                <a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_5-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_5-74x74.jpg" title="iPhone" alt="iPhone" /></a>
                <a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_3-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_3-74x74.jpg" title="iPhone" alt="iPhone" /></a>
                <a href="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_4-500x500.jpg" title="iPhone" class="colorbox"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/iphone_4-74x74.jpg" title="iPhone" alt="iPhone" /></a>
              </div>
          </div>
        <div class="right">
      <div class="description">
                <span>Brand:</span> <a href="http://localhost/VillageBazaar/upload/index.php?route=product/manufacturer/info&amp;manufacturer_id=8">Apple</a><br />
                <span>Product Code:</span> product 11<br />
                <span>Availability:</span> In Stock</div>
            <div class="price">Price:                $120.68                <br />
                <span class="price-tax">Ex Tax: $101.00</span><br />
                              </div>
                        <div class="cart">
        <div>Qty:          <input type="text" name="quantity" size="2" value="1" />
          <input type="hidden" name="product_id" size="2" value="40" />
          &nbsp;
          <input type="button" value="Add to Cart" id="button-cart" class="button" />
          <input type="submit"  name="button_pdf"  id="button_pdf"  value="ok" />
          <span>&nbsp;&nbsp;- OR -&nbsp;&nbsp;</span>
          <span class="links"><a onClick="addToWishList('40');">Add to Wish List</a><br />
            <a onClick="addToCompare('40');">Add to Compare</a></span>
        </div>
              </div>
            <div class="review">
        <div><img src="catalog/view/theme/default/image/stars-0.png" alt="0 reviews" />&nbsp;&nbsp;<a onClick="$('a[href=\'#tab-review\']').trigger('click');">0 reviews</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onClick="$('a[href=\'#tab-review\']').trigger('click');">Write a review</a></div>
        <div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style"><a class="addthis_button_compact">Share</a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> 
        </div>
      </div>
          </div>
  </div>
  <div id="tabs" class="htabs"><a href="#tab-description">Description</a>
            <a href="#tab-review">Reviews (0)</a>
            <a href="#tab-related">Related Products (1)</a>
      </div>
  <div id="tab-description" class="tab-content"><p class="intro">
	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.</p>
</div>
      <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title">Write a review</h2>
    <b>Your Name:</b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b>Your Review:</b>
    <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
    <span style="font-size: 11px;"><span style="color: #FF0000;">Note:</span> HTML is not translated!</span><br />
    <br />
    <b>Rating:</b> <span>Bad</span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span>Good</span><br />
    <br />
    <b>Enter the code in the box below:</b><br />
    <input type="text" name="captcha" value="" />
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button">Continue</a></div>
    </div>
  </div>
      <div id="tab-related" class="tab-content">
    <div class="box-product">
            <div>
                <div class="image"><a href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=42"><img src="http://localhost/VillageBazaar/upload/image/cache/data/demo/apple_cinema_30-80x80.jpg" alt="Apple Cinema 30&quot;" /></a></div>
                <div class="name"><a href="http://localhost/VillageBazaar/upload/index.php?route=product/product&amp;product_id=42">Apple Cinema 30&quot;</a></div>
                <div class="price">
                    <span class="price-old">$119.50</span> <span class="price-new">$107.75</span>
                  </div>
                        <a onClick="addToCart('42');" class="button">Add to Cart</a></div>
          </div>
  </div>
      </div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript"><!--

$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
    
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=40');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=40',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> Please Wait!</div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<div id="footer">
    <div class="column">
    <h3>Information</h3>
    <ul>
            <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/information&amp;information_id=4">About Us</a></li>
            <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/information&amp;information_id=6">Delivery Information</a></li>
            <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/information&amp;information_id=3">Privacy Policy</a></li>
            <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/information&amp;information_id=5">Terms &amp; Conditions</a></li>
          </ul>
  </div>
    <div class="column">
    <h3>Customer Service</h3>
    <ul>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/contact">Contact Us</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/return/insert">Returns</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=information/sitemap">Site Map</a></li>
    </ul>
  </div>
  <div class="column">
    <h3>Extras</h3>
    <ul>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/manufacturer">Brands</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/voucher">Gift Vouchers</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=affiliate/account">Affiliates</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=product/special">Specials</a></li>
    </ul>
  </div>
  <div class="column">
    <h3>My Account</h3>
    <ul>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/account">My Account</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/order">Order History</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/wishlist">Wish List</a></li>
      <li><a href="http://localhost/VillageBazaar/upload/index.php?route=account/newsletter">Newsletter</a></li>
    </ul>
  </div>
</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered">Powered By  Your Store &copy; 2014</div>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</body></html>