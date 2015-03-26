<?php 
class ControllerAccountPricingPolicy extends Controller {
	private $error = array();
	      
  	public function index() {
		if ($this->customer->isLogged()) {
	  		$this->redirect($this->url->link('account/account', '', 'SSL'));
    	}
		
		 	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('Account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),      	
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('pricingpolicy'),
			'href'      => $this->url->link('account/pricingpolicy', '', 'SSL'),      	
        	'separator' => $this->language->get('text_separator')
      	);

    	$this->language->load('account/pricingpolicy');
		
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css'); 

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['entry_first'] = $this->language->get('entry_first');
		$this->data['entry_second'] = $this->language->get('entry_second');
		$this->data['entry_third'] = $this->language->get('entry_third');
		$this->data['entry_desc1'] = $this->language->get('entry_desc1');
		$this->data['entry_price1'] = $this->language->get('entry_price1');
		$this->data['entry_desc2'] = $this->language->get('entry_desc2');
		$this->data['entry_price2'] = $this->language->get('entry_price2');
		$this->data['entry_desc3'] = $this->language->get('entry_desc3');
		$this->data['entry_price3'] = $this->language->get('entry_price3');
		
		
			if (isset($this->error['first'])) {
			$this->data['error_first'] = $this->error['first'];
		} else {
			$this->data['error_first'] = '';
		}
		
		if (isset($this->error['second'])) {
			$this->data['error_second'] = $this->error['second'];
		} else {
			$this->data['error_second'] = '';
		}
		
			if (isset($this->error['third'])) {
			$this->data['error_third'] = $this->error['third'];
		} else {
			$this->data['error_third'] = '';
		}
		
			if (isset($this->error['fourth'])) {
			$this->data['error_fourth'] = $this->error['fourth'];
		} else {
			$this->data['error_fourth'] = '';
		}
		 			
			if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		
		if (isset($this->request->post['first'])) {
    		$this->data['first'] = $this->request->post['first'];
		} else {
			$this->data['first'] = '';
		}
		
		
		if (isset($this->request->post['second'])) {
    		$this->data['second'] = $this->request->post['second'];
		} else {
			$this->data['second'] = '';
		}
		
		
		$this->data['first'] = $this->url->link('account/first');
		$this->data['second'] = $this->url->link('account/second');
		$this->data['third'] = $this->url->link('account/third');
		$this->data['fourth'] = $this->url->link('account/fourth');
	
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');
			
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));
			
			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/info', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {
			$this->data['text_agree'] = '';
		}
		
		if (isset($this->request->post['agree'])) {
      		$this->data['agree'] = $this->request->post['agree'];
		} else {
			$this->data['agree'] = false;
		} 
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/pricingpolicy.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/pricingpolicy.tpl';
		} else {
			$this->template = 'default/template/account/pricingpolicy.tpl';
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