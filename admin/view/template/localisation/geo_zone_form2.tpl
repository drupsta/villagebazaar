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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <!--<div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>-->
    </div>
    <div class="content">
      <!-- <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form"> -->
        <table class="form">
		  <tr>
          	<td><span class="required">*</span> <?php echo $text_select_country; ?></td>
         	<td>
				<select name="country_id">
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
           	 	<?php } ?>
			</td>
        </tr>
        <tr>
         <td><span class="required">*</span> <?php echo "Select ".$entry_zone; ?></td>
          	<td><select name="zone_id" id="zone_id">
                <!--<option value="*">--None Selected--</option>
                 <?php foreach ($zones as $zone) { ?>
                  <?php if ($zone['zone_id'] == $zone_id) { ?>
                    <option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
                   <?php } ?>
                  <?php } ?> -->
                </select>
				<?php if ($error_zone) { ?>
            		<span class="error"><?php echo $error_zone; ?></span>
           	 	<?php } ?>
			</td>
        </tr>
        <tr>
            <td><span class="required">*</span> <?php echo "Enter ".$entry_name; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } else if ($error_same) { ?><span class="error"><?php echo $error_same; ?></span><?php } ?></td>
          </tr>
        </table>
        <br />       
      </form>
    </div>
  </div>
</div>
 <script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/geo_zone/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="view/image/loading.gif" alt="" /></span>');
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
<?php echo $footer; ?>