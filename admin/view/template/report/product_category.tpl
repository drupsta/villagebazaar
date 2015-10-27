<?php
if(isset($_POST['cmdPrint']))
{
session_start();
$_SESSION['sel_category']=$_POST['sel_category'];
$_SESSION['product_category']=$_POST['product_category'];

header('Location: view/template/report/productCategory.php');
}
?>


<?php
$category_id;
$sub_category;
$qry_subcat;

//mysql_connect("localhost","root","");
//mysql_select_db("villagebazaar");
if(isset($_POST['sel_category']))
{
$category_id=$_POST['sel_category'];
}
if(isset($_GET['sel_category']))
{
$category_id=$_GET['sel_category'];
}
if(isset($_GET['product_category']))
{ 
$sub_category=$_GET['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id";
}
if(isset($_POST['product_category']))
{
$sub_category=$_POST['product_category'];
//$_SESSION['product_category']=$_POST['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id";
//$_SESSION['sel_category']=$_POST['sel_category'];
}

if(isset($_POST['show']))
{
$category_id;
//$sub_category=$_POST['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id";
}

//if(isset($_POST['enter']))
//{
//$category_id=$_POST['sel_category'];
//$sub_category=$_POST['product_category'];
//$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id";
//}
?>


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
              <option value=""><?php echo $text_select; ?></option>
              <?php
						$qry="SELECT name, c.category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=0 and status=1 order by name";
						$rs = mysql_query($qry);
						while($row=mysql_fetch_array($rs))
						{
						if(($category_id==$row[1]) || ($sel_category==$row[1]) )
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
              <!--<input align="left" type="submit" name="show" value="Show Subcategory" class="button" />-->
                     </td>
           </tr>
        
        <tr>
          <td><span class="required">*</span> <?php echo "Select Subcategory"; ?></td>
          <td><select name="product_category" id="product_category">
             <option value=""><?php echo "---Please Select---"; ?></option>
          <?php				
						$rs = mysql_query($qry_subcat);
						while($row=mysql_fetch_array($rs))
						{
						if(($sub_category==$row[1]) || ($product_category==$row[1]))
						
                                               // if($_SESSION['product_category']==$row[1])
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
    <!--<input align="left" type="submit" name="enter" value="Enter" class="button" />-->
                    </td>
        
          
              
            
                      
            
         <!--   <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="geo_zone_id" id="geo_zone_id">
          <option value=""><?php echo $text_select; ?></option>
            </select>
            </td> -->

      
          <td style="text-align: right;"><a onclick="filter();"   class="button"><?php echo $button_filter; ?></a></td>
  <!-- <td style="text-align: right;"><a onclick="fun_print();" class="button"><?php echo $button_download; ?></a></td>-->
<td style="text-align: right;"><input type="submit" name="cmdPrint" value="Export to PDF" class="button" />

<!--<a href="view/template/report/pdfCreation.php" class="button"><?php echo $button_download; ?></a></td> -->

<!-- <td style="text-align: right;"><a onclick="$('#form').attr('action', '<?php echo $print_report ; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_download; ?></a></td> -->
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
	var sel_category = $('select[name=\'sel_category\']').attr('value');
	
	if (sel_category) {
		url += '&sel_category=' + encodeURIComponent(sel_category);
	}
	 var product_category = $('select[name=\'product_category\']').attr('value');
	
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