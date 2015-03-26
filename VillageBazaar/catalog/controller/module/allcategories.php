<?php
class ControllerModuleAllCategories extends Controller {
	
	public function index() {
		
		$this->language->load('module/allcategories');
		$this->load->model('tool/image'); 
		
      	$this->data['heading_title'] = $this->language->get('heading_title');
      	$this->data['description'] = $this->language->get('description');
		
 	  	$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'][] = array(
        		'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/allcategories'),      		
        		'separator' => '/'
      	);	
		$this->load->model('catalog/category');
                $this->load->model('catalog/product');
		$this->load->model('catalog/allcategories');
              //Added by Astha
                $this->data['categories'] = array();
                ////
		$categories = $this->model_catalog_category->getCategories();
		$cats		=	array();
		$subcats	=	array();
//                foreach ($categories as $category) {
//			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
//
//			$children_data = array();
//
//			$children = $this->model_catalog_category->getCategories($category['category_id']);
//
//			foreach ($children as $child) {
//				$data = array(
//					'filter_category_id'  => $child['category_id'],
//					'filter_sub_category' => true
//				);
//
//				$product_total = $this->model_catalog_product->getTotalProducts($data);
//
//				$total += $product_total;
//
//				$children_data[] = array(
//					'category_id' => $child['category_id'],
//					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
//					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
//				);		
//			}
//
//			$this->data['categories'][] = array(
//				'category_id' => $category['category_id'],
//				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
//				'children'    => $children_data,
//				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
//			);	
//		}
		foreach($categories as $category){
			//$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
                       $total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));
			$subcategories = $this->model_catalog_category->getCategories($category['category_id']);
			
                        foreach($subcategories as $subcategory){
				$img		=	$this->model_tool_image->resize($subcategory['image'], 20, 20);
				$URL			=	$this->model_catalog_allcategories->getUrlCategory($subcategory['category_id']);
				//if($URL['keyword']==""){
					$RealUrl	=	$this->url->link('product/category','path='.$category['category_id'].'_'.$subcategory['category_id']);
					//}else{
					//$RealUrl	=	HTTP_SERVER.$URL['keyword'];
				//}
                                        $data = array(
					'filter_category_id'  => $subcategory['category_id'],
					'filter_sub_category' => true
				);
                                        $product_total = $this->model_catalog_product->getTotalProducts($data);

			$total += $product_total;
				$subcats[]	=	array(
				'name'			=> $subcategory['name'].($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
				'image'			=> $img,
				'id'			=> $subcategory['category_id'],
				'url'			=> $RealUrl
				);
			}
			$URL			=	$this->model_catalog_allcategories->getUrlCategory($category['category_id']);
			//if($URL['keyword']==""){
				$RealUrl	=	$this->url->link('product/category','path='.$category['category_id']);
				//}else{
				//$RealUrl	=	HTTP_SERVER.$URL['keyword'];
			//}
			$img			=	$this->model_tool_image->resize($category['image'], 250, 150);
			$cats[]=array(
			//'name'			=> $category['name'],
                         'name'			=> $category['name'].($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),    
                            //'image'			=> $img,
			'id'			=> $category['category_id'],
			'url'			=> $RealUrl,
			'subcats'		=> $subcats
			);
			$subcats		=	'';
		}
		$this->data['cats']		=	$cats;
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/allcategories.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/allcategories.tpl';
		} else {
			$this->template = 'default/template/module/allcategories.tpl';
		}
		
		$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
		);
	  		$this->response->setOutput($this->render());
	}

}
?>