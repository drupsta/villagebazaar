<?php 
echo $header; 
$cat_name;
$subcat_name;
$_SESSION['Category_Action'];

//mysql_connect("localhost","root","");
//mysql_select_db("villagebazaar");
if(isset($_REQUEST['category_id']))
{
$catid=$_REQUEST['category_id'];
$qry1 ="SELECT name, c.category_id  as category_id,parent_id,description FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and c.category_id=$catid and status=1";
$rs = mysql_query($qry1);
$row=mysql_fetch_array($rs); 
if($row['parent_id']>0)
{
$qry2 ="SELECT name, c.category_id  as category_id,parent_id,description FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and c.category_id=$catid and status=1";
$rs = mysql_query($qry2);
$row=mysql_fetch_array($rs); 
$subcat_name=$row['name'];
$desc_name=$row['description'];

$pid=$row['parent_id'];
$qry3 ="SELECT name , c.category_id  as category_id,parent_id,description FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and c.category_id=$pid and status=1";
$rs = mysql_query($qry3);
$row=mysql_fetch_array($rs); 
$cat_name=$row['name'];
}
else
{
$cat_name=$row['name'];
$subcat_name=' ';
$desc_name=$row['description'];
}
}

$_SESSION['sameCategory']=0;
$parent_id;
$sub_category;
$qry_subcat;
$_SESSION['subcategory_save_button']=0;
$_SESSION['category_save_button']=1;




if(isset($_POST['save']))
{
if($_SESSION['Category_Action']=="Insert Category")
{
if($_POST['parent_id']!=null) {
if($_POST['displayValue1']==null){ ?>
<div class="warning"><?php echo "Please enter subcategory first"; ?></div>
<?php
} else {
$name=ucwords($_POST['displayValue1']);
$desc=$_POST['category_description'];
$desc1=$desc[1]['description'];
$sql="SELECT  category_id FROM oc_category_description WHERE name='".$_POST['displayValue']."' and status=1 ";
$rs = mysql_query($sql);
$row=mysql_fetch_array($rs); 
if($row!=NULL)
{
$_SESSION['category_id1']=$row[0];
}
$sql="SELECT oc_category.category_id FROM oc_category_description,oc_category  WHERE name='$name' and 
oc_category_description.category_id=oc_category.category_id and parent_id=".$_SESSION['category_id1']." and status=1";
$rs = mysql_query($sql);
$row=mysql_fetch_array($rs); 
if ($row[0]==NULL )
{
$sql="INSERT INTO oc_category SET parent_id =".$_SESSION['category_id1']." , `top` = 0, `column` = 0, sort_order = 0 , status = 1, date_modified = NOW(), date_added = NOW()";
mysql_query($sql);
$category_id = mysql_insert_id();
$_SESSION['category_id']=$category_id;
$sql="INSERT INTO oc_category_description SET category_id = $category_id,language_id=1,name='$name',description='$desc1'";
mysql_query($sql);
$sql="INSERT INTO oc_category_to_store (category_id, store_id) VALUES ($category_id, 0)";
mysql_query($sql);
$sql1="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,".$_SESSION['category_id1'].",0)";
mysql_query($sql1);
$sql2="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,$category_id,1)";
mysql_query($sql2);
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
}
else {
?>
<div class="warning"><?php echo " Subcategory Already exist!!!!!!!!!!"; ?></div>
<?php
}
}
}else {
$cat_name=ucwords($_POST['displayValue']);
$subcat_name=ucwords($_POST['displayValue1']);
$desc=$_POST['category_description'];
$desc1=$desc[1]['description'];
$sql="SELECT oc_category.category_id FROM oc_category_description,oc_category  WHERE name='$cat_name' and 
oc_category_description.category_id=oc_category.category_id and parent_id=0 and status=1";
$rs = mysql_query($sql);
$row=mysql_fetch_array($rs); 
if ($row[0]==NULL )
{
if(utf8_strlen($cat_name)>0)
{
$sql="INSERT INTO oc_category SET parent_id = 0, `top` = 0, `column` = 0, sort_order =0 , status = 1, date_modified = NOW(), date_added = NOW()";
mysql_query($sql);
$category_id = mysql_insert_id();
$_SESSION['category_id1']=$category_id;
$sql="INSERT INTO oc_category_description SET category_id = $category_id,language_id=1,name='$cat_name',description='$desc1'";
mysql_query($sql);
$sql="INSERT INTO oc_category_to_store (category_id, store_id) VALUES ($category_id, 0)";
mysql_query($sql);
$sql="INSERT INTO oc_category_path(category_id,path_id,level) values($category_id,$category_id,0)";
mysql_query($sql); 
if(utf8_strlen($subcat_name)>0) {
$sql="INSERT INTO oc_category SET parent_id =".$_SESSION['category_id1']." , `top` = 0, `column` = 0, sort_order =0 , status = 1, date_modified = NOW(), date_added = NOW()";
mysql_query($sql);
$category_id = mysql_insert_id();
$_SESSION['category_id']=$category_id;
$sql="INSERT INTO oc_category_description SET category_id = $category_id,language_id=1,name='$subcat_name',description='$desc1'";
mysql_query($sql);
$sql="INSERT INTO oc_category_to_store (category_id, store_id) VALUES ($category_id, 0)";
mysql_query($sql);
$sql1="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,".$_SESSION['category_id1'].",0)";
mysql_query($sql1);
$sql2="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,$category_id,1)";
mysql_query($sql2);
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, 'SSL'));
}
else {
?>
<div class="warning"><?php echo "Please add atleast one subcategory else category will not be saved."; 
$_SESSION['category_save_button']=0;
$_SESSION['subcategory_save_button']=1;
    ?></div>
<?php
} } else {?>
<div class="warning"><?php echo "Please enter or select category!!!"; ?></div>
<?php
}
} else {?>
<div class="warning"><?php echo "Category Already exist !!!!!!!"; ?></div>
<?php } 
}}}

if(isset($_POST['save1']))
{
if($_SESSION['Category_Action']=="Insert Category")
{
$name=ucwords($_POST['displayValue1']);
$desc=$_POST['category_description'];
$desc1=$desc[1]['description'];
$sql="SELECT  category_id FROM oc_category_description WHERE name='".$_POST['displayValue']."' and status=1";
$rs = mysql_query($sql);
$row=mysql_fetch_array($rs); 
if($row!=NULL)
{
$_SESSION['category_id1']=$row[0];
}
$sql="SELECT oc_category.category_id FROM oc_category_description,oc_category  WHERE name='$name' and 
oc_category_description.category_id=oc_category.category_id and parent_id=".$_SESSION['category_id1']." and status=1";
$rs = mysql_query($sql);
$row=mysql_fetch_array($rs); 
if (utf8_strlen($name)>0) {
$sql="INSERT INTO oc_category SET parent_id =".$_SESSION['category_id1']." , `top` = 0, `column` = 0, sort_order =0 , status = 1, date_modified = NOW(), date_added = NOW()";
mysql_query($sql);
$category_id = mysql_insert_id();
$_SESSION['category_id']=$category_id;
$sql="INSERT INTO oc_category_description SET category_id = $category_id,language_id=1,name='$name',description='$desc1'";
mysql_query($sql);
$sql3="INSERT INTO oc_category_to_store (category_id, store_id) VALUES ($category_id, 0)";
mysql_query($sql3);
$sql1="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,".$_SESSION['category_id1'].",0)";
mysql_query($sql1);
$sql2="INSERT INTO oc_category_path(category_id,path_id,level)values($category_id,$category_id,1)";
mysql_query($sql2);
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
}
else {
?>
<div class="warning"><?php echo "Please enter subcategory first!!!"; ?></div>
<?php
}}}


if(isset($_POST['save']))
{
if($_SESSION['Category_Action']=="Update Category")
{
$cat_name=ucwords($_POST['displayValue']);
$subcat_name=ucwords($_POST['displayValue1']);
$desc=$_POST['category_description'];
$desc1=$desc[1]['description'];
$catid=$_REQUEST['category_id'];
if($subcat_name == ' ')
{
$qry="update oc_category_description  set name='$cat_name',description='$desc1' where category_id = ".$catid;
mysql_query($qry);
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL')); 
}

if($cat_name != NULL && $subcat_name != ' ')
{
$qry="update oc_category_description  set name='$subcat_name',description='$desc1' where category_id = ".$catid;
mysql_query($qry);
$qry1 ="SELECT name, c.category_id  as category_id,parent_id,description FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and c.category_id=$catid and status=1";
$rs = mysql_query($qry1);
$row=mysql_fetch_array($rs); 
if($row['parent_id']>0)
{
//echo $qry="update oc_category_description  set name='$cat_name',description='$desc1' where category_id = ".$row['parent_id'];
//mysql_query($qry);
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL')); 
}
}


}
}




if(isset($_POST['back']))
{
$qry_subcat ="SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=$parent_id and status=1";
$rs = mysql_query($qry_subcat);
$row=mysql_fetch_array($rs); 
if($row==null)
{
$sql="delete from oc_category where category_id=".$_SESSION['category_id1'];
} 
$this->redirect($this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL')); 
}
if (isset($_POST['show_subcat']) && ($parent_id==null) )
{$error_category="Invalid Selection!!!"; }


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
   <form action="" method="post" name="f1"  id="form">
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
	<div align="right"> 
        <?php if($_SESSION['subcategory_save_button']==1) { ?>
		<input type="submit" name="save1"  value="Save" class="button" />
	<?php } ?> 
        <?php if($_SESSION['category_save_button']==1) { ?>
	<td align="left"><input type="submit" name="save"  value="Save" class="button" /></td>
	
		<?php } ?> <input type="submit" name="back"  value="Back" class="button" /></div>
     </div>
	
    <div class="content">
       <!--  <div id="tabs" class="htabs"><a href="#tab-general"><?php echo $tab_general; ?></a><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-design"><?php echo $tab_design; ?></a></div>-->
      <!--<?php //echo $action; ?>-->
	  
	 
    <!--    <div id="tab-general"> -->
        <!--  <div id="languages" class="htabs">
           <?php foreach ($languages as $language) { ?>
           <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?> 
        </div> -->
          <?php foreach ($languages as $language) { ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <!--<table class="form">--->
			
<table>
			



                <tr>
<!--<span style="color:blue"> If you want to add new category please do not select "Existing Categories" but only view them.  Select the "Existing Categories" only if you want to add new subcategory. </span>-->
          <td><span class="required">*</span><?php echo "Enter New Category/ Select Category: "; ?></td>
          <td> 
 <div style="position:relative;width:200px;height:25px;border:0;padding:0;margin:0;">
	   <select name="parent_id" id="parent_id"  style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue').value=this.options[this.selectedIndex].text; document.getElementById('idValue').value=this.options[this.selectedIndex].value;">

<!--<select name="parent_id" id="parent_id">-->
      <option value=""><?php echo "--Please Select--"; ?></option>
              <?php
						$qry="SELECT name, c.category_id FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and parent_id=0 and status=1 order by name";
						$rs = mysql_query($qry);
						while($row=mysql_fetch_array($rs))
						{
						if($parent_id==$row[1])
						{
						echo "<option value='$row[1]' selected>$row[0]</option>";
						}
						else
						{
						echo "<option value='$row[1]' >$row[0]</option>";
						}
						}		
						?>
            </select>
 <!-- <input name="displayValue" value="<?php  echo isset($_POST['displayValue']) ? ucwords($_POST['displayValue']) : ''; ?>" placeholder="add/select a value" id="displayValue" style="position:absolute;top:0px;left:0px;width:173px;width:180px\9;#width:180px;height:20px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" 
 type="text" />--->
  <input name="displayValue"   value="<?php  
      		if(isset($_REQUEST['category_id']))
			{
			echo $cat_name;
			}    
			else 
			{
			echo isset($_POST['displayValue']) ? ucwords($_POST['displayValue']) : '';
			}
 
 
 ?>" placeholder="add/select a value" id="displayValue" style="position:absolute;top:0px;left:0px;width:173px;width:180px\9;#width:180px;height:20px; height:21px\9;#height:18px;border:1px solid #556;" value="123" onfocus="this.select()" 
 type="text" />
 
	    <input name="idValue" id="idValue" type="hidden">
	<!--	<?php if($_SESSION['category_save_button']==1) { ?>
	<td align="left"><input type="submit" name="save"  value="Save Category" class="button" /></td>
	
		<?php } ?> -->
		 
		
<!--<input align="left" type="submit" name="show_subcat" value="Show Subcategories" class="button" />-->
            <?php if (isset($error_category)) { ?>
                  <span class="error"><?php echo $error_category; ?></span>
                  <?php } ?>
            <!--<span style="color:blue"> (Select the existing category if you want to add new subcategory) </span>-->
                  </td>
       <!--    </tr>
        
        <tr> -->
        </tr>
    	
		<tr>		
	      <td> <?php echo "Enter New Subcategory:"; ?></td>

 <!--  <td><select name="sub_category" id="sub_category">
         <option value=""><?php echo $text_select; ?></option> 
		 <option value="<?php echo $sub_category; ?>"><?php
		  echo $x= $sub_category; 
		  if($x!=NULL)
		  {
		  $query = $this->db->query("SELECT name FROM oc_category_description WHERE category_id = '" . (int)$x . "'");
		  echo $query->row['name']; 
		  }
		  ?></option>
        </select>
            </td>-->
        

	
<td> <div style="position:relative;width:200px;height:25px;border:0;padding:0;margin:0;">
 <select name="product_category" id="sub_category" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue1').value=this.options[this.selectedIndex].text; document.getElementById('idValue1').value=this.options[this.selectedIndex].value;">

			 <!--         <td><select name="product_category" id="sub_category"> 
 <select name="product_category" id="sub_category" style="position:absolute;top:0px;left:0px;width:200px; height:25px;line-height:20px;margin:0;padding:0;" onchange="document.getElementById('displayValue1').value=this.options[this.selectedIndex].text; document.getElementById('idValue1').value=this.options[this.selectedIndex].value;">-->
			   
              <option value=""><?php echo "--Add New--"; ?></option>
              <?php				
						$rs = mysql_query($qry_subcat);
                                          
						while($row=mysql_fetch_array($rs))
						{
                                               
						 if($sub_category==$row[1])
						{
						echo "<option value='$row[1]' selected>$row[0]</option>";
						}
						else
						{
						echo "<option value='$row[1]'>$row[0]</option>";
						}
						}		
					
		?>	
            </select>
<!--			<input name="displayValue1" value="<?php  echo isset($_POST['displayValue1']) ? ucwords($_POST['displayValue1']) : ''; ?>" placeholder="add/select a value" id="displayValue1" style="position:absolute;top:0px;left:0px;width:173px;width:180px\9;#width:180px;height:20px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">--->
			
			
			<input name="displayValue1" 
			value="<?php    
			if(isset($_REQUEST['category_id']))
			{
			echo $subcat_name;
			}    
			else 
			{
			echo isset($_POST['displayValue1']) ? ucwords($_POST['displayValue1']) : '';
			}
			?>" 
			placeholder="add/select a value" id="displayValue1" style="position:absolute;top:0px;left:0px;width:173px;width:180px\9;#width:180px;height:20px; height:21px\9;#height:18px;border:1px solid #556;"  onfocus="this.select()" type="text">
			
	    <input name="idValue1" id="idValue1" type="hidden">
<!--<?php if($_SESSION['subcategory_save_button']==1) { ?>
		<td align="left"><input type="submit" name="save1"  value="Save" /></td>
	<?php } ?>	
<input name="category_description[<?php echo $language['language_id']; ?>][name]" placeholder="add/select a value" id="displayValue" style="position:absolute;top:0px;left:0px;width:173px;width:180px\9;#width:180px;height:20px; height:21px\9;#height:18px;border:1px solid #556;" onfocus="this.select()" type="text">
	    <input name="idValue" id="idValue" type="hidden"> -->
  <?php if (isset($error_subcat)) { ?>
                  <span class="error"><?php echo $error_subcat; ?></span>
                  <?php } ?>      
  </td> 
  </tr>
               
                
                
          <!--      
                <tr>
              <td><?php echo $entry_parent; ?></td>
              <td><input type="text" name="path" value="<?php echo $path; ?>" size="84" />
                <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" /><span style="color:blue"> (Enter the First alphabet to check the existing categories) </span> </td>
            </tr> -->
     <!--       <tr>
                <td><span class="required">*</span> <?php echo "Enter New subcategory:"; ?></td>
                <td><input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" size="84" value="<?php echo isset($category_description[$language['language_id']]) ? ucwords($category_description[$language['language_id']]['name']) : ''; ?>" />
                 <span style="color:blue"> (Please do not select any category if you are entering new category) </span> 
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } else if ($_SESSION['sameCategory']==1) {?>
<span class="error"><?php echo "error";}?></span></td>
              </tr>--->
              
                      <!--      <tr>
                <td> <?php echo "Enter New subcategory for selected category"; ?></td>
                <td><input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" size="84" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" />
                  <?php if (isset($error_name[$language['language_id']])) { ?>
                  <span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
                  <?php } else if ($_SESSION['sameCategory']==1) {?>
<span class="error"><?php echo "error";}?></span></td>
              </tr> -->
              
         <!--     <tr> 
                <td><?php echo $entry_meta_description; ?></td>
                <td><textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" cols="40" rows="5"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea></td>
              </tr> 
              <tr>
                <td><?php echo $entry_meta_keyword; ?></td>
                <td><textarea name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" cols="40" rows="5"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea></td>
              </tr> -->
              <tr>
                <td><?php echo $entry_description; ?></td>
                <td><input type="text" name="category_description[<?php echo $language['language_id']; ?>][description]" size="84" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?>" /></td>
				
				
				
         <!--    <td><textarea name="category_description[<?php echo $language['language_id']; ?>][description]" cols="80" rows="2"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea></td> -->
           <!--    <td><textarea name="category_description[<?php echo $language['language_id']; ?>][description]" id="description<?php echo $language['language_id']; ?>"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea></td>-->
              </tr>
            <!--  <tr>
              <td><?php echo $entry_top; ?></td>
              <td><?php if ($top) { ?>
                <input type="checkbox" name="top" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="top" value="1" />
                <?php } ?></td>
            </tr> -->
     <!--       <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>-->
             <tr>
        <!--      <td><?php echo $entry_store; ?></td> -->
            <!--  <td>  <div class="scrollbox">-->
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $category_store)) { ?>
                    <input type="hidden" name="category_store[]" value="0" checked="checked" />
                   <!-- <?php echo $text_default; ?>-->
                    <?php } else { ?>
                    <input type="hidden" name="category_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $category_store)) { ?>
                    <input type="hidden" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="hidden" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
              <!--  </div></td> -->
            </tr> 
            </table>
          </div>
          <?php } ?>
      <!--  </div> -->
      <!--  <div id="tab-data">
          <table class="form">
            <tr>
              <td><?php echo $entry_parent; ?></td>
              <td><input type="text" name="path" value="<?php echo $path; ?>" size="100" />
                <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_filter; ?></td>
              <td><input type="text" name="filter" value="" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div id="category-filter" class="scrollbox">
                  <?php $class = 'odd'; ?>
                  <?php foreach ($category_filters as $category_filter) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div id="category-filter<?php echo $category_filter['filter_id']; ?>" class="<?php echo $class; ?>"><?php echo $category_filter['name']; ?><img src="view/image/delete.png" alt="" />
                    <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>" />
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_store; ?></td>
              <td><div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $category_store)) { ?>
                    <input type="checkbox" name="category_store[]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="category_store[]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $category_store)) { ?>
                    <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div></td>
            </tr>
            <tr>
              <td><?php echo $entry_keyword; ?></td>
              <td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_image; ?></td>
              <td valign="top"><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                  <input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
                  <br />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>
            <tr>
              <td><?php echo $entry_top; ?></td>
              <td><?php if ($top) { ?>
                <input type="checkbox" name="top" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="top" value="1" />
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_column; ?></td>
              <td><input type="text" name="column" value="<?php echo $column; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="sort_order" value="<?php echo $sort_order; ?>" size="1" /></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="status">
                  <?php if ($status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>-->
     <!--  <div id="tab-design">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $entry_store; ?></td>
                <td class="left"><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $text_default; ?></td>
                <td class="left"><select name="category_layout[0][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php foreach ($stores as $store) { ?>
            <tbody>
              <tr>
                <td class="left"><?php echo $store['name']; ?></td>
                <td class="left"><select name="category_layout[<?php echo $store['store_id']; ?>][layout_id]">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
            </tbody>
            <?php } ?>
          </table>
        </div> -->
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
CKEDITOR.replace('description<?php echo $language['language_id']; ?>', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
<?php } ?>
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'path\']').autocomplete({
	delay: 500,
	source: function(request, response) {		
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					'category_id':  0,
					'name':  '<?php echo $text_none; ?>'
				});
				
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	},
	select: function(event, ui) {
		$('input[name=\'path\']').val(ui.item.label);
		$('input[name=\'parent_id\']').val(ui.item.value);
		
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script> 
<script type="text/javascript"><!--
// Filter
$('input[name=\'filter\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.filter_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#category-filter' + ui.item.value).remove();
		
		$('#category-filter').append('<div id="category-filter' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="category_filter[]" value="' + ui.item.value + '" /></div>');

		$('#category-filter div:odd').attr('class', 'odd');
		$('#category-filter div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#category-filter div img').live('click', function() {
	$(this).parent().remove();
	
	$('#category-filter div:odd').attr('class', 'odd');
	$('#category-filter div:even').attr('class', 'even');	
});
//--></script> 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
$('#languages a').tabs();
//--></script> 


<script>
$("#parent_id").change(function(){
								 
	var postForm = { 
            'parent_id'  : $(this).val()
            
        };
$.ajax({
        type: 'post',
        url: 'index.php?route=catalog/category/getSubcategory&token=<?php echo $token; ?>',
        dataType: 'html',
        data: postForm,
        success: function (data)		
		{
		//alert(html);
		$('#sub_category').html(data); 
		
       } 
    });
        
    
}); 
</script>
<?php echo $footer; ?>