<?php
$category1;
$sub_category;
$qry_subcat;

//mysql_connect("localhost","root","");
//mysql_select_db("villagebazaar");
if(isset($_POST['sel_category']))
{
$category1=$_POST['sel_category'];
}
if(isset($_POST['current_category']))
{
$sub_category=$_POST['current_category'];
$qry_subcat ="SELECT name, c.category_id  as cid FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category1";
}

if(isset($_POST['show']))
{
//echo $category_id;
$qry_subcat ="SELECT name, c.category_id  as cid FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category1";
}
?>


<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
 
  <!--  <div class="heading"><h1><img src="view/image/product.png" alt="" /> <?php echo $title; ?> 
						<select id="select_category">
						<option value="0">All Categories</option>
						<?php
						foreach($categories as $category) {
							$category_id = intVal($category['category_id']);
							$category_name = $category['name'];
							$selected = ($current_category==intVal($category['category_id']))?"selected":"";
							echo "<option value='{$category_id}' {$selected}>{$category_name}</option>";
						}				
						?>
						</select></h1>
						
						
						
						
      <div class="buttons">
	 <!-- <a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>-->
	  <!--<a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a>-->
	 <!-- <a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a>
	  </div>
    </div> -->
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
          <table class='form'> 
              <td><span class="required">*</span> <?php echo "Select Category:"; ?></td>
          <td><select name="sel_category">
						<option value=""><?php echo "Please select"; ?></option>
						<?php
						$qry="SELECT name, c.category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=0";
						$rs = mysql_query($qry);
						while($row=mysql_fetch_array($rs))
						{
						if($category1==$row[1])
      						{
						echo "<option value='$row[1]' selected>$row[0]</option>";
						}
						else
						{
						echo "<option value='$row[1]' >$row[0]</option>";
						}
						}		
						?>
		</select>
		<input type="submit" name="show" value="Show SubCategory" />
		<select name="current_category">
						<option></option>
		 <?php				
						$rs = mysql_query($qry_subcat);
						while($row=mysql_fetch_array($rs))
						{
						if($sub_category==$row[1])
						{
						echo "<option value='$row[1]' selected>$row[0]</option>";
						}
						else
						{
						echo "<option value='$row[1]'>$row[0]</option>";
						}
						}		
					
		?>				
		</select> 
		<td style="text-align: right;"><a onclick="filter();"   class="button"><?php echo $button_filter; ?></a></td>				
          </tr>    
          </table>
		<table class="list">
          <thead> 
              <tr><td></td>
              <!--<td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>-->
              <td class="center"><?php echo $column_image; ?></td>
              <td class="center"><?php if ($sort == 'pd.name') { ?><?php echo $column_name; ?>
                <!--<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>-->
                <?php } ?></td>
              <!--<td class="left"><?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>-->
              <td class="center"><?php echo $column_price; ?></td>
         
              <td class="center"><?php echo $column_quantity; ?></td>
               
               
            <!--  <td class="left"><?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>-->
             <!-- <td class="right"><?php echo $column_action; ?></td>-->
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
           <!--   <td></td>-->
			 <!--  <td align="left"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>-->
           <!--    <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>-->
              <!--<td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>-->
             <!-- <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>--></td>
			    <!--  <td></td>-->
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
          
            </tr>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr><td></td>
              <!--<td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>-->
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
              <td class="left"><?php echo $product['name']; ?></td>
              <!--<td class="left"><?php echo $product['model']; ?></td>-->
              <td class="left"><?php if ($product['special']) { ?>
                <span style="text-decoration: line-through;"><?php echo $product['price']; ?></span><br/>
                <span style="color: #b00;"><?php echo $product['special']; ?></span>
                <?php } else { ?>
                <?php echo $product['price']; ?>
                <?php } ?></td>
              <td class="right"><?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000;"><?php echo $product['quantity']; ?></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500;"><?php echo $product['quantity']; ?></span>
                <?php } else { ?>
                <span style="color: #008000;"><?php echo $product['quantity']; ?></span>
                <?php } ?></td>
             <!-- <td class="left"><?php echo $product['status']; ?></td>-->
              <!--<td class="right"><?php foreach ($product['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>-->
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
     <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/productss&token=<?php echo $token; ?>';
	//
	//url += '&cid=<?php echo $current_category;?>';
	//
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
//	var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	//if (filter_model) {
	//	url += '&filter_model=' + encodeURIComponent(filter_model);
	//}
        var sel_category = $('select[name=\'sel_category\']').attr('value');
	
	if (sel_category) {
		url += '&sel_cat=' + encodeURIComponent(sel_category);
	}
	 var current_category = $('select[name=\'current_category\']').attr('value');
	
	if (current_category) {
		url += '&sel_subcat=' + encodeURIComponent(current_category);
	}
	var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	
//	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
//	if (filter_status != '*') {
//		url += '&filter_status=' + encodeURIComponent(filter_status);
//	}	

	location = url;
}
//
//$("#select_category").change(function() {
//							location.href="<?php echo html_entity_decode($this->url->link('catalog/productss', 'token=' . $this->session->data['token'] . '', 'SSL'));?>&cid="+$(this).val();
//						});
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