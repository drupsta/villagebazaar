<?php echo $header; ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?>
<!--<?php echo $column_right; ?>-->
<div id="content"><?php // echo $content_top; ?>
  
<!--  <h1><?php echo $heading_title; ?></h1>
  <p><?php echo $text_adminaccount_already; ?></p>-->
<h1><?php echo "New to Village Bazaar? Register below";  ?></h1> 

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
          <td><span class="required">* </span><?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="<?php echo $email; ?>" />
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } else if ($error_email1) {?> 
            <span class="error"><?php  echo $error_email1; } ?></span></td>
        </tr>
       <tr>
          <td><span class="required">*</span><?php echo " Re-Enter E-Mail: "; ?></td>
          <td><input type="text" name="email_confirm" value="<?php echo $email_confirm; ?>" />
            <?php if ($error_email2) { ?>
            <span class="error"><?php echo $error_email2; ?></span>
            <?php } ?> 
            </td>
        </tr>
	   	
        
      <tr>
          <td><span class="required">*</span> <?php echo $entry_mobileno; ?></td>
          <td><input type="text" size="2" name="country_code" maxlength="4" placeholder="+975" value="<?php echo $country_code; ?>" />-<input type="text" size="8" maxlength="8" name="telephone" value="<?php echo $mobileno; ?>" />
            <?php if ($error_mobileno) { ?>
            <span class="error"><?php echo $error_mobileno; ?></span>
            <?php } ?></td>
        </tr>
		
		
		<tr>
          <td><span class="required">&nbsp;&nbsp;</span><?php echo $entry_fixedline; ?></td>
          <td><input type="text" size="2" name="areacode" maxlength="2" placeholder="Code" value="<?php echo $areacode; ?>" />-<input type="text" size="6" maxlength="6" name="fixedline" value="<?php echo $fixedline; ?>" />
            <?php if ($error_fixedline) { ?>
            <span class="error"><?php echo $error_fixedline; ?></span>
            <?php } else if ($error_areacode){ ?>
			<span class="error"><?php echo $error_areacode; ?></span> 
			<?php } ?>
		  </td>
        </tr>
				
	 </table>
    </div>
   <h2><?php echo $text_your_address; ?></h2>
    <div class="content">
      <table class="form">
     
        <tr>
          <td><span class="required">*</span> <?php echo $entry_address; ?></td>
          <td><input type="text" name="address" value="<?php echo ucwords($address); ?>" />
            <?php if ($error_address) { ?>
            <span class="error"><?php echo $error_address; ?></span>
            <?php } ?></td>
        </tr> 
		
		
		 <tr>
          <td><span class="required"></span> <?php echo $entry_village; ?></td>
          <td><input type="text" name="village" value="" />
		 	<?php echo ucwords($village); ?> 
            <?php if ($error_village) { ?>
            <span class="error"><?php echo $error_village; ?></span>
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
          	<td><span class="required">*</span> <?php echo $entry_dzongkhag; ?></td>
          	<td><select name="zone_id"> </select>			
            	<?php if ($error_dzongkhag) { ?>
            	<span class="error"><?php echo $error_dzongkhag; ?></span>
            	<?php } ?>
			</td>
        </tr>
		<tr>
          <td><span class="required"></span> <?php echo $entry_dungkhag; ?></td>
			<td><select name="zone_id"></select></td>
         
            <?php if ($error_dungkhag) { ?>
            <span class="error"><?php echo $error_dungkhag; ?></span>
            <?php } ?></td>
        </tr>
		<tr>
          <td><span class="required">*</span> <?php echo $entry_geog; ?></td>
          <td><input type="text" name="geog" value="" />
		 	<?php echo ucwords($geog); ?> 
            <?php if ($error_geog) { ?>
            <span class="error"><?php echo $error_geog; ?></span>
            <?php } ?></td>
        </tr>

        <tr>
          <td><span class="required"></span> <?php echo $entry_city; ?></td>
          <td><input type="text" name="city" value="<?php echo ucwords($city); ?>" />
            <?php if ($error_city) { ?>
            <span class="error"><?php echo $error_city; ?></span>
            <?php } ?></td>
        </tr>

		<tr>
        <!--  <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postoffice; ?></td>-->
        <td> <?php echo $entry_postoffice; ?></td>
          <td><input type="text" name="postoffice" maxlength="6" value="<?php echo $postoffice; ?>" />
            <?php if ($error_postoffice) { ?>
            <span class="error"><?php echo $error_postoffice; ?></span>
            <?php } ?>
			</td>
        </tr>
      </table>
    </div>


<h2><?php echo "Select CeC"; ?></h2>
<div class="content">
      <table class="form">
  <tr>
          <td><span class="required">*</span><?php echo "Please choose CeC nearest to your location:"; ?></td>
		    <td><select name="csc_id" id="csc_id">   
               <option value=""><?php echo $text_select; ?></option>               
                  <?php foreach ($csc_details as $price_dur) { ?>
                  <?php if ($price_dur['csc_id'] == $csc_id) { ?>
                  <option value="<?php echo $price_dur['csc_id']; ?>" selected="selected" ><?php echo $price_dur['name'].", ".$price_dur['address']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $price_dur['csc_id']; ?>"><?php echo $price_dur['name'].", ".$price_dur['address']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select><?php if ($error_cec) { ?>
            <span class="error"><?php echo $error_cec; ?></span>
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
<script type="text/javascript">
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/sellerregister/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
		// alert(url);
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
		
		html = '<option value=""><?php echo $text_select; ?></option>';
			
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
</script> 


<?php echo $footer; ?>