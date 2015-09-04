<?php    
class Controllerusersuccess extends Controller {    
	public function index() { 
    	$this->language->load('user/success');
 
    	$this->document->setTitle($this->language->get('heading_title'));

    	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_success'] = $this->language->get('text_success');
		
		$this->data['button_cancel'] = $this->language->get('button_cancel');

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('user/myaccount', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('user/success', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$url='';
		
		//$this->data['cancel'] = $this->url->link('user/myaccount', 'token=' . $this->session->data['token'] . $url, 'SSL');
                $this->data['cancel'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->template = 'user/success.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());	
  	}
}
?>