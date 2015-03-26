<?php echo $header;
$subcat_name;
$subcat_desc;
$subcat_id=$_REQUEST['product_category'];
if (is_numeric($subcat_id)){
$qry="SELECT name, description FROM `oc_category_description` where `category_id`=$subcat_id";
$result=mysql_query($qry);
$row=mysql_fetch_array($result);
$subcat_name=$row['name'];
$subcat_desc=$row['description'];
}
else {
session_destroy();
header("location:http://".HTTP_SERVERIP."/villagebazaar/");
}

?>
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
      <h1><img src="view/image/review.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo "Edit Subcategory"; ?></td>
           <td> <input name="subcategory" 
			value="<?php    
			if((isset($_REQUEST['category_id']))&& ($this->request->server['REQUEST_METHOD'] != 'POST'))
			{
			echo $subcat_name;
			}    
			else 
			{
			echo isset($_POST['subcategory']) ? ucwords($_POST['subcategory']) : '';
			}
			?>" 
			 type="text">
            <?php if ($error_subcategory) { ?>
              <span class="error"><?php echo $error_subcategory; ?></span>
              <?php } ?></td>
          </tr>
         <tr>
                <td><?php echo $entry_description; ?></td>
                <td><input type="text" size="84" name="description" value="<?php    
			if(isset($subcat_desc))
			{
			echo $subcat_desc;
			}    
			else 
			{
			echo isset($_POST['description']) ? ucwords($_POST['description']) : '';
			}
			?>" /></td>
      </tr> 
          
        </table>
      </form>
    </div>
  </div>
</div>

<?php echo $footer; ?>