<?php echo $header; ?>
<!--<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?>
<?php echo $column_right; ?>-->
<div id="content"><?php echo $content_top; ?>
 <!-- <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>-->
  <h1><!-- <?php echo $heading_title; ?></h1>-->
  <p><!-- <?php echo $text_adminaccount_already; ?></p>-->
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h2><?php echo $text_your_details; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" value="<?php echo ucwords($firstname); ?>" />
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
          <td><input type="text" name="lastname" value="<?php echo ucwords($lastname); ?>" />
            <?php if ($error_lastname) { ?>
            <span class="error"><?php echo $error_lastname; ?></span>
            <?php } ?></td>
        </tr>
		
        <tr>
          <td><span class="required">*</span><?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="<?php echo $email; ?>" />
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } else if ($error_email1) {?> 
            <span class="error"><?php  echo $error_email1; } ?></span></td>
        </tr>
       <tr>
          <td><span class="required">*</span><?php echo "Re-enter E-Mail: "; ?></td>
          <td><input type="text" name="email_confirm" value="<?php echo $email_confirm; ?>" />
            <?php if ($error_email2) { ?>
            <span class="error"><?php echo $error_email2; ?></span>
            <?php } ?> 
            </td>
        </tr> 
      <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" size="2" />-<input type="text" size="10" name="telephone" value="<?php echo $telephone; ?>" />
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
		
		
		<tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_landline; ?></td>
          <td><input type="text" size="2" />-<input type="text" size="10" name="landline" value="<?php echo $landline; ?>" />
            <?php if ($error_landline) { ?>
            <span class="error"><?php echo $error_landline; ?></span>
            <?php } ?></td>
        </tr>
		
		
		<!--
        <tr>
          <td><?php echo $entry_fax; ?></td>
          <td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
        </tr>-->
      </table>
    </div>
   <h2><?php echo $text_your_address; ?></h2>
    <div class="content">
      <table class="form">
       <!--  <tr>
          <td><?php echo $entry_company; ?></td>
          <td><input type="text" name="company" value="<?php echo $company; ?>" /></td>
        </tr>        
        <tr style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
          <td><?php echo $entry_customer_group; ?></td>
          <td><?php foreach ($customer_groups as $customer_group) { ?>
            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } else { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } ?>
            <?php } ?></td>
        </tr>      
    <tr id="company-id-display">
          <td><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?></td>
          <td><input type="text" name="company_id" value="<?php echo $company_id; ?>" />
            <?php if ($error_company_id) { ?>
            <span class="error"><?php echo $error_company_id; ?></span>
            <?php } ?></td>
        </tr>
        <tr id="tax-id-display">
          <td><span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?></td>
          <td><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
            <?php if ($error_tax_id) { ?>
            <span class="error"><?php echo $error_tax_id; ?></span>
            <?php } ?></td>
        </tr>-->
        <tr>
          <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
          <td><input type="text" name="address_1" value="<?php echo $address_1; ?>" />
            <?php if ($error_address_1) { ?>
            <span class="error"><?php echo $error_address_1; ?></span>
            <?php } ?></td>
        </tr>
		
		<!--  <tr>
          <td><span class="required">*</span><?php echo $entry_address_2;  ?></td>
		    <td><select name="address_2" id="address_2">   
               <option value=""><?php echo $text_select; ?></option>               
                  <?php foreach ($csc_details as $price_dur) { ?>
                  <?php if ($price_dur['csc_id'] == $csc_id) { ?>
                  <option value="<?php echo $price_dur['name']; ?>" selected="selected" ><?php echo $price_dur['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $price_dur['name']; ?>"><?php echo $price_dur['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
				<?php if ($error_cec) { ?>
            <span class="error"><?php echo $error_cec; ?></span>
            <?php } ?></td>
        </tr> -->
	<!--	 <tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_address_2; ?></td>
          <td><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></td>
        </tr> -->
        <tr>
          <td><span class="required">*</span><?php echo $entry_address_2; ?></td>
		    <td><select name="csc_id" id="csc_id">   
               <option value=""><?php echo $text_select; ?></option>               
                  <?php foreach ($csc_details as $price_dur) { ?>
                  <?php if ($price_dur['csc_id'] == $csc_id) { ?>
                  <option value="<?php echo $price_dur['csc_id']; ?>" selected="selected" ><?php echo $price_dur['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $price_dur['csc_id']; ?>"><?php echo $price_dur['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select><?php if ($error_cec) { ?>
            <span class="error"><?php echo $error_cec; ?></span>
            <?php } ?></td>  
				  </tr>
		<!--  <td><select name="csc_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($csc_detail as $csc_det) { ?>
              <?php if ($csc_det['csc_id'] == $csc_id) { ?>
              <option value="<?php echo $csc_det['csc_id']; ?>" selected="selected"><?php echo $csc_det['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $csc_det['csc_id']; ?>"><?php echo $csc_det['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php if ($error_country) { ?>
            <span class="error"><?php echo $error_country; ?></span>
            <?php } ?></td>-->
      
		  
          <!--<td><input type="text" name="address_2" value="<?php echo $address_2; ?>" /></td>
        </tr>-->
		
	
		
        <tr>
          <td><span class="required">*</span> <?php echo $entry_city; ?></td>
          <td><input type="text" name="city" value="<?php echo $city; ?>" />
            <?php if ($error_city) { ?>
            <span class="error"><?php echo $error_city; ?></span>
            <?php } ?></td>
        </tr>
		
			  <tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_postoffice; ?></td>
          <td><input type="text" name="postoffice" value="<?php echo $postoffice; ?>" /></td>
        </tr>
		
		  <tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_tehsildar; ?></td>
          <td><input type="text" name="tehsildar" value="<?php echo $tehsildar; ?>" /></td>
        </tr>
		
		  <tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_govtschool; ?></td>
          <td><input type="text" name="govtschool" value="<?php echo $govtschool; ?>" /></td>
        </tr>
		
        <tr>
        <!--  <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>-->
        <td><span class="required">*</span> <?php echo $entry_postcode; ?></td>
          <td><input type="text" name="postcode" maxlength="6" value="<?php echo $postcode; ?>" />
            <?php if ($error_postcode) { ?>
            <span class="error"><?php echo $error_postcode; ?></span>
            <?php } ?></td>
        </tr>
      <tr>
          <td><span class="required">*</span> <?php echo $entry_country; ?></td>
          <td><select name="country_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <?php if ($error_country) { ?>
            <span class="error"><?php echo $error_country; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
          <td><select name="zone_id">
            </select>
            <?php if ($error_zone) { ?>
            <span class="error"><?php echo $error_zone; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
    <h2><?php echo $text_your_password; ?></h2>
    <div class="content">
      <table class="form">
	  
	   <tr>
            <td><span class="required">*</span> <?php echo $entry_username; ?></td>
            <td><input type="text" name="username" value="<?php echo ucwords($username); ?>" />
              <?php if ($error_username) { ?>
              <span class="error"><?php echo $error_username; ?></span>
              <?php } ?></td>
          </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" value="<?php echo $password; ?>" />
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" value="<?php echo $confirm; ?>" />
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
    </table>
     <!-- </div>
    <h2><?php echo $text_newsletter; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><?php echo $entry_newsletter; ?></td>
          <td><?php if ($newsletter) { ?>
            <input type="radio" name="newsletter" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="newsletter" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="newsletter" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="newsletter" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
      </table>
    </div> -->
    <?php if ($text_agree) { ?>

      <div class="right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
      <?php } else { ?>
    <div class="buttons">
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } ?>
  </form>
  <?php echo $content_bottom; ?>
  </div>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
  
		url: 'index.php?route=account/sellerregister/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
		 // alert("url");
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
		
	
		
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
				//alert(html);
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 

<?php echo $footer; ?>