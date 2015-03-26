<?php
$category_id1;
$sub_category;
$qry_subcat;

if(isset($_POST['category_id1']))
{
$category_id1=$_POST['category_id1'];
}
if(isset($_GET['category_id']))
{
$category_id1=$_GET['category_id'];
}
if(isset($_GET['product_category']))
{ 
$sub_category=$_GET['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id1";
}
if(isset($_POST['product_category']))
{
$sub_category=$_POST['product_category'];
//$_SESSION['product_category']=$_POST['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id1";
//$_SESSION['category_id']=$_POST['category_id'];
}

if(isset($_POST['show']))
{
$category_id1;
//$sub_category=$_POST['product_category'];
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id1";
}

//if(isset($_POST['enter']))
//{
//$category_id1=$_POST['category_id'];
//$sub_category=$_POST['product_category'];
//$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$category_id1";
//}
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
    <div class="heading">
      <h1><img src="view/image/report.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
        <div class="content">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
          <tr>
          <td><span class="required">*</span> <?php echo "Select Category"; ?></td>
          <td><select name="category_id1" id="category_id1">
              <option value=""><?php echo "Please Select"; ?></option>
              <?php
						$qry="SELECT name, c.category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=0 and status=1 order by name";
						$rs = mysql_query($qry);
						while($row=mysql_fetch_array($rs))
						{
						if(($category_id1==$row[1]) || ($category_id==$row[1]) )
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

      
          <td style="text-align: left;"><a onclick="filter();"   class="button"><?php echo "Edit Subcategory"; ?></a></td>
          <td style="text-align: left;"><a onclick="$('#form').submit();" class="button"><?php echo "Delete Subcategory"; ?></a></td>
  <!-- <td style="text-align: right;"><a onclick="fun_print();" class="button"><?php echo $button_download; ?></a></td>-->
<!--<td style="text-align: right;"><input type="submit" name="cmdPrint" value="Export to PDF" class="button" />-->

<!--<a href="view/template/report/pdfCreation.php" class="button"><?php echo $button_download; ?></a></td> -->

<!-- <td style="text-align: right;"><a onclick="$('#form').attr('action', '<?php echo $print_report ; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_download; ?></a></td> -->
        </tr>
      </table>
 
     
    
 <!--  <table class="list">
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
      </table> -->
  
      
     
     </form>
  <!--  <div class="pagination" ><?php echo $pagination; ?></div> -->
      
    </div>
            
            
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
var category_id1 = $('select[name=\'category_id1\']').attr('value');
var product_category = $('select[name=\'product_category\']').attr('value');
    if(category_id1){
        if (product_category != 0){
            url = 'index.php?route=catalog/subcategory/update&token=<?php echo $token; ?>';
            url += '&category_id=' + encodeURIComponent(category_id1);
            url += '&product_category=' + encodeURIComponent(product_category);
            location = url;
            }
        else
            {
                alert ('Please Select Subcategory !!!');
            } 
     }
    else
        {
                alert ('Please select category !!!');
            }
   
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


<script>
$("#category_id1").change(function(){
								 
	var postForm = { 
            'category_id1'  : $(this).val()
            
        };
$.ajax({
        type: 'post',
        url: 'index.php?route=catalog/subcategory/getSubcategory&token=<?php echo $token; ?>',
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