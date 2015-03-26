
<?php echo $header; ?>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
 <!--   <?php
$qry="SELECT c.category_id as category_id, name FROM oc_category c, oc_category_description cd WHERE ((PARENT_ID =0) and (c.category_id=cd.category_id) and (c.category_id not in (select parent_id from oc_category))) ";
$rs = mysql_query($qry);
while ($row=mysql_fetch_array($rs)){ ?>
<div class="warning">   <?php echo $row['name']." Category has no Subcategory. Please create atleast one subcategory or click on repair button to delete the category."; ?> </div>
<?php } ?> -->
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo "Insert New Category/Subcategory"; ?></a><a onclick="$('#form').submit();" class="button"><?php echo "Delete Selected Category"; ?></a></div>
     <!-- <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>-->
   <!--   <div class="buttons"><a href="<?php echo $repair; ?>" class="button"><?php echo $button_repair; ?></a><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>-->
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
          
          <table class="list">
            
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php echo $column_name; ?></td>
           <!--   <td class="right"><?php echo $column_sort_order; ?></td> -->
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
             <!-- Filter for category added-->
        <!--      <tr class="filter">
                  <td></td>
             
		<td align="left"><input type="text" name="filter_category" value="<?php echo $filter_category; ?>" /><span style="color:blue"> (Enter the First alphabet and select the Category. Click on "Find Subcategories" button for viewing its Subcategories.) </span></td>	   
               <td align="right"><a onclick="filter();" class="button"><?php echo "Find Subcategories"; ?></a></td>-->
             
              <!--<td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>-->
              
                      </tr>
                      
                      
            <?php if ($categories) { ?>
            <?php foreach ($categories as $category) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($category['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $category['category_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $category['name']; ?></td>
        <!--      <td class="right"><?php echo $category['sort_order']; ?></td>-->
              <td class="right"><?php foreach ($category['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
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
//alert("hello");

	url = 'index.php?route=catalog/category&token=<?php echo $token; ?>';
	//alert(url);
	var filter_category = $('input[name=\'filter_category\']').attr('value');
	
	if (filter_category) {
		url += '&filter_category=' + encodeURIComponent(filter_category);
	}
	

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
$('input[name=\'filter_category\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_category=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_category\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});


//--></script>

<?php echo $footer; ?>