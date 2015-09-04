<style text="css">
.boxm {margin-bottom: 20px;}
.boxm .box-heading {-webkit-border-radius: 7px 7px 0px 0px;	-moz-border-radius: 7px 7px 0px 0px;
	-khtml-border-radius: 7px 7px 0px 0px;border-radius: 7px 7px 0px 0px;border: 1px solid #DBDEE1;
	background:#F4F4F4;
	padding: 8px 10px 7px 10px;font-family: Arial, Helvetica, sans-serif;font-size: 14px;
	font-weight: bold;line-height: 14px;color: #333;}
.boxm .box-content {background: #FFFFFF;-webkit-border-radius: 0px 0px 7px 7px;-moz-border-radius: 0px 0px 7px 7px;
	-khtml-border-radius: 0px 0px 7px 7px;border-radius: 0px 0px 7px 7px;border-left: 1px solid #DBDEE1;
	border-right: 1px solid #DBDEE1;border-bottom: 1px solid #DBDEE1;padding: 10px;}
.boxm .box-content select{width:165px;}
</style>
<div class="boxm">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <?php if ($manufacturers) { ?>
    <select onchange="location=this.options[this.selectedIndex].value;">
      <option value=""><?php echo $text_select; ?></option>
      <?php foreach ($manufacturers as $manufacturer) { ?>
      <option value="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['username']; ?></option>
      <?php } ?>
    </select>
    <?php } ?>
  </div>
</div>