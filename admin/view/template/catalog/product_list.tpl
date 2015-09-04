<?php echo $header; ?>

<style>
.success1 {
	padding: 1px 10px 10px 33px;
	margin-bottom: 5px;
	color: black;
        font-weight: bold;
        font-size: 14px;
	-webkit-border-radius: 1px 1px 1px 1px;
	-moz-border-radius: 1px 1px 1px 1px;
	-khtml-border-radius: 1px 1px 1px 1px;
	border-radius: 1px 1px 1px 1px;
}
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="success1"><marquee behavior="alternate"><mark><?php echo "Please click on 'Advertise' button to advertise your products" ; ?></mark></marquee></div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
     
      <div class="buttons">
	<!--  <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>-->
          <a href="<?php echo $insert; ?>" class="button"><?php echo "Advertise"; ?></a>
	  
	  <a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a>
	  </div>
    </div>
      <div class="pagination"><?php echo $pagination; ?></div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
               <?php if ($products) { ?>
           <tr><h4>  <?php echo "Products Advertised within : ";  ?>
         <select name="filter_week">
              <?php
              $curr_val=array("All"=>"All","30"=>"30","60" => "60","90" => "90");
				foreach($curr_val as $cval=>$cval1)
                {
                     if($cval==$_GET['filter_week']){
                    	
						echo "<option selected value=$cval>$cval1</option>";
                     }
                     else
                     {
                     	echo "<option value=$cval>$cval1</option>";
                     }
                }
                      ?>
              
         </select><?php echo "  days";  ?><span style="color:blue">   (Please select number of days and click on "Search By" button) </span></h4></tr>
        <tr></tr>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="center"><?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <!--<td class="left"><?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>-->
              <td class="center"><?php if ($sort == 'p.price') { ?>
                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?></td>
            <!--  <td class="center"><?php if ($sort == 'p.quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td> -->
              <td class="center"><?php if ($sort == 'date_added1') { ?>
                <a href="<?php echo $sort_dateadded; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_dateadded; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_dateadded; ?>"><?php echo $column_dateadded; ?></a>
                <?php } ?></td>
              <td class="center"><?php if ($sort == 'p.date_expiry') { ?>
                <a href="<?php echo $sort_expirydate; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_expirydate; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_expirydate; ?>"><?php echo $column_expirydate; ?></a>
                <?php } ?></td>
            <!--  <td class="left"><?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>-->
              <td class="right"><?php echo $column_action; ?></td> 
            </tr>
            <?php } ?>
          </thead>
          <tbody>
              <?php if ($products) { ?>
            <tr class="filter">
              <td></td>
			   <td align="center"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
               <td align="center"><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
              <!--<td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>-->
              <td align="center"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
           <!--   <td align="center"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>-->
              <td align="center"><input type="text"  name="filter_dateadded" value="<?php echo $filter_dateadded; ?>" style="text-align: center; " placeholder="YYYY-MM-DD" /></td>
		 <td align="center"><input type="text"  name="filter_expirydate" value="<?php echo $filter_expirydate; ?>" style="text-align: center; " placeholder="YYYY-MM-DD" /></td>
            <!--  <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>-->
            <td></td>
            </tr>
            <?php } ?>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
              <td class="center"><?php echo $product['name']; ?></td>
              <!--<td class="left"><?php echo $product['model']; ?></td>-->
              <td class="center"><?php if ($product['special']) { ?>
                <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                <span style="color: #b00;"><?php echo $product['special']; ?></span>
                <?php } else { ?>
                <?php echo $product['price']; ?>
                <?php } ?></td>
              <td class="center"><?php echo $product['date_added']; ?></td>
          <!--    <td class="center"><?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000;"><?php echo $product['quantity']; ?></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500;"><?php echo $product['quantity']; ?></span>
                <?php } else { ?>
                <span style="color: #008000;"><?php echo $product['quantity']; ?></span>
                <?php } ?></td>-->
              <td class="center"><?php echo $product['date_expiry']; ?></td>
             <!-- <td class="left"><?php echo $product['status']; ?></td>-->
              <td class="right"><?php foreach ($product['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td> 
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo "Currently no products advertised by you!!"; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
  <!--    <div class="pagination"><?php echo $pagination; ?></div>-->
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';
	//alert(url);
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
//	var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	//if (filter_model) {
	//	url += '&filter_model=' + encodeURIComponent(filter_model);
	//}
	
	var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	var filter_expirydate = $('input[name=\'filter_expirydate\']').attr('value');
	
	if (filter_expirydate) {
		url += '&filter_expirydate=' + encodeURIComponent(filter_expirydate);
	}
        var filter_dateadded = $('input[name=\'filter_dateadded\']').attr('value');
        if (filter_dateadded) {
        url += '&filter_dateadded=' + encodeURIComponent(filter_dateadded);
        }
         var filter_week = $('select[name=\'filter_week\']').attr('value');
	
	if (filter_week) {
		url += '&filter_week=' + encodeURIComponent(filter_week);
	}
//	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
//	if (filter_status != '*') {
//		url += '&filter_status=' + encodeURIComponent(filter_status);
//	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<?php echo $footer; ?>