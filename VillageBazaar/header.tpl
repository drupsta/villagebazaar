<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="view/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link type="text/css" href="view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="view/javascript/jquery/superfish/js/superfish.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript">
//-----------------------------------------
// Confirm Actions (delete, uninstall)
//-----------------------------------------
$(document).ready(function(){
    // Confirm Delete
    $('#form').submit(function(){
        if ($(this).attr('action').indexOf('delete',1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
    	
    // Confirm Uninstall
    $('a').click(function(){
        if ($(this).attr('href') != null && $(this).attr('href').indexOf('uninstall', 1) != -1) {
            if (!confirm('<?php echo $text_confirm; ?>')) {
                return false;
            }
        }
    });
});
</script>
</head>
<body>
<?php 
//print_r($views);
	if(isset($views)){
	foreach($views as $view)
	{
	  
	if(isset($view['name'])){
		$view = unserialize($view['view']);
		
		if(!empty($view['view'])){
		foreach($view['view'] as $key=>$value){
		$view=explode('/' ,$value);
//print_r($view);
		$loc[]=$view['0'];
		$hide[]=$view['1'];
             

		}}}

	//print_r($hide);
	}}

	
	 
	
?>
<div id="container">
<div id="header">
  <div class="div1">
    <div class="div2"><img src="view/image/logo.png" height="50"  width="300" title="<?php echo $heading_title; ?>" onClick="location = '<?php echo $home; ?>'" /></div>
    <?php if ($logged) { ?>
    <div class="div3"><img src="view/image/lock.png" alt="" style="position: relative; top: 3px;" />&nbsp;<?php echo $logged; ?></div>
    <?php } ?>
  </div>
  <?php if ($logged) { ?>
  <div id="menu">
    <ul class="left" style="display: none;">
<?php if(!empty($hide) && in_array('dashboard',$hide)){?>
     <div style="display:none;"> <li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></div>
  <?php } else { ?>
 <!-- <li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></li> -->

     </li>
<?php }?>

<?php if(!empty($hide) && in_array('catalog',$hide)){?>
     <div style="display:none;"> <li id="catalog"><a class="top"><?php echo $text_catalog; ?></a></li></div>
  <?php } else { ?>
   <li id="catalog"><a class="top"><?php echo $text_catalog; ?></a>
        <ul>

          <?php if(!empty($hide) && in_array('category',$hide)){?>

	  <div style="display:none;"><li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li></div>

          <?php } else { ?>

	  <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
	  <?php }?>
	  
          <?php if(!empty($hide) && in_array('product',$hide)){?>

	  <div style="display:none;"><li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li></div>

          <?php } else { ?>

	  <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>

	  <?php }?>

         <!-- <?php if(!empty($hide) && in_array('attribute',$hide)){?>
	  <div style="display:none;"><li><a class="parent"><?php echo $text_attribute; ?></a></li></div>
          <?php } else { ?>
	  <li><a class="parent"><?php echo $text_attribute; ?></a>
            <ul>
             <?php if(!empty($hide) && in_array('attribute',$hide)){?>
	     <div style="display:none;">


              <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li></div>
              <?php } else { ?>
              <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
              <?php }?>


            <?php if(!empty($hide) && in_array('attribute_group',$hide)){?>
	     <div style="display:none;">

              <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li></div>

	      <?php } else { ?>
	      <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
            <?php }?>

            </ul>
          </li>
	  <?php }?>
          

	  

           <?php if(!empty($hide) && in_array('filter',$hide)){?>
	  <div style="display:none;"><li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li></div>
	   <?php } else { ?>  
	   <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
          <?php }?>




          <?php if(!empty($hide) && in_array('profile',$hide)){?>
	  <div style="display:none;"><li><a href="<?php echo $profile; ?>"><?php echo $text_profile; ?></a></li></div>
	  <?php } else { ?> 
          <li><a href="<?php echo $profile; ?>"><?php echo $text_profile; ?></a></li>
	  <?php }?>



          <?php if(isset($hide) && in_array('option',$hide)){?>
	  <div style="display:none;"><li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li></div>
          <?php } else { ?>   
	  <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
	  <?php }?> 
          
	     <?php if(isset($hide) && in_array('manufacturer',$hide)){?>
	  <div style="display:none;"><li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li></div>
          <?php } else { ?>
	  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
	  <?php }?>

	       <?php if(isset($hide) && in_array('download',$hide)){?>
	  <div style="display:none;"> <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li></div>
          <?php } else { ?>
	   <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
	  <?php }?>

	   <?php if(isset($hide) && in_array('review',$hide)){?>
	  <div style="display:none;"> <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li></div>
          <?php } else { ?>
	    <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
	  <?php }?>
          
          <?php if(isset($hide) && in_array('information',$hide)){?>
	  <div style="display:none;"><li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li></div>
          <?php } else { ?>
	    <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
	  <?php }?> -->
         
        </ul>
      </li>
	  
	  <li id="account"><a class="top"><?php echo $text_account; ?></a>
       <ul>
          <li><a href="<?php echo $editaccount; ?>"><?php echo $text_editaccount; ?></a></li>
        </ul>
      </li>

      <?php }?> 
	  
	   <?php if(!empty($hide) && in_array('pricing',$hide)){?>
     <div style="display:none;"> <li id="pricing"><a class="top"><?php echo $text_pricing_policy; ?></a></li></div>
  <?php } else { ?>
   <li id="pricing"><a class="top"><?php echo $text_pricing_policy; ?></a>
        <ul>

          <?php if(!empty($hide) && in_array('pricing',$hide)){?>

	  <div style="display:none;"><li><a href="<?php echo $pricing; ?>"><?php echo $text_pricing; ?></a></li></div>

          <?php } else { ?>

	  <li><a href="<?php echo $pricing; ?>"><?php echo $text_pricing; ?></a></li>
	  <?php }?>
	   
        </ul>
      </li>

      <?php }?> 

<!-- Extension from page 234 to  388 -->
<!--   <?php if(!empty($hide) && in_array('extension',$hide)){?>
     <div style="display:none;"> <li id="extension"><a class="top"><?php echo $text_extension; ?></a></li></div>
  <?php } else { ?>
   <li id="extension"><a class="top"><?php echo $text_extension; ?></a>
   
        <ul>
	 <?php if(isset($hide) && in_array('module',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li></div>
	  <?php } else { ?>
	  <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>

	  <?php }?>


	   <?php if(isset($hide) && in_array('shipping',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li></div>
            <?php } else { ?>
                      <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
	    <?php }?>


	   <?php if(isset($hide) && in_array('payment',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li></div>
	  <?php } else { ?>
          <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
	  <?php }?>


	   <?php if(isset($hide) && in_array('total',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li></div>
	  <?php } else { ?>
          <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
	  <?php }?>


	   <?php if(isset($hide) && in_array('feed',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li></div>
	  <?php } else { ?>
          <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
	  <?php }?>
          





	   <?php if(isset($hide) && !in_array('openbay',$hide)){?>
	  <div style="display:none;">
         <li><a class="parent"><?php echo $text_openbay_extension; ?></a></li></div>
	  <?php } else { ?>
          <li><a class="parent"><?php echo $text_openbay_extension; ?></a>
                <ul>

	   <?php if(isset($hide) && in_array('dashboard',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li></div>
	  <?php } else { ?>
               <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
	  <?php }?>



	   <?php if(isset($hide) && in_array('manage_order',$hide)){?>
	  <div style="display:none;">
		      <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li></div>
	  <?php } else { ?>
                      <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
	  <?php }?>




	   <?php if(isset($hide) && in_array('bulk_order',$hide)){?>
	  <div style="display:none;">
                    <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li></div>
	  <?php } else { ?>
                    <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
	  <?php }?>









                    <?php if($openbay_markets['ebay'] == 1){ ?>
                    <li><a class="parent" href="<?php echo $openbay_link_ebay; ?>"><?php echo $text_openbay_ebay; ?></a>
                        <ul>
                            <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                            <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                            <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
                       </ul>
                    </li>
                    <?php } ?>  

                    <?php if($openbay_markets['amazon'] == 1){ ?>
                    <li><a class="parent" href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_amazon; ?></a>
                        <ul>
                            <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                            <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php if($openbay_markets['amazonus'] == 1){ ?>
                    <li><a class="parent" href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_amazonus; ?></a>
                        <ul>
                            <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                            <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                        </ul>
                    </li>
                    <?php } ?>

                    <?php if($openbay_markets['play'] == 1){ ?>
                    <li><a class="parent" href="<?php echo $openbay_link_play; ?>"><?php echo $text_openbay_play; ?></a>
                        <ul>
                            <li><a href="<?php echo $openbay_link_play_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                            <li><a href="<?php echo $openbay_link_play_report_price; ?>"><?php echo $text_openbay_report_price; ?></a></li>
                        </ul>
                    </li>
                    <?php } ?> 
                </ul>
            </li>
     

	  <?php }?> 




	













        </ul>
      </li>

<?php } ?>  -->
<!--
    <?php if(!empty($hide) && in_array('sale',$hide)){?>
     <div style="display:none;"><li id="sale"><a class="top"><?php echo $text_sale; ?></a></li></div>
  <?php } else { ?>


 <li id="sale"><a class="top"><?php echo $text_sale; ?></a> 


<ul>
	<?php if(isset($hide) && in_array('order',$hide)){?>
	<div style="display:none;">
	<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li></div>
	<?php } else { ?>
	<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
	<?php }?>

	<?php if(isset($hide) && in_array('return',$hide)){?>
	<div style="display:none;">
	<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li></div>
	<?php } else { ?>
	<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
	<?php }?>


	<?php if(isset($hide) && in_array('customer',$hide)){?>
	<div style="display:none;">
	<li><a class="parent"><?php echo $text_customer; ?></a></li></div>
	<?php } else { ?>
	<li><a class="parent"><?php echo $text_customer; ?></a>
	<ul>

		<?php if(isset($hide) && in_array('customer',$hide)){?>
		<div style="display:none;">
		<li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li></div>
		<?php } else { ?>
		<li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
		<?php }?>

		<?php if(isset($hide) && in_array('customer_group',$hide)){?>
		<div style="display:none;">
		<li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li></div>
		<?php } else { ?>
		<li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
		<?php }?>


		<?php if(isset($hide) && in_array('customer_blacklist',$hide)){?>
		<div style="display:none;">
		<li><a href="<?php echo $customer_blacklist; ?>"><?php echo $text_customer_blacklist; ?></a></li></div>
		<?php } else { ?>
		<li><a href="<?php echo $customer_blacklist; ?>"><?php echo $text_customer_blacklist; ?></a></li>
		<?php }?>

	</ul></li> 

	<?php }?>



	<?php if(isset($hide) && in_array('affiliate',$hide)){?>
	<div style="display:none;">
	<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li></div>
	<?php } else { ?>
	<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>

	<?php }?>


	<?php if(isset($hide) && in_array('coupon',$hide)){?>
	<div style="display:none;">
	<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li></div>
	<?php } else { ?>
	<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
	<?php }?>


	<?php if(isset($hide) && in_array('voucher',$hide)){?>
	<div style="display:none;">
	<li><a class="parent"><?php echo $text_voucher; ?></a></li></div>
	<?php } else { ?>
	<li><a class="parent"><?php echo $text_voucher; ?></a>
		<ul>
			<?php if(isset($hide) && in_array('voucher',$hide)){?>
			<div style="display:none;">
			<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li></div>
			<?php } else { ?>
			<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
			<?php }?>


			<?php if(isset($hide) && in_array('voucher_theme',$hide)){?>
			<div style="display:none;">
			<li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li></div>
			<?php } else { ?>
			<li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
			<?php }?>
		</ul>
           </li>
	<?php }?>



	<?php if(isset($hide) && in_array('contact',$hide)){?>
	<div style="display:none;">
	<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li></div>
	<?php } else { ?>
	<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>

	<?php }?>

</ul>
</li>
<?php } ?>  -->

    <?php if(!empty($hide) && in_array('system',$hide)){?>
<div style="display:none;"><li id="system"><a class="top"><?php echo $text_system; ?></a></li></div>
  <?php } else { ?>
     
      <li id="system"><a class="top"><?php echo $text_system; ?></a>
        <ul>

<!--	 <?php if(isset($hide) && in_array('setting',$hide)){?><div style="display:none;">
          <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li></div>

	  <?php } else { ?>

           <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
	  <?php }?>

	   <?php if(isset($hide) && in_array('design',$hide)){?>
	  <div style="display:none;">
          <li><a class="parent"><?php echo $text_design; ?></a> </li></div>
	  <?php } else { ?>
            <li><a class="parent"><?php echo $text_design; ?></a> 
            <ul>
	       <?php if(isset($hide) && in_array('layout',$hide)){?>
	       <div style="display:none;">
               <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li></div>
	       <?php } else { ?>
               <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
               <?php }?>

		    <?php if(isset($hide) && in_array('banner',$hide)){?>
		    <div style="display:none;">
		    <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li></div>
		    <?php } else { ?>
		    <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
		    <?php }?>
		    
	    </ul>
              </li>
	    <?php }?> -->
         


	   <?php if(isset($hide) && in_array('users',$hide)){?>
	  <div style="display:none;">
          <li><a class="parent"><?php echo $text_users; ?></a></li></div>
	  <?php } else { ?>

	  <li><a class="parent"><?php echo $text_users; ?></a>
            <ul>

	     <?php if(isset($hide) && in_array('user',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li></div>
	       <?php } else { ?>
	       <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
	       <?php }?>

             <?php if(isset($hide) && in_array('user_group',$hide)){?>
	     <div style="display:none;">
              <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li></div>
	      <?php } else { ?>
              <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
	      <?php }?>
            </ul>
                </li>
	    <?php }?>
          



	   <?php if(isset($hide) && in_array('localisation',$hide)){?>
	  <div style="display:none;">
          <li><a class="parent"><?php echo $text_localisation; ?></a></li></div>
	  <?php } else { ?>
           <li><a class="parent"><?php echo $text_localisation; ?></a>
            <ul>

<!--	    <?php if(isset($hide) && in_array('language',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li></div>
	      <?php } else { ?>
	                    <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
	       <?php } ?> 


	      <?php if(isset($hide) && in_array('currency',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li></div>
	      <?php } else { ?>
<li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
	      <?php } ?>

	      <?php if(isset($hide) && in_array('stock_status',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li></div>
	      <?php } else { ?>
 <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
	       <?php } ?>


	      <?php if(isset($hide) && in_array('order_status',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li></div>
	      <?php } else { ?>
	      <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
	      <?php } ?>

	      <?php if(isset($hide) && in_array('return',$hide)){?>
	  <div style="display:none;">
              <li><a class="parent"><?php echo $text_return; ?></a></div>
	      <?php } else { ?>
	      <li><a class="parent"><?php echo $text_return; ?></a>
                <ul>
			<?php if(isset($hide) && in_array('return_status',$hide)){?>
			   <div style="display:none;">
			  <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li></div>
			   <?php } else { ?>
			   <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
			   <?php } ?>


			  <?php if(isset($hide) && in_array('return_action',$hide)){?>
		  <div style="display:none;">
			  <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li></div>
			   <?php } else { ?>
			   <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
			   <?php } ?>


			  <?php if(isset($hide) && in_array('return_reason',$hide)){?>
		  <div style="display:none;">
			  <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li></div>
			   <?php } else { ?>
			      <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
			    <?php } ?>
                </ul></li>
		<?php } ?> -->
             
	   <?php if(isset($hide) && in_array('country',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li></div>
	      <?php } else { ?>
              <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
	      <?php }?>


	  <?php if(isset($hide) && in_array('zone',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li></div>
	      <?php } else { ?>
                  <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
	       <?php }?>


	   <?php if(isset($hide) && in_array('geo_zone',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li></div>
	      <?php } else { ?>
              <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
	       <?php }?>
		   
	<!-- Add csc master -->	   
 <?php if(isset($hide) && in_array('csc',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $csc; ?>"><?php echo $text_csc; ?></a></li></div>
	      <?php } else { ?>
              <li><a href="<?php echo $csc; ?>"><?php echo $text_csc; ?></a></li>
	       <?php }?>

<!--	      <?php if(isset($hide) && in_array('tax',$hide)){?>
	  <div style="display:none;">
              <li><a class="parent"><?php echo $text_tax; ?></a></div>
              <?php } else { ?>
              <li><a class="parent"><?php echo $text_tax; ?></a>

                 <ul>

	    <?php if(isset($hide) && in_array('class',$hide)){?>
	           <div style="display:none;">
                  <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li></div>
		  <?php } else { ?>
                  <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                  <?php }?>

		   <?php if(isset($hide) && in_array('tax_rate',$hide)){?>
	             
		  <div style="display:none;">
                  <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li></div>
		  <?php } else { ?>
		  <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                <?php }?>

                </ul></li></li>

		<?php }?>
              

	       <?php if(isset($hide) && in_array('length_class',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li></div>
	      <?php } else { ?>
               <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
	      <?php }?>



	       <?php if(isset($hide) && in_array('weight_class',$hide)){?>
	  <div style="display:none;">
              <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li></div>
	      <?php } else { ?>
               <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>

	      <?php }?> -->


            </ul></li>
	     <?php }?>
          


   <!--           <?php if(isset($hide) && in_array('error_log',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li></div>
          <?php } else { ?>

         <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
          <?php }?>

	   <?php if(isset($hide) && in_array('backup',$hide)){?>
	  <div style="display:none;">
          <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li></div>
	  <?php } else { ?>
              <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
	  <?php }?> -->
        </ul>
      </li>

  <?php }?>

    <?php if(!empty($hide) && in_array('report',$hide)){?>
     <div style="display:none;"><li id="reports"><a class="top"><?php echo $text_reports; ?></a></a></li></div>
  <?php } else { ?>

<li id="reports"><a class="top"><?php echo $text_reports; ?></a>
	 <ul>

	<!--	<?php if(isset($hide) && in_array('sale',$hide)){?>
		<div style="display:none;">
		<li><a class="parent"><?php echo $text_sale; ?></a></li></div>
		<?php } else { ?> 
			<li><a class="parent"><?php echo $text_sale; ?></a> 
				<ul> 

				      <?php if(isset($hide) && in_array('sale_order',$hide)){?>
		                        <div style="display:none;">
					<li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                                       <?php } else { ?>
				       <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                                       <?php }?> -->
<?php if(isset($hide) && in_array('product_viewed',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                      <?php } else { ?>
		    <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                    <?php } ?>
					

                        <!--               <?php if(isset($hide) && in_array('sale_tax',$hide)){?>
		                      <div style="display:none;">

					<li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
					<?php } else { ?>
                                          <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
					<?php }?>


					<?php if(isset($hide) && in_array('sale_shipping',$hide)){?>
		                          <div style="display:none;">
					<li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
					<?php } else { ?>
					<li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
					<?php }?>



					<?php if(isset($hide) && in_array('sale_return',$hide)){?>
		                           <div style="display:none;">
					<li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
					<?php } else { ?>
                                        <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
                                        <?php }?>

					<?php if(isset($hide) && in_array('sale_coupon',$hide)){?>
		                       <div style="display:none;">
					<li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
					<?php } else { ?>
                                          <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
					<?php }?> -->
					
						<?php }?> 
		
		<?php if(!empty($hide) && in_array('productt',$hide)){?>

	  <div style="display:none;"><li><a href="<?php echo $productt; ?>"><?php echo $text_pro; ?></a></li></div>

          <?php } else { ?>

	  <li><a href="<?php echo $report_product_category; ?>"><?php echo $text_report_product_category; ?></a></li>
      <li><a href="<?php echo $report_product_advertised; ?>"><?php echo $text_report_product_advertised; ?></a></li>
        <li><a href="<?php echo $active_sellers; ?>"><?php echo $text_active_sellers; ?></a></li>
        <li><a href="<?php echo $report_product_expiry; ?>"><?php echo $text_report_product_expiry; ?></a></li>

				<?php } ?> 
			</ul>
            </li>
				
				

	



	<!--	<?php if(isset($hide) && in_array('product',$hide)){?>
			<div style="display:none;">
			<li><a class="parent"><?php echo $text_product; ?></a></li></div>
		<?php } else { ?>
			<li><a class="parent"><?php echo $text_product; ?></a>
			<ul> 
			<?php if(isset($hide) && in_array('product_viewed',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                      <?php } else { ?>
		    <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                    <?php } ?> -->

		<!--		<?php if(isset($hide) && in_array('product_purchased',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
				<?php } else { ?>
				<li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
				<?php } ?> 
			</ul></li>

		<?php }?> -->



<!--
		<?php if(isset($hide) && in_array('customer',$hide)){?>
			<div style="display:none;">
			<li><a class="parent"><?php echo $text_customer; ?></a></li></div>
			<?php } else { ?>
			<li><a class="parent"><?php echo $text_customer; ?></a>
			<ul>

			<?php if(isset($hide) && in_array('customer_online',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
							<?php } else { ?>
							<li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
							<?php }?>
                            


				<?php if(isset($hide) && in_array('customer_order',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
							<?php } else { ?>
							<li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
							<?php }?>



				<?php if(isset($hide) && in_array('customer_reward',$hide)){?>
			<div style="display:none;">
				<li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
							<?php } else { ?>
							<li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
							<?php }?>



				             <?php if(isset($hide) && in_array('customer_credit',$hide)){?>
			                      <div style="display:none;">
			                  	<li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
							<?php } else { ?>
                                                <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
							<?php }?>
			</ul>
                         </li>
		<?php }?>



		<?php if(isset($hide) && in_array('affiliate',$hide)){?>
		<div style="display:none;">
		<li><a class="parent"><?php echo $text_affiliate; ?></a></li></div>

		<?php } else { ?>
		<li><a class="parent"><?php echo $text_affiliate; ?></a>
		<ul>
		<li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
		</ul>
                 </li>
		<?php }?>

	</ul>
</li> 

<?php }?> -->

	<!--	<?php if(isset($hide) && in_array('help',$hide)){?>
		<div style="display:none;">

      <li id="help"><a class="top"><?php echo $text_help; ?></a></li>


      <?php } else { ?>
      <li id="help"><a class="top"><?php echo $text_help; ?></a>
        <ul>


		<?php if(isset($hide) && in_array('home',$hide)){?>
		<div style="display:none;">
          <li><a onClick="window.open('http://www.opencart.com');"><?php echo $text_opencart; ?></a></li></div>
  <?php } else { ?>
<li><a onClick="window.open('http://www.opencart.com');"><?php echo $text_opencart; ?></a></li>
  <?php } ?>



		<?php if(isset($hide) && in_array('doc',$hide)){?>
		<div style="display:none;">
          <li><a onClick="window.open('http://www.opencart.com/index.php?route=documentation/introduction');"><?php echo $text_documentation; ?></a></li></div>
  <?php } else { ?>
 <li><a onClick="window.open('http://www.opencart.com/index.php?route=documentation/introduction');"><?php echo $text_documentation; ?></a></li>
  <?php } ?>
         


		<?php if(isset($hide) && in_array('support',$hide)){?>
		<div style="display:none;">
          <li><a onClick="window.open('http://forum.opencart.com');"><?php echo $text_support; ?></a></li></div>
  <?php } else { ?>
<li><a onClick="window.open('http://forum.opencart.com');"><?php echo $text_support; ?></a></li>
  <?php } ?> -->

          



        </ul>
      </li><?php } ?>
    </ul>
    <ul class="right">
      <li id="store"><a onClick="window.open('<?php echo $store; ?>');" class="top"><?php echo $text_front; ?></a>
        <ul>
          <?php foreach ($stores as $stores) { ?>
          <li><a onClick="window.open('<?php echo $stores['href']; ?>');"><?php echo $stores['name']; ?></a></li>
          <?php } ?>
        </ul>
      </li>
   <!--   <li id="store"><a class="top" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li> -->
<li id="store"><a class="top" href="<?php echo $store; ?>"><?php echo $text_logout; ?></a></li>
 <!--<li id="store"><a onClick="window.open('<?php echo $store; ?>');" class="top"><?php echo $text_logout; ?></a></li>-->
    </ul>
    <script type="text/javascript"><!--
$(document).ready(function() {
	$('#menu > ul').superfish({
		hoverClass	 : 'sfHover',
		pathClass	 : 'overideThisToUse',
		delay		 : 0,
		animation	 : {height: 'show'},
		speed		 : 'normal',
		autoArrows   : false,
		dropShadows  : false, 
		disableHI	 : false, /* set to true to disable hoverIntent detection */
		onInit		 : function(){},
		onBeforeShow : function(){},
		onShow		 : function(){},
		onHide		 : function(){}
	});
	
	$('#menu > ul').css('display', 'block');
});
 
function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

$(document).ready(function() {
	route = getURLVar('route');
	
	if (!route) {
		$('#dashboard').addClass('selected');
	} else {
		part = route.split('/');
		
		url = part[0];
		
		if (part[1]) {
			url += '/' + part[1];
		}
		
		$('a[href*=\'' + url + '\']').parents('li[id]').addClass('selected');
	}
});
//--></script> 
  </div>
  <?php } ?>
</div>
 