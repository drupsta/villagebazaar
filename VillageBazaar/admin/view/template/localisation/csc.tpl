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
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
            <tr>
          <td><span class="required">*</span> <?php echo "Select Country:"; ?></td>
          <td><select name="country_id" id="country_id">
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
          <td><span class="required">*</span> <?php echo "Select State:"; ?></td>
          <td><select name="zone_id" id="zone">
         
		 <option value="<?php echo $zone_id; ?>"></option>
        </select>
            <?php if ($error_zone) { ?>
            <span class="error"><?php echo $error_zone; ?></span>
            <?php } ?></td>
        </tr>
          <tr>
            <td><span class="required">*</span> <?php echo "Enter CeC Name:"; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><span class="required">*</span> <?php echo "Enter CeC Address:"; ?></td>
            <td><input type="text" name="address" value="<?php echo $address; ?>" />
              <?php if ($error_address) { ?>
              <span class="error"><?php echo $error_address; ?></span>
              <?php } ?></td>
          </tr>
		     
        </table>
        <br />
      
      </form>
    </div>
  </div>
</div>
<script>
$("#country_id").change(function(){
	//alert('test');							 
	var postForm = { 
            'country_id'  : $(this).val()
            
        };
$.ajax({
        type: 'post',
        url: 'index.php?route=localisation/csc/getState&token=<?php echo $token; ?>',
        dataType: 'html',
        data: postForm,
        success: function (data)		
		{
		//alert(html);
		$('#zone').html(data); 
		
       }
    });
        
    
}); 
</script> 


<?php echo $footer; ?>