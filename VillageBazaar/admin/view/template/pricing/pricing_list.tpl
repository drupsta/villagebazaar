<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
    <?php if (isset($test4)) { ?>
  <div class="warning"><?php echo $test4; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').submit();" class="button"><?php echo "Delete Selected Pricing Details"; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
          <table class="form">
          
          <tr>
            <td>  <?php echo "Select Duration:"; ?></td>
              <td><select name="price_duration_id" >   
               <option value="0"><?php echo "Please Select"; ?></option>               
                  <?php foreach ($price_duration as $price_dur) { ?>
                  <?php if ($price_dur['value'] ==$price_duration_id) { ?>
                  <option selected value="<?php echo $price_dur['value']; ?>" ><?php echo $price_dur['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $price_dur['value']; ?>"><?php echo $price_dur['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>  Month(s)          
		<td style="text-align: left;"><a onclick="filter();" class="button"><?php echo "Search By"; ?></a>
			</td> </td> 
                         
            </tr>
            
          </table>
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="left"><?php if ($sort == 'duration_policy_id') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_duration; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_duration; ?></a>
                <?php } ?></td>
                <td class="left"><?php if ($sort == 'from_price_range') { ?>
              <a href="<?php echo $sort_photo; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_from_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_photo; ?>"><?php echo $column_from_price; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'to_price_range') { ?>
                <a href="<?php echo $sort_iso_code_3; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_to_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_iso_code_3; ?>"><?php echo $column_to_price; ?></a>
                <?php } ?></td>
				<td class="left"><?php if ($sort == 'amount_percentage') { ?>
                <a href="<?php echo $sort_percentage; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_percentage; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_percentage; ?>"><?php echo $column_percentage; ?></a>
                <?php } ?></td>
                                <td>
                                <?php echo "From Date"; ?>
                                </td><td>
                                <?php echo "To Date"; ?>
                                </td><td>
                                <?php echo "Status"; ?>
                                </td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
       <tbody>
          <?php if ($prices) { ?>
            <?php foreach ($prices as $prices) {
            if($prices['duration_policy_id']==1)
            {
            $duration_name='1 Month';            
            }
            else if($prices['duration_policy_id']==2)
            {
            $duration_name='2 Month';
            }
            else if($prices['duration_policy_id']==3)
            {
            $duration_name='3 Month';
            }
          
          
            
           ?> 
            <tr>
              <td style="text-align: center;"><?php if ($prices['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $prices['policy_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $prices['policy_id']; ?>" />
                <?php } ?></td>
              <td class="left"><?php echo $duration_name; ?></td>
              <td class="left"><?php echo $prices['from_price_range']; ?></td>
              <td class="left"><?php echo $prices['to_price_range']; ?></td>
			   <td class="left"><?php echo $prices['amount_percentage']; ?></td>
                         <td class="left"><?php echo $prices['from_date']; ?></td>
                         <td class="left"><?php if ($prices['to_date']!='9999-12-31') {echo $prices['to_date'];}?></td>
                         <td class="left"><?php echo $prices['status']; ?></td>
                          
              <td class="right"><?php if($prices['status']==1) { foreach ($prices['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php }} ?></td>
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
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=pricing/pricing&token=<?php echo $token; ?>';
	//alert(url);
        var price_duration_id = $('select[name=\'price_duration_id\']').attr('value');
	//alert(price_duration_id);
	if (price_duration_id) {
		url += '&price_duration_id=' + encodeURIComponent(price_duration_id);
	}
    
        location=url;
}
//--></script> 
<?php echo $footer; ?>