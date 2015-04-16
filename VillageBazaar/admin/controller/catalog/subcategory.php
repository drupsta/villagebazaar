<?php 
class ControllerCatalogSubcategory extends Controller {
	private $error = array(); 
     
  	public function index() {
		$this->language->load('catalog/subcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/category');
		 
		$this->getList();
  	}
  	public function insert(){
  		
  		$this->language->load('catalog/subcategory');
  		$this->document->setTitle($this->language->get('heading_title'));
  		$this->load->model('catalog/category');
  		 
  		if(!isset($_POST['logout']) && !isset($_POST['home'])){
  			if ((!isset($_POST['back'])) && ($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validateForm())  ) {
  				$valid=$this->model_catalog_category->addCategory($this->request->post);
  				 
  				$this->session->data['success'] = $this->language->get('text_success_add');
  				 
  				$url = '';
  				  				 
  				if (isset($this->request->get['page'])) {
  					$url .= '&page=' . $this->request->get['page'];
  				}
  				 
  				$this->redirect($this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'] . $url, 'SSL'));
  			}
  		}
  		
  		$this->getForm();
  	}
  	
  	public function edit() {
  		 
  		$this->language->load('catalog/subcategory');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/category');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_category->editCategory($this->request->get['category_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
  	}
  	
    protected function getForm() {
    	
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
		$this->data['entry_filter'] = $this->language->get('entry_filter');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_top'] = $this->language->get('entry_top');
		$this->data['entry_column'] = $this->language->get('entry_column');		
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
			
		if (isset($this->error['category'])) {
			$this->data['error_category'] = $this->error['category'];
		} else {
			$this->data['error_category'] = '';
		}
		
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}

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
   		if (!isset($this->request->get['category_id'])) {
   			$this->data['action'] = $this->url->link('catalog/subcategory/insert', 'token=' . $this->session->data['token'], 'SSL');
   		} else {
   			$this->data['action'] = $this->url->link('catalog/subcategory/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $this->request->get['category_id'], 'SSL');
   		}
		
		$this->data['cancel'] = $this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['category_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$category_info = $this->model_catalog_category->getCategory($this->request->get['category_id']);
      		
		}
		
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

		if (isset($this->request->post['path'])) {
			$this->data['path'] = $this->request->post['path'];
		} elseif (!empty($category_info)) {
			$this->data['path'] = $category_info['path'];
		} else {
			$this->data['path'] = '';
		}
		
		if (isset($this->request->post['parent_id'])) {
			 $this->data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($category_info)) {
			$this->data['parent_id'] = $category_info['parent_id'];
		} else {
			$this->data['parent_id'] = 0;
		}
                if (isset($this->request->post['sub_category'])) {
			 $this->data['sub_category'] = $this->request->post['sub_category'];
		}  else {
			$this->data['sub_category'] = '';
		}
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['category_store'])) {
			$this->data['category_store'] = $this->request->post['category_store'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_store'] = $this->model_catalog_category->getCategoryStores($this->request->get['category_id']);
		} else {
			$this->data['category_store'] = array(0);
		}			
		
		if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($category_info)) {
			$this->data['keyword'] = $category_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}

		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($category_info)) {
			$this->data['image'] = $category_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($category_info) && $category_info['image'] && file_exists(DIR_IMAGE . $category_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
		if (isset($this->request->post['top'])) {
			$this->data['top'] = $this->request->post['top'];
		} elseif (!empty($category_info)) {
			$this->data['top'] = $category_info['top'];
		} else {
			$this->data['top'] = 0;
		}
		
		if (isset($this->request->post['column'])) {
			$this->data['column'] = $this->request->post['column'];
		} elseif (!empty($category_info)) {
			$this->data['column'] = $category_info['column'];
		} else {
			$this->data['column'] = 1;
		}
				
		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($category_info)) {
			$this->data['sort_order'] = $category_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($category_info)) {
			$this->data['status'] = $category_info['status'];
		} else {
			$this->data['status'] = 1;
		}
				
		if (isset($this->request->post['category_layout'])) {
			$this->data['category_layout'] = $this->request->post['category_layout'];
		} elseif (isset($this->request->get['category_id'])) {
			$this->data['category_layout'] = $this->model_catalog_category->getCategoryLayouts($this->request->get['category_id']);
		} else {
			$this->data['category_layout'] = array();
		}
		$this->data['categories'] = $this->model_catalog_category->getCategories(array());
	
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
						
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
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $category_id) {
				$this->model_catalog_category->deleteCategory($category_id);
			}

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
        if (isset($this->request->get['filter_category_id'])) {
			$filter_category = $this->request->get['filter_category_id'];
		} else {
			$filter_category = -1;
		}
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c.name';
		}
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
          		
   		if (isset($this->request->get['page'])) {
   			$page = $this->request->get['page'];
   		} else {
   			$page = 1;
   		}
   		
   		$url = '';
   		   		
   		if (isset($this->request->get['page'])) {
   			$url .= '&page=' . $this->request->get['page'];
   		}
   			
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
   		
   		$this->data['insert'] = $this->url->link('catalog/subcategory/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
   		$this->data['delete'] = $this->url->link('catalog/subcategory/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
   		
   		$this->data['subcategories'] = array();
   		
   		$data = array(
   				'filter_parent_id' => $filter_category,
   				'sort'  => $sort,
   				'order' => $order,
   				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
   				'limit' => $this->config->get('config_admin_limit')
   		);
   		
   		$this->load->model('catalog/category');
   		$subcategory_total = $this->model_catalog_category->getSubcategoryCount($data);
   		$results = $this->model_catalog_category->getSubcategory($data);
   		
   		foreach ($results as $result) {
   			$action = array();
   		
   			$action[] = array(
   					'text' => $this->language->get('text_edit'),
   					'href' => $this->url->link('catalog/subcategory/edit', 'token=' . $this->session->data['token'] . '&category_id=' . $result['category_id'] . $url, 'SSL')
   			);
   		
   			$this->data['subcategories'][] = array(
   					'category_id'  => $result['category_id'],
   					'name'     => $result['name'] ,
   					'selected' => isset($this->request->post['selected']) && in_array($result['category_id'], $this->request->post['selected']),
   					'action'   => $action
   			);
   		}
   		
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
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['filter_category_id'] = $filter_category;
				
				
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
		
		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}
		$pagination = new Paginations();
		$pagination->total = $subcategory_total;
 		$pagination->page = $page;
 		$pagination->limit = $this->config->get('config_admin_limit');
 		$pagination->text = $this->language->get('text_pagination');
 		$pagination->url = $this->url->link('catalog/subcategory', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
 		$this->data['pagination'] = $pagination->render();
		
		$this->data['categories'] = $this->model_catalog_category->getCategories(array());
		//$this->data['current_category'] = $filter_category;
						
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->template = 'catalog/subcategory_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}
  	
  	   
    protected function validateForm() {
    	if (!$this->user->hasPermission('modify', 'catalog/category')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
		
		if($this->request->post['parent_id'] == '') {
			$this->error['category'] = $this->language->get('error_category');
			 
		}
    	foreach ($this->request->post['category_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'] = $this->language->get('error_name');
			}
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