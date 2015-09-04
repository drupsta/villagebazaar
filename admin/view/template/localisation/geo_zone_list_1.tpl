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
      <h1><img src="view/image/country.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><!--<a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a>-->
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
             <!-- <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>-->
              
				
				 <td class="left"><?php if ($sort == 'c.name') { ?>
                <a href="<?php echo $sort_country_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_country; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_country_id; ?>"><?php echo $column_country; ?></a>
                <?php } ?></td>
				
				 <td class="left"><?php if ($sort == 'a.zone_name') {?>
				<a href="<?php echo $sort_zone_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_zone; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_zone_id; ?>"><?php echo $column_zone; ?></a>
                <?php } ?></td>

		<td class="left"><?php if ($sort == 'a.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
       <!--       <td class="left"><?php if ($sort == 'address') { ?>
                <a href="<?php echo $sort_description; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_description; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_description; ?>"><?php echo $column_description; ?></a>
                <?php } ?></td>	-->
	
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>

<tr class="filter">
              
              <td><select name="filter_country_id" id= "country_id">
                  <option value="*">--All Countries--</option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $filter_country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                   <?php } ?>
                  <?php } ?>
                </select></td>
              <td><select name="filter_zone_id" id="filter_zone_id">
                <option value="*">--All States--</option>
                 <?php foreach ($zones as $zone) { ?>
                  <?php if ($zone['zone_id'] == $filter_zone_id) { ?>
                    <option value="<?php echo $zone['zone_id']; ?>" selected="selected"><?php echo $zone['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $zone['zone_id']; ?>"><?php echo $zone['name']; ?></option>
                   <?php } ?>
                  <?php } ?>
                </select>

         <!--           <select name="filter_zone_id" id="zone">-->
        <!--  <option value="*"><?php echo "Please select"; ?></option> 
		 <option value="<?php echo $filter_zone_id; ?>"><?php
		  $x= $filter_zone_id; 
		  if($x!=NULL)
		  {
		  $query = $this->db->query("SELECT name AS zone_id FROM oc_zone WHERE zone_id = '" . (int)$x . "'");
		  echo $query->row['zone_id']; 
		  }
		  ?></option>
        </select>-->

</td>
              <td></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo "Search By"; ?></a></td>
            </tr>


            <?php if (isset($geozones)) { ?>
            <?php foreach ($geozones as $geo_zone) { ?>
            <tr>
        <!--      <td style="text-align: center;"><?php if ($geo_zone['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $geo_zone['geo_zone_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $geo_zone['geo_zone_id']; ?>" />
                <?php } ?></td> -->
              
			   <td class="left"><?php echo $geo_zone['country']; ?></td>
			    <td class="left"><?php echo $geo_zone['zone_id']; ?></td>
<td class="left"><?php echo $geo_zone['name']; ?></td>
         <!--     <td class="left"><?php echo $geo_zone['address']; ?></td> -->
              <td class="right"><?php foreach ($geo_zone['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
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
	url = 'index.php?route=localisation/geo_zone&token=<?php echo $token; ?>';
	
	var filter_country_id = $('select[name=\'filter_country_id\']').attr('value');
	
var filter_zone_id = $('select[name=\'filter_zone_id\']').attr('value');
	
        if (filter_country_id != '*') {
		url += '&filter_country_id=' + encodeURIComponent(filter_country_id);
	}	
 if (filter_zone_id != 0) {
 //if ((filter_zone_id != '*') || (filter_zone_id != 0)) {
		url += '&filter_zone_id=' + encodeURIComponent(filter_zone_id);
	}
	location = url;
}
//--></script>
<script>
$("#country_id").change(function(){
	//alert('test');							 
	var postForm = { 
            'country_id'  : $(this).val()
            
        };
$.ajax({
        type: 'post',
        url: 'index.php?route=localisation/geo_zone/getState&token=<?php echo $token; ?>',
        dataType: 'html',
        data: postForm,
        success: function (data)		
		{
		//alert(html);
		$('#filter_zone_id').html(data); 
		
       }
    });
        
    
}); 
</script>


<?php echo $footer; ?>