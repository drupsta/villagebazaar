<?php echo $header; ?>


<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  	   <?php
  if(isset($_POST['pay']))
{
  echo "<div class=success><b>Payment has been successfully done and Product is now visible on website.</b></div>";
}
if(isset($_POST['no']))
{
echo "<div class=success><b>Payment has been canceled and Product is not visible on website.</b></div>";
// $GLOBALS['pay'] = "failed";
//echo $GLOBALS['pay'];
}

?>
  <div class="box">
    <div class="heading">
      <h1> <?php echo $heading_title; ?></h1>
	  

	  
	  
     <div class="buttons"><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a><pre></div>
    </div>
    <div class="content"><pre>
	
	
	
     <div class="succ"><center> <h1>Product details have been saved click on pay button to continue  </h1><pre>
</div><pre>         
<form method="post" action="">
                                                                          <input type="submit" class="b1" name="pay" value="pay" /> <b>OR</b> <input type="submit" class="b1" name="no" value="no" />     </center>


</form>

                                                   



	 
    </div>
  </div>
</div>

<?php echo $footer; ?>