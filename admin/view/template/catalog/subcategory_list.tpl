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
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
		
		<div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a>
		<a onclick="$('#form').submit();" class="button"><?php echo $button_delete; ?></a>
      </div>
    </div>
        <div class="content">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
      	<table class="form">
          	<tr>
          		<td><span class="required">*</span> <?php echo "Select Category"; ?></td>
         		<td><select name="filter_category_id">
                <option value="*">--Please Select--</option>
                  <?php foreach ($categories as $category) { ?>
                   <?php if ($category['category_id'] == $filter_category_id) { ?>
                    <option value="<?php echo $category['category_id'] ; ?>" selected="selected"><?php echo $category['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category['category_id'] ; ?>"><?php echo $category['name']; ?></option>
                   <?php } ?>
                  <?php } ?>
                </select>
				 <a onclick="filter();" align="left" class="button"><?php echo "Search Subcatgories"; ?></a>
        		</td>
        	</tr>
		</table>
		 <table class="list">
          <thead>
            <tr>
           <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>            
              <td class="left"><?php if ($sort == 'cd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
         
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
		<?php if ($subcategories) { ?>
            <?php foreach ($subcategories as $subcategory) { ?>
            <tr>
          <td style="text-align: center;"><?php if ($subcategory['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $subcategory['category_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $subcategory['category_id']; ?>" />
                <?php } ?></td>
              
              <td class="left"><?php echo $subcategory['name']; ?></td>
            
              <td class="right"><?php foreach ($subcategory['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?> 
		</tbody>        
      </table>     
     </form>
  		<div class="pagination" ><?php echo $pagination; ?></div>            
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/subcategory&token=<?php echo $token; ?>';
	
	var filter_category_id = $('select[name=\'filter_category_id\']').attr('value');
	
	if (filter_category_id != '*') {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}	
	//document.write(url);
	location = url;
}
$("#btnDelete").on('click', function() {
  document.getElementById("form").submit()
});
//--></script>

<?php echo $footer; ?>