<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($thumb || $description) { ?>
  	<div class="category-info">
    	<?php if ($thumb) { ?>
    		<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
   		<?php } ?>
    <?php if ($description) { ?>
    		<?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories) { ?>
  <h2><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      	<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      	<?php if (isset($categories[$i])) { ?>
     	 <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
     	 <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
  <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
 
  <div class="product-filter">
  <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
  <div class="location"> <b>   <?php echo $entry_location; ?></b>
	<?php $city=null; ?>

  <select onchange="location = this.value;">         
  <?php foreach ($locations as $locations) { ?>
       <?php  
              $loc=$_SERVER['QUERY_STRING'];
			  $pos=strrpos($loc,'=');
              $x=substr($loc,$pos+1);
				
              // $x=substr($_SERVER['QUERY_STRING'],-1,1);
            // $location = $_GET['x'];
              if ($locations['value'] ==$location) {    ?>
             <option value="<?php echo $locations['href'];  ?>" selected="selected"><?php echo $city=$locations['name']; ?></option>
              <?php } else { ?>
             <option value="<?php echo $locations['href'];?>"><?php  echo $locations['name']; ?></option>
              <?php   } ?>
              <?php } ?>
             </select>     

            <?php if ($error_location) { ?>
            <span class="error"><?php echo $error_location; ?></span>
            <?php } ?>
            </div>
    
   <div class="limit"><b><?php echo $text_limit; ?></b>
      
       <select onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div> 
    <div class="sort"><b><?php echo $text_sort; ?></b>
        <select  onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    
     <div class="location"><b><?php echo "Select condition of product:"; ?></b>
        <select  onchange="location = this.value;">
        
        <?php foreach ($product_types as $product_types) { ?>
        
        <?php if ($product_types['value'] == $product_type) { ?>
        <option value="<?php echo $product_types['href'] ; ?>" selected="selected"><?php echo $product_types['value']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $product_types['href']; ?>"><?php echo $product_types['value']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>

    <?php 
		$testDis=null;
    	if (isset($_POST['submit'])){
 			$testDis= $_POST['distance1'];
 			$_SESSION['distance_val']= $testDis;
		}
	?>
  	
   	<form name ='f1' method='post' action ="<?php echo $action; ?>" >   <div class="location"> <b>   <?php  echo " Search Sellers within the distance of: "; ?></b>
   		<input type="text" name="distance1" maxlength="4" size="4"  value="<?php echo  $testDis;?>" > <b><?php echo "Km"; ?></b> 
   		<input type="submit" name='submit'   value='Enter'> 
        </div>  
	</form> 
  </div>
  	<?php  
		$counter=0; 
    	$test1=array();
    	$test2;
    	$searchByDistance=array();
      
  		if (isset($_POST['submit']) && ($testDis>=0)){ 
	?>
      <div><br> <h2>Products meeting the search criteria</h2> </div>
 	<?php 
		foreach ($products as $product) { 
           
      		if ($product['selleraddress']){ 
      			if($city!=null) {
          			$address=$city; 
          			$counter=$counter+1;
        		}else {
      				$address="Phuentsholing";
        			$counter=$counter+1;
        		} 

  				$address = str_replace(' ', '+', $address);
				$address1 =  $product['sellercity'];
				
				if(($url = file_get_contents('http://maps.googleapis.com/maps/api/distancematrix/json?origins='.$address.'&destinations='.$address1)) != null)
				{
										
					$info =  json_decode($url);

					$distance  = $info->rows[0]->elements[0]->distance->text;

					$distance = explode(" ",$distance);
					$distance = $distance[0];
    				$test1=array(
    					'product_id' => $product['product_id'],
    					'name'  =>  $product['name'],
    					'selleraddress' => $product['selleraddress'],
    					'state' => $product['state'],
    					'country' => $product['country'],
    					'description' => $product['description'],
    					'href' => $product['href'],
    					'distance' => $distance,
    					'thumb' => $product['thumb'],
    					'price' => $product['price'],
    					'address' => $address
    				); 
   		 			$searchByDistance[$counter] = $test1;
				}
				else
					echo "<br><font color='red'>Please check the internet connection to get distance!!!!</font>";
     		}  
     	}  
		$checkResult=0;
    	foreach ($searchByDistance as $search) {
        	if ($search['distance'] < $testDis) 
			{ 
        		$checkResult=1;
     ?>
    
   	 	<div class="product-list">
   			<div>
   				<div class="rating">
					<?php echo "<b>Seller's Address:</b> <br/> ".$search['selleraddress']." ".$search['state']." ".$search['country']; echo "<br>Distance from ". $search['address'] ." is ".$search['distance']." KM" ?>
				</div>
     
     			<?php if ($search['thumb']) { ?>
      				<div class="image"><a href="<?php echo $search['href']; ?>"><img src="<?php echo $search['thumb']; ?>" title="<?php echo $search['name']; ?>" alt="<?php echo $search['name']; ?>" /></a></div>
     		 	<?php } ?> 
      			<div class="name"><a href="<?php echo $search['href']; ?>"><?php echo $search['name']; ?></a></div>
       
   			<?php if ($search['price']) { ?>
      			<div class="price">
      			<?php if (!$product['special']) { ?> 
        			<?php echo $search['price']; ?>
       			<?php } else { ?>
        		<span class="price-old"><?php echo $search['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span> 
        		<?php } ?> 
       			</div>
       			<div class="description"><?php   echo $search['description'];  ?></div>
           <?php } ?>
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>
      <div class="cart">
       <!--  <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />-->
      </div>
      <div class="wishlist">
		<a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
	  </div>
     <div class="compare">
          
       	<!--  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>-->
	  </div>
    </div>
	
   </div> 
 
  	<?php  
    	}
	} 
	if($checkResult!=1) {echo "<br> There are no products meeting the search criteria";} } else {
   ?>
 <!-- <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>-->
  <div class="product-list">
    <?php  echo $testDis;
     foreach ($products as $product) { ?>
     <div>
         <!-- Added by Astha -->
      <?php    
     if ($product['selleraddress'])   { ?>
      <div class="rating">
	<?php echo "<b>Seller's Address:</b> <br/>".$product['selleraddress']."<br/> ".$product['state'].", ".$product['country'];  
         
     if($city!=null) {
          $address=$city; 
          $counter=$counter+1;
          }
         else {
        $address="Phuentsholing";
        $counter=$counter+1;
        } 
		$address = str_replace(' ', '+', $address);
		$address1 =  $product['sellercity'];
		//echo $address1;
		if(($url = file_get_contents('http://maps.googleapis.com/maps/api/distancematrix/json?origins='.$address.'&destinations='.$address1)) != null)
		{
			$info =  json_decode($url);		
			$distance  = $info->rows[0]->elements[0]->distance->text;
			$distance = explode(" ",$distance);
			$distance = $distance[0];
  
       		echo "<br>Distance from ". $address ." is ".$distance." KM";
      	}

		else
			echo "<br><font color='red'>Please check the internet connection to get distance!!!!</font>";		?>
   </div>
         
  
       <?php } ?>
     
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
     
      <div class="description"><?php   echo $product['description'];  ?></div>
     
      <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
  
      </div>
      <?php } ?>
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>
     <div class="cart">
     <!--    <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />-->
      </div>
      <div class="wishlist">
   	 		<a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
	  </div>
     <div class="compare">
          
       	<!--  <a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>-->
	  </div>
    </div>
  
    <?php  } ?>
    
  </div> <?php  } ?>
  <?php } ?><div class="pagination"><?php echo $pagination; ?></div>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>

<script type="text/javascript"><!--

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
function test(){
 var test=document.getElementById("location_id").value;
          var name ="name";
          document.write(name);
          if (test != null) {
				html += '<div class="location">' + test + '</div>';
			}
}

//--></script> 
<script type="text/javascript"><!--
function distance(distance) {
    var distance = document.getElementById('distance_id').value;
    alert(distance);
}
//--></script> 
<?php echo $footer; ?>