<?php
if(isset($_POST['cmdPrint']))
{
session_start();
$_SESSION['filter_date_start']=$_POST['filter_date_start'];
$_SESSION['filter_date_end']=$_POST['filter_date_end'];
$_SESSION['filter_manufacturer_name']=$_POST['filter_manufacturer_name'];
$_SESSION['filter_cec']=$_POST['filter_cec'];
$_SESSION['filter_zone']=$_POST['filter_zone'];
header('Location: view/template/report/activeSellers.php');
}
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
      <h1><img src="view/image/report.png" alt="" /> <?php echo "Users Profile"; ?></h1>
    </div>
        <div class="content">
        <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
       <!--   <td><?php echo $entry_date_start; ?>
            <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" id="date-start" size="12" /></td>
          <td><?php echo $entry_date_end; ?>
            <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" id="date-end" size="12" /></td>-->
           <td><?php echo "Username: "; 
               //print_r($manufacturers);
               ?>
               <select name="filter_manufacturer_name">
              <option value="0"><?php echo "--All Users--"; ?></option>
              <?php foreach ($manufacturers as $manufacturer) { ?>
              <?php if ($manufacturer['user_id'] == $filter_manufacturer_name) { ?>
              <option value="<?php echo $manufacturer['user_id']; ?>" selected="selected"><?php echo $manufacturer['username']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $manufacturer['user_id']; ?>"><?php echo $manufacturer['username']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
            


      <!--   <td><?php echo $entry_country;  ?></td>
          <td><select name="filter_country" id="country_id">
              <option value="0"><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $filter_country) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
  
           <?php if ($error_country) { ?>
            <span class="error"><?php echo $error_country; ?></span>
            <?php } ?>   </td> -->
          
     <!--   <td><?php echo $entry_zone; ?></td>
          <td><select name="filter_zone" id="zone_id"><option value=""><?php echo $text_select; ?></option>
            <?php foreach ($states as $state) { ?>
              <?php if ($state['zone_id'] == $filter_zone) { ?>
              <option value="<?php echo $state['zone_id']; ?>" selected="selected"><?php echo $state['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $state['zone_id']; ?>"><?php echo $state['name']; ?></option>
              <?php } ?>
              <?php } ?>
              </select>
            <?php if ($error_zone) { ?>
            <span class="error"><?php echo $error_zone; ?></span>
            <?php } ?></td>-->


       <!--  <td><?php echo $entry_zone; ?></td>
          <td><select name="filter_zone" id="zone_id">
           <?php if ($country['country_id'] == $filter_country) { ?>
           <option value="<?php echo $filter_zone; ?>"><?php echo "gghh".$result['name'] ?></option>
            <?php } else { ?>
           <option value="<?php echo $filter_zone; ?>"><?php echo $filter_zone ?></option>
          <?php } ?>
            </select>
            <?php if ($error_zone) { ?>
            <span class="error"><?php echo $error_zone; ?></span>
            <?php } ?></td> -->
            
            
          <td><?php echo $entry_cec; ?>
		    <select name="filter_cec" id="cec_id">   
               <option value=""><?php echo $text_select; ?></option>               
                  <?php foreach ($cec_details as $cec) { ?>
                  <?php if ($cec['csc_id'] == $filter_cec) { ?>
                  <option value="<?php echo $cec['csc_id']; ?>" selected="selected" ><?php echo $cec['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $cec['csc_id']; ?>"><?php echo $cec['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
				<?php if ($error_cec) { ?>
            <span class="error"><?php echo $error_cec; ?></span>
            <?php } ?></td>            
            
         <!--   <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="geo_zone_id" id="geo_zone_id">
          <option value=""><?php echo $text_select; ?></option>
            </select>
            </td> -->

      
          <td style="text-align: right;"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
   <!--    <td style="text-align: right;"><a onclick="fun_print();" class="button"><?php echo $button_download; ?></a></td>
         <td style="text-align: right;"><input type="submit" name="cmdPrint" value="Export to PDF" class="button" />-->
<!--  <td style="text-align: right;"><a onclick="$('#form').attr('action', '<?php echo $print_report ; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_download; ?></a></td> -->
        </tr>
      </table>
 
     
    
   <table class="list">
        <thead>
          <tr>
         <!--   <td class="left"><?php echo $column_name; ?></td>-->
            <td class="left"><?php echo "Username"; ?></td>
            <td class="left"><?php echo "Complete Name"; ?></td>
            <td class="left"><?php echo "Email"; ?></td>
            <td class="left"><?php echo "Mobile No."; ?></td>
            <td class="left"><?php echo "User Type"; ?></td>
          <!-- <td class="left"><?php echo $column_country; ?></td> -->
            <td class="center"><?php echo $column_zone; ?></td> 
             <td class="center"><?php echo $column_cec; ?></td> 
           <!--  <td class="center"><?php echo "No. Of Products" ?></td> -->
           <!-- <td class="left"><?php echo $column_geo_zone; ?></td>-->
            <td class="right"><?php echo $column_date_added; ?></td>
          <!--  <td class="right"><?php echo $column_price; ?></td>-->
            
          </tr>
        </thead>
        <tbody>
          <?php if ($products) { ?>
          <?php foreach ($products as $product) { ?>
          <tr>
        <!--    <td class="left"><?php echo $product['name']; ?></td>-->
           
            <td class="left"><?php echo $product['name']; ?></td>
            <td class="left"><?php echo $product['fullname']; ?></td>
            <td class="left"><?php echo $product['email']; ?></td>
            <td class="left"><?php echo $product['mobile']; ?></td>
            <td class="left"><?php echo $product['usergroup']; ?></td>
    <!--	  <td class="left"><?php echo $product['country']; ?></td>-->
           <td class="center"><?php echo $product['zone']; ?></td> 
           <td class="center"><?php echo $product['cec']; ?></td>
         <!--  <td class="center"><?php echo $product['count']; ?></td> -->
         <td class="right"><?php echo $product['date_added']; ?></td>
          <!--   <td class="right"><?php echo $product['price']; ?></td>        -->
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
  
         <!--   <div style="text-align: right">  <input type="submit" name="cmdPrint" value="Export to PDF" class="button" /></div>-->
     
     </form>
  <!--  <div class="pagination" ><?php echo $pagination; ?></div> -->
      
    </div>
            
            
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=report/users_profile&token=<?php echo $token; ?>';
	
    var filter_date_start = $('input[name=\'filter_date_start\']').attr('value');
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').attr('value');
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	var filter_manufacturer_name = $('select[name=\'filter_manufacturer_name\']').attr('value');
	
	if (filter_manufacturer_name) {
		url += '&filter_manufacturer_name=' + encodeURIComponent(filter_manufacturer_name);
	}
     // alert(filter_manufacturer_name);
	//var filter_order_status_id = $('select[name=\'filter_order_status_id\']').attr('value');
	
	//if (filter_order_status_id != 0) {
	//	url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	//}
	
	var filter_country = $('select[name=\'filter_country\']').attr('value');
	
	if (filter_country) {
		url += '&filter_country=' + encodeURIComponent(filter_country);
	}
	
	var filter_zone = $('select[name=\'filter_zone\']').attr('value');
	
	if (filter_zone) {
		url += '&filter_zone=' + encodeURIComponent(filter_zone);
	}
	var filter_cec = $('select[name=\'filter_cec\']').attr('value');
	
	if (filter_cec) {
		url += '&filter_cec=' + encodeURIComponent(filter_cec);
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
        url: 'index.php?route=report/active_sellers/getState&token=<?php echo $token; ?>',
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
        url: 'index.php?route=report/active_sellers/getCity&token=<?php echo $token; ?>',
        dataType: 'html',
		data: postForm,
        success: function (data)		
		{
		$('#geo_zone_id').html(data); 
       }
    });
        
    
}); 
</script> 

<?php echo $footer; ?>