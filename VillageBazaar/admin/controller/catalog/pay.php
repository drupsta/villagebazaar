<?php    
class Controllercatalogpay extends Controller {    
	public function index() { 
    	$this->language->load('catalog/pay');
 
    	$this->document->setTitle($this->language->get('heading_title'));

    	$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_succes'] = $this->language->get('text_succes');
		
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		
    	$this->language->load('catalog/pay');

    	//$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/product');
	
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			$this->model_catalog_product->payProduct($this->request->get['product_id']);

           // $this->openbay->productUpdateListen($this->request->get['product_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_succes');
			
			$url = '';
			
			
			$this->data['action'] = $this->url->link('catalog/pay', 'token=' . $this->session->data['token'] . '&product_id=' . $this->request->get['product_id'] . $url, 'SSL');
		}

    	//$this->getForm();
  

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);
		
		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('user/pay', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/pay', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$url='';
		
		if(isset($_POST['product_id'])){
		echo "welcome    77777";
		
		}
		$this->data['cancel'] = $this->url->link('catalog/product', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->template = 'catalog/pay.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());	
  	}

}
?>