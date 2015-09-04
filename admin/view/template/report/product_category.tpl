
<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
        <div class="content">
        <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
          <tr>
          <td><span class="required">*</span> <?php echo "Select Category"; ?></td>
          <td><select name="sel_category" id="sel_category">
              	<option value="*" ><?php echo $text_select;?></option>
              		<?php foreach ($c_category as $result) { ?>
                   		<?php if ($result['category_id'] == $filter_parent_id) { ?>
                    		<option value="<?php echo $result['category_id']; ?>" selected="selected"><?php echo $result['name']; ?></option>
                    	<?php } else { ?>
                   			 <option value="<?php echo $result['category_id']; ?>"><?php echo $result['name']; ?></option>
                   			<?php } ?>
                  	<?php } ?>
            			</select>
                  
                     </td>
           </tr>
        
        <tr>
          <td><span class="required">*</span> <?php echo "Select Subcategory"; ?></td>
          <td>
				<select name="product_category" id="product_category">
              			<option value="*" ><?php if(isset($this->request->get['product_id']))
                        						{		
                                            		echo $update_subcategory;                                      			
                                                     
                                           		 }                                             
                                            	else
                                            	{
                                            		echo $text_select;
                                            	}
                                            
                                            ?></option></select>
    <!--<input align="left" type="submit" name="enter" value="Enter" class="button" />-->
                    </td>
        
   <!--   <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="geo_zone_id" id="geo_zone_id">
          <option value=""><?php echo $text_select; ?></option>
            </select>
            </td> -->

      
          <td style="text-align: right;"><a onclick="filter();"   class="button"><?php echo $button_filter; ?></a></td>
  
			<td style="text-align: right;">
				<a onclick="convert();"   class="button"><?php echo "Export to PDF"; ?></a>
				<!--<a href="<?php echo $createpdf?>" class="button"><?php echo "Export to PDF";?></a>-->
			</td>

        </tr>
      </table>
 
     
    
   <table class="list">
        <thead>
          <tr>
            <td class="center"><?php echo $column_name; ?></td>
             <td class="center"><?php echo $column_date_added; ?></td>
            <td class="center"><?php echo $column_price; ?></td>
            
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
          <tr>
            <td class="center"><?php echo $product['name']; ?></td>
           
            
           <td class="center"><?php echo $product['date_added']; ?></td>
           <td class="center"><?php echo $product['price']; ?></td>        
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
  
      
     
     </form>
  <!--  <div class="pagination" ><?php echo $pagination; ?></div> -->
      
    </div>
            
            
  </div>
</div>
<script type="text/javascript"><!--

function filter() {
	   
    url = 'index.php?route=report/product_category&token=<?php echo $token; ?>';
	var sel_category = $('#sel_category').attr('value');
	
	if (sel_category) {
		url += '&sel_category=' + encodeURIComponent(sel_category);
	}
	var product_category = $('#product_category').attr('value');
	
	if (product_category) {
		url += '&product_category=' + encodeURIComponent(product_category);
	}
   
	location = url;
	
}

function convert() {
	url = 'index.php?route=report/product_category/createPDF&token=<?php echo $token; ?>';
	
	var product_category = $('#product_category').attr('value');
	if (product_category) {
		url += '&product_category=' + encodeURIComponent(product_category);
	}   
	location = url;
}
/*
function fun_print(){
var divToPrint = document.getElementById('divToPrint');
        var popupWin = window.open('', '_blank', 'width=500,height=500');
        popupWin.document.open();
        popupWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</html>');
        popupWin.document.close();
}*/
//--></script> 


<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date-start').datepicker({dateFormat: 'yy-mm-dd'});
	
	$('#date-end').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 

<script>
$("#country_id").change(function(){
								 
	var postForm = { 
            'country_id'  : $(this).val()
            
        };
		
$.ajax({
        type: 'post',
        url: 'index.php?route=report/product_advertised/getState&token=<?php echo $token; ?>',
        dataType: 'html',
        data: postForm,
        success: function (data)		
		{
		$('#zone_id').html(data); 
		
       }
    });
        
    
}); 
</script> 

<script>
$("#zone_id").change(function(){
								 
	var postForm = { 
            'zone_id'  : $(this).val()
            
        };
		
$.ajax({
        type: 'post',
        url: 'index.php?route=report/product_advertised/getCity&token=<?php echo $token; ?>',
        dataType: 'html',
		data: postForm,
        success: function (data)		
		{
		$('#geo_zone_id').html(data); 
       }
    });
        
    
}); 
</script> 

<script>
$("#sel_category").change(function(){
								 
	var postForm = { 
            'sel_category'  : $(this).val()
            
        };
$.ajax({
        type: 'post',
        url: 'index.php?route=catalog/product/getSubcategory&token=<?php echo $token; ?>',
        dataType: 'html',
        data: postForm,
        success: function (data)		
		{
		//alert(html);
		$('#product_category').html(data); 
		
       }
    });
        
    
}); 
</script>

<?php echo $footer; ?>