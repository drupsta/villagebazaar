<?php 
class ControllerCatalogSubcategory extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->language->load('catalog/subcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/category');
		 
		$this->getList();
  	}
  
  	public function update() {
         //   $_SESSION['Category_Action']="Update Category";
		$this->language->load('catalog/subcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/category');
		 if(!isset($_POST['logout']) && !isset($_POST['home'])){
		if ((!isset($_POST['back'])) && ($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_category->editSubcategory($this->request->get['product_category'], $this->request->post);
			
		$this->session->data['success'] = $this->language->get('text_success_update');
			
	$url = '';

//			if (isset($this->request->get['page'])) {
//				$url .= '&page=' . $this->request->get['page'];
//			}
						
			$this->redirect($this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
                 }
		$this->getForm();
	}
        
        protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

//		$this->data['text_none'] = $this->language->get('text_none');
//		$this->data['text_default'] = $this->language->get('text_default');
//		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
//		$this->data['text_browse'] = $this->language->get('text_browse');
//		$this->data['text_clear'] = $this->language->get('text_clear');		
//		$this->data['text_enabled'] = $this->language->get('text_enabled');
//    	$this->data['text_disabled'] = $this->language->get('text_disabled');
//		$this->data['text_percent'] = $this->language->get('text_percent');
//		$this->data['text_amount'] = $this->language->get('text_amount');

              //  $this->data['subcategory'] = $this->language->get('error_subcategory');		
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
//		$this->data['entry_filter'] = $this->language->get('entry_filter');
//		$this->data['entry_store'] = $this->language->get('entry_store');
//		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
//		$this->data['entry_image'] = $this->language->get('entry_image');
//		$this->data['entry_top'] = $this->language->get('entry_top');
//		$this->data['entry_column'] = $this->language->get('entry_column');		
//		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
//		$this->data['entry_status'] = $this->language->get('entry_status');
//		$this->data['entry_layout'] = $this->language->get('entry_layout');
//		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

//    	$this->data['tab_general'] = $this->language->get('tab_general');
//    	$this->data['tab_data'] = $this->language->get('tab_data');
//		$this->data['tab_design'] = $this->language->get('tab_design');
//		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	if (isset($this->error['error_subcategory'])) {
			$this->data['error_subcategory'] = $this->error['error_subcategory'];
		} else {
			$this->data['error_subcategory'] = '';
		}
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/category', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['category_id'])) {
			$this->data['action'] = $this->url->link('catalog/category/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/subcategory/update', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'].'&product_category=' . $this->request->get['product_category'] , 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		 $category_info = $this->model_catalog_category->getCategoryProduct($this->request->get['category_id']);
    	}
		//print_r($category_info);
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['category_description'])) {
			$this->data['category_description'] = $this->request->post['category_description'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_description'] = $this->model_catalog_category->getCategoryDescriptions($this->request->get['category_id']);
		} else {
			$this->data['category_description'] = array();
		}

                if (isset($this->request->post['sub_category'])) {
			 $this->data['sub_category'] = $this->request->post['sub_category'];
		}  else {
			$this->data['sub_category'] = '';
		}

		$this->load->model('catalog/filter');
		
		if (isset($this->request->post['category_filter'])) {
			$filters = $this->request->post['category_filter'];
		} elseif (isset($this->request->get['category_id'])) {		
			$filters = $this->model_catalog_category->getCategoryFilters($this->request->get['category_id']);
		} else {
			$filters = array();
		}
	
		$this->data['category_filters'] = array();
		
		foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);
			
			if ($filter_info) {
				$this->data['category_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}	
										
		$this->load->model('setting/store');

						
		$this->template = 'catalog/subcategory_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
        public function delete() {
		$this->language->load('catalog/subcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/category');
		
		if (isset($this->request->post['product_category']) && $this->validateDelete()) {
			//foreach ($this->request->post['selected'] as $category_id) {
				$this->model_catalog_category->deleteSubcategory($this->request->post['product_category']);
			//}

			$this->session->data['success'] = $this->language->get('text_success_delete');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
		$this->getList();
	}
        
        
  	protected function getList() {	
                if (isset($this->request->get['cid'])) {
		$filter_category = intVal($this->request->get['cid']);
		} else {
			$filter_category = 0;
			}

                //$url.='';
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'], 'SSL'),       		
      		'separator' => ' :: '
   		);
	
//		
		$this->data['heading_title'] = $this->language->get('heading_title');		
		$this->data['title'] = $this->language->get('title');		
		$this->data['text_enabled'] = $this->language->get('text_enabled');		
		$this->data['text_disabled'] = $this->language->get('text_disabled');		
		$this->data['text_no_results'] = $this->language->get('text_no_results');		
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');		
			
		$this->data['column_image'] = $this->language->get('column_image');		
		$this->data['column_name'] = $this->language->get('column_name');		
		$this->data['column_model'] = $this->language->get('column_model');		
		$this->data['column_price'] = $this->language->get('column_price');		
		$this->data['column_quantity'] = $this->language->get('column_quantity');		
		$this->data['column_status'] = $this->language->get('column_status');		
				
				
		$this->data['button_copy'] = $this->language->get('button_copy');		
		$this->data['button_insert'] = $this->language->get('button_insert');		
		$this->data['button_delete'] = $this->language->get('button_delete');		
		$this->data['button_filter'] = $this->language->get('button_filter');
		 
 		$this->data['token'] = $this->session->data['token'];
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
		 $this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

								
//		if ($order == 'ASC') {
//			$url .= '&order=DESC';
//		} else {
//			$url .= '&order=ASC';
//		}
//
//		if (isset($this->request->get['page'])) {
//			$url .= '&page=' . $this->request->get['page'];
//		}
//					
$this->data['delete'] = $this->url->link('catalog/subcategory/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
//		$pagination = new Paginations();
//		//$pagination->total = $product_total;
////		$pagination->page = $page;
//		$pagination->limit = $this->config->get('config_admin_limit');
//		$pagination->text = $this->language->get('text_pagination');
//		$pagination->url = $this->url->link('report/Category_product', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
//			
//		$this->data['pagination'] = $pagination->render();
//	
				//
		 $this->load->model('catalog/category');
						$this->data['categories'] = $this->model_catalog_category->getCategories(array());
						$this->data['current_category'] = $filter_category;
						//
        	$this->template = 'catalog/subcategory_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
        protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/subcategory')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
             if ($this->request->post['subcategory'] == '') {
      		$this->error['error_subcategory'] = $this->language->get('error_subcategory');
    	}
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
        
        protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
                $count = $this->model_catalog_category->validateSubcategory($this->request->post['category_id1']); 
           $prod = $this->model_catalog_category->getCategoryProduct($this->request->post['product_category']); 
//                print_r($count);
//                echo $count['count(*)'];
                if ($count['count(*)']==1) {
                    $this->error['warning'] = $this->language->get('error_count');   
                } 
           
                      //  print_r($prod);
        if($prod!=array()){
             $this->error['warning'] = $this->language->get('error_productexist');
            //echo "success";
         //   return true;
        }
                //print_r($prod);
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
        
        public function getSubcategory() {		
		
		$output = '<option value="0">' . "---Please Select---" . '</option>';
		
		$this->load->model('catalog/category');
		
		$results = $this->model_catalog_category->getSubcategory($this->request->post['category_id1']);
//print_r($results);
		foreach ($results as $result) {
			$output .= '<option value="' . $result['category_id'] . '"';

			if ($this->request->get['category_id'] == $result['category_id']) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
		
		
	}
}
?>