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
  <div class="box">    <div class="heading">
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
		
		
		 <tr>
             <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><select name="duration_policy_id">
                <?php if ($duration_policy_id) { ?>
                <option value="<?php echo $duration_policy_id ; ?>"><?php echo $duration_policy_id ; ?></option>
              <!--  <option value="1"><?php echo $text_one_months; ?></option>
                <option value="2"><?php echo $text_two_months; ?></option>
				<option value="3"><?php echo $text_three_months; ?></option>
				<option value="4"><?php echo $text_four_months; ?></option>
				<option value="5"><?php echo $text_five_months; ?></option>
				<option value="6"><?php echo $text_six_months; ?></option>
				<option value="7"><?php echo $text_seven_months; ?></option>
				<option value="8"><?php echo $text_eight_months; ?></option>
				<option value="9"><?php echo $text_nine_months; ?></option>
				<option value="10"><?php echo $text_ten_months; ?></option>
				<option value="11"><?php echo $text_eleven_months; ?></option>
				<option value="12"><?php echo $text_twelve_months; ?></option>-->
                <?php } else { ?>
                <option value="1" ><?php  echo $text_one_months; ?></option>
                <option value="2"><?php echo $text_two_months; ?></option>
				<option value="3"><?php echo $text_three_months; ?></option>
				<!--<option value="4"><?php echo $text_four_months; ?></option>
				<option value="5"><?php echo $text_five_months; ?></option>
				<option value="6"><?php echo $text_six_months; ?></option>
				<option value="7"><?php echo $text_seven_months; ?></option>
				<option value="8"><?php echo $text_eight_months; ?></option>
				<option value="9"><?php echo $text_nine_months; ?></option>
				<option value="10"><?php echo $text_ten_months; ?></option>
				<option value="11"><?php echo $text_eleven_months; ?></option>
				<option value="12"><?php echo $text_twelve_months; ?></option>-->
                <?php } ?>
              </select></td>
          </tr>
		 
		     <tr>
            <td>
			<?php echo $entry_price_range; ?> </td>
     		  <td><span class="required">*</span><?php echo $entry_from_range; ?></td>
			  <td><span class="required">*</span><?php echo $entry_to_range; ?></td>
			   <td><?php echo $entry_amount_percentage; ?></td>
			   </tr> 
			   <tr>
			   <td></td>
			   
			   
			   <td><input type="text" name="from_price_range" value="<?php echo $from_price_range; ?>" />
              <?php if ($error_price) { ?>
              <span class="error"><?php echo $error_price; ?></span>
              <?php }  ?><?php if ($error_price_one) { ?>
              <span class="error"><?php echo $error_price_one; ?></span>
              <?php }  ?>
                           </td>
        


			  
			  <td><input type="text" name="to_price_range" value="<?php echo $to_price_range; ?>" />
              <?php if ($error_policy) { ?>
              <span class="error"><?php echo $error_policy; ?></span>
              <?php } ?></td>
			   <!--  <td><select name="from_price_range_id">
                <?php if ($from_price_range_id) { ?>
                <option value="1" selected="selected"><?php echo $text_from_Priceone; ?></option>
                <option value="2"><?php echo $text_from_Priceoneth; ?></option>
				<option value="3"><?php echo $text_from_Pricetwoth; ?></option>
				<option value="4"><?php echo $text_from_Pricefiveth; ?></option>
                <?php } else { ?>
               <option value="1" selected="selected"><?php echo $text_from_Priceone; ?></option>
                <option value="2"><?php echo $text_from_Priceoneth; ?></option>
				<option value="3"><?php echo $text_from_Pricetwoth; ?></option>
				<option value="4"><?php echo $text_from_Pricefiveth; ?></option>
                <?php } ?>
              </select></td>
			   <td><select name="to_price_range_id">
                <?php if ($to_price_range_id) { ?>
                <option value="1" selected="selected"><?php echo $text_to_Priceoneth; ?></option>
                <option value="2"><?php echo $text_to_Pricetwoth; ?></option>
				<option value="3"><?php echo $text_to_Pricefiveth; ?></option>
				<option value="4"><?php echo $text_to_Pricetenth; ?></option>
                <?php } else { ?>
               <option value="1" selected="selected"><?php echo $text_to_Priceoneth; ?></option>
                <option value="2"><?php echo $text_to_Pricetwoth; ?></option>
				<option value="3"><?php echo $text_to_Pricefiveth; ?></option>
				<option value="4"><?php echo $text_to_Pricetenth; ?></option>
                <?php } ?>
              </select></td>-->
			     <td><input type="text" name="amount_percentage" value="<?php echo $amount_percentage; ?>" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
			   </tr>
		  
		      
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>