<?php 
class ControllerAccountSellerRegister extends Controller {
	private $error = array();
	      
  	public function index() {
  		$this->language->load('account/sellerregister');
  		
  		$this->document->setTitle($this->language->get('heading_title'));
  		
  		$this->load->model('account/seller');
  		
  		$this->getForm();
  	}
  	public function insert(){
  		$this->language->load('account/sellerregister');
  		
  		$this->document->setTitle($this->language->get('heading_title'));
  		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
  		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');
  		$this->load->model('account/seller');
  		
  		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
  			$this->model_account_seller->addCustomer($this->request->post);
  		
  			$this->customer->login($this->request->post['email'], $this->request->post['password']);
  		
  			unset($this->session->data['guest']);
  				
  		
  			$this->redirect($this->url->link('account/success'));
  		}
  		else
  			$this->error['warning'] = $this->language->get('error_register');
  		
  		$this->getForm();
  		
  	}
  	
  	public function getForm(){
  		
		if ($this->customer->isLogged()) {
	  		//$this->redirect($this->url->link('account/account', '', 'SSL'));
    	}
		
       	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_adminaccount_already'] = sprintf($this->language->get('text_adminaccount_already'),$this->language->get('admin'));
		
		
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_mobileno'] = $this->language->get('entry_mobileno');
		//$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fixedline'] = $this->language->get('entry_fixedline');
		$this->data['button_continue'] = $this->language->get('button_continue');
	    $this->data['text_your_details'] = $this->language->get('text_your_details');
	    $this->data['text_your_address'] = $this->language->get('text_your_address');
		$this->data['entry_address'] = $this->language->get('entry_address');
    	$this->data['entry_address1'] = $this->language->get('entry_address1');
		//added
		$this->data['entry_village'] = $this->language->get('entry_village');
    	$this->data['entry_geog'] = $this->language->get('entry_geog');
		$this->data['entry_dungkhag'] = $this->language->get('entry_dungkhag');
    	$this->data['entry_dzongkhag'] = $this->language->get('entry_dzongkhag');
		
		$this->data['entry_postoffice'] = $this->language->get('entry_postoffice');
				
    	$this->data['entry_postcode'] = $this->language->get('entry_postcode');
    	$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['text_your_password'] = $this->language->get('text_your_password');
		$this->data['entry_password'] = $this->language->get('entry_password');
    	$this->data['entry_confirm'] = $this->language->get('entry_confirm');
		$this->data['action'] = $this->url->link('account/sellerregister/insert','', 'SSL');
		$this->data['entry_username'] = $this->language->get('entry_username');
		$this->data['entry_country'] = $this->language->get('entry_country');
    	$this->data['entry_zone'] = $this->language->get('entry_zone');

    	//Errors
		if (isset($this->error['username'])) {
			$this->data['error_username'] = $this->error['username'];
		} else {
			$this->data['error_username'] = '';
		}
				
		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}	
				
		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}		
                	
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
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
                
        if (isset($this->error['email'])) {
			$this->data['error_email1'] = $this->error['email'];
		} else {
			$this->data['error_email1'] = '';
		}
                 if (isset($this->error['email_confirm'])) {
			$this->data['error_email2'] = $this->error['email_confirm'];
		} else {
			$this->data['error_email2'] = '';
		}
		
		if (isset($this->error['mobileno'])) {
			$this->data['error_mobileno'] = $this->error['mobileno'];
		} else {
			$this->data['error_mobileno'] = '';
		}
		
		if (isset($this->error['fixedline'])) {
			$this->data['error_fixedline'] = $this->error['fixedline'];
		} else {
			$this->data['error_fixedline'] = '';
		}
		if (isset($this->error['areacode'])) {
			$this->data['error_areacode'] = $this->error['areacode'];
		} else {
			$this->data['error_areacode'] = '';
		}
	
		if (isset($this->error['address'])) {
			$this->data['error_address'] = $this->error['address'];
		} else {
			$this->data['error_address'] = '';
		}
		
		if (isset($this->error['dzongkhag'])) {
			$this->data['error_dzongkhag'] = $this->error['dzongkhag'];
		} else {
			$this->data['error_dzongkhag'] = '';
		}
		
		if (isset($this->error['dungkhag'])) {
			$this->data['error_dungkhag'] = $this->error['dungkhag'];
		} else {
			$this->data['error_dungkhag'] = '';
		}
		
		if (isset($this->error['village'])) {
			$this->data['error_village'] = $this->error['village'];
		} else {
			$this->data['error_village'] = '';
		}
		if (isset($this->error['geog'])) {
			$this->data['error_geog'] = $this->error['geog'];
		} else {
			$this->data['error_geog'] = '';
		}
		if (isset($this->error['city'])) {
			$this->data['error_city'] = $this->error['city'];
		} else {
			$this->data['error_city'] = '';
		}
		
		if (isset($this->error['postcode'])) {
			$this->data['error_postcode'] = $this->error['postcode'];
		} else {
			$this->data['error_postcode'] = '';
		}
		
		if (isset($this->error['postoffice'])) {
			$this->data['error_postoffice'] = $this->error['postoffice'];
		} else {
			$this->data['error_postoffice'] = '';
		}
				
		if (isset($this->error['price_dur'])) {
			$this->data['error_cec'] = $this->error['price_dur'];
		} else {
			$this->data['error_cec'] = '';
		}
		
		if (isset($this->error['country'])) {
			$this->data['error_country'] = $this->error['country'];
		} else {
			$this->data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$this->data['error_zone'] = $this->error['zone'];
		} else {
			$this->data['error_zone'] = '';
		}
				
		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}
		
 		if (isset($this->error['confirm'])) {
			$this->data['error_confirm'] = $this->error['confirm'];
		} else {
			$this->data['error_confirm'] = '';
		}
		
		//Post
		if (isset($this->request->post['firstname'])) {
    		$this->data['firstname'] = $this->request->post['firstname'];
		} else {
			$this->data['firstname'] = '';
		}
				
		if (isset($this->request->post['lastname'])) {
    		$this->data['lastname'] = $this->request->post['lastname'];
		} else {
			$this->data['lastname'] = '';
		}
				
		if (isset($this->request->post['email'])) {
    		$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}
		if (isset($this->request->post['email_confirm'])) {
    		$this->data['email_confirm'] = $this->request->post['email_confirm'];
		} else {
			$this->data['email_confirm'] = '';
		}
		if (isset($this->request->post['mobileno'])) {
    		$this->data['mobileno'] = $this->request->post['mobileno'];
		} else {
			$this->data['mobileno'] = '';
		}
		if (isset($this->request->post['areacode'])) {
    		$this->data['areacode'] = $this->request->post['areacode'];
		} else {
			$this->data['areacode'] = '';
		}
		
		if (isset($this->request->post['fixedline'])) {
    		$this->data['fixedline'] = $this->request->post['fixedline'];
		} else {
			$this->data['fixedline'] = '';
		}
		if (isset($this->request->post['country_code'])) {
    		$this->data['country_code'] = $this->request->post['country_code'];
		} else {
			$this->data['country_code'] = '';
		}
		if (isset($this->request->post['address'])) {
    		$this->data['address'] = $this->request->post['address'];
		} else {
			$this->data['address'] = '';
		}
		if (isset($this->request->post['csc_id'])) {
    		$this->data['csc_id'] = $this->request->post['csc_id'];
		} else {
			$this->data['csc_id'] = '';
		}
				
		if (isset($this->request->post['postoffice'])) {
    		$this->data['postoffice'] = $this->request->post['postoffice'];
		} else {
			$this->data['postoffice'] = '';
		}
			
			
		if (isset($this->request->post['postcode'])) {
    		$this->data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_postcode'])) {
			$this->data['postcode'] = $this->session->data['shipping_postcode'];		
		} else {
			$this->data['postcode'] = '';
		}
		
		if (isset($this->request->post['village'])) {
			$this->data['village'] = $this->request->post['village'];
		} else {
			$this->data['village'] = '';
		}
		
		if (isset($this->request->post['geog'])) {
    		$this->data['geog'] = $this->request->post['geog'];
		} else {
			$this->data['geog'] = '';
		}
		
		if (isset($this->request->post['dzongkhag'])) {
			$this->data['dzongkhag'] = $this->request->post['dzongkhag'];
		} else {
			$this->data['dzongkhag'] = '';
		}
		if (isset($this->request->post['dungkhag'])) {
			$this->data['dungkhag'] = $this->request->post['dungkhag'];
		} else {
			$this->data['dungkhag'] = '';
		}
		if (isset($this->request->post['city'])) {
    		$this->data['city'] = $this->request->post['city'];
		} else {
			$this->data['city'] = '';
		}
				
		if (isset($this->request->post['username'])) {
      		$this->data['username'] = $this->request->post['username'];
    	} elseif (!empty($user_info)) {
			$this->data['username'] = $user_info['username'];
		} else {
      		$this->data['username'] = '';
    	}		
		
		if (isset($this->request->post['password'])) {
    		$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}
		
		if (isset($this->request->post['confirm'])) {
    		$this->data['confirm'] = $this->request->post['confirm'];
		} else {
			$this->data['confirm'] = '';
		}
				
    	if (isset($this->request->post['country_id'])) {
      		$this->data['country_id'] = $this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_country_id'])) {
			$this->data['country_id'] = $this->session->data['shipping_country_id'];		
		} else {	
      		$this->data['country_id'] = $this->config->get('config_country_id');
    	}

    	if (isset($this->request->post['zone_id'])) {
      		$this->data['zone_id'] = $this->request->post['zone_id']; 	
		} elseif (isset($this->session->data['shipping_zone_id'])) {
			$this->data['zone_id'] = $this->session->data['shipping_zone_id'];			
		} else {
      		$this->data['zone_id'] = '';
    	}
		
		$this->load->model('localisation/country');
		$this->data['countries'] = $this->model_localisation_country->getCountries();
	    $this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		
		$this->load->model('account/seller');
		$this->data['csc_details'] = $this->model_account_seller->cscDetails();
	    $this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		
		/*				
		if (isset($this->request->post['newsletter'])) {
    		$this->data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$this->data['newsletter'] = '';
		}	*/

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
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/sellerregister.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/sellerregister.tpl';
		} else {
			$this->template = 'default/template/account/sellerregister.tpl';
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
  	
  
  	 protected function validate() {
  	 	
    	if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)
		||!preg_match('/^[a-zA-Z ]*$/', $this->request->post['firstname'])) {
      		$this->error['firstname'] = $this->language->get('error_firstname');
      		
    	}

    	if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32)
		||!preg_match('/^[a-zA-Z ]*$/', $this->request->post['lastname'])) {
      		$this->error['lastname'] = $this->language->get('error_lastname');
      		
    	}

    	//if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post[   
		//'email'])) {
        if($this->request->post['email']==NULL) {
            $this->error['email'] = $this->language->get('error_email');
           
        }
        elseif ($this->request->post['email']!==$this->request->post['email_confirm'])
  		{
 			$this->error['email_confirm'] = $this->language->get('error_email2'); 			
 			
 		}
      	if($this->request->post['email']!=NULL)
		{
			if ( !preg_match('/(^[^\@]+@.*\.[a-z]{2,6}$)/i', $this->request->post['email']))
			{
				$this->error['email'] = $this->language->get('error_email1');
    		}
		}
		if ($this->model_account_seller->getTotalUsersByEmail($this->request->post['email'])) {
      		$this->error['warning'] = $this->language->get('error_email3');
    	}		

    	/* if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
      		$this->error['warning'] = $this->language->get('error_exists');
    	} */
		
    
		if ((utf8_strlen($this->request->post['telephone']) < 7) || (utf8_strlen($this->request->post['telephone']) > 8)||!preg_match('/(^[0-9]*$)/', $this->request->post['telephone'])) {
      		$this->error['telephone'] = $this->language->get('error_mobileno');
    	}
		
		if($this->request->post['fixedline']!=NULL)
		{
			if ((utf8_strlen($this->request->post['fixedline']) > 6) ||!preg_match('/^[0-9]*$/', $this->request->post['fixedline']))
		 	{
      			$this->error['fixedline'] = $this->language->get('error_fixedline');
    		}
		}
		
        if($this->request->post['areacode']!=NULL)
		{
			if ((utf8_strlen($this->request->post['areacode']) < 2)||!preg_match('/(^[0-9]*$)/', $this->request->post['areacode']))
		 	{
      			$this->error['std'] = $this->language->get('error_std');
    		}
		}

		
    	if ((utf8_strlen($this->request->post['address_1']) < 3) || (utf8_strlen($this->request->post['address_1']) > 250)) {
      		$this->error['address'] = $this->language->get('error_address');
    	}

    	if ((utf8_strlen($this->request->post['city']) < 2) || (utf8_strlen($this->request->post['city']) > 50)
		||!preg_match('/(^[a-zA-Z ]*$)/', $this->request->post['city'])) {
      		$this->error['city'] = $this->language->get('error_city');
    	}
		
		/* 
		if($this->request->post['postoffice']!=NULL) {
			if ((utf8_strlen($this->request->post['postoffice']) < 6) || (utf8_strlen($this->request->post['postoffice']) > 20) ||!preg_match('/(^[0-9]*$)/', $this->request->post['postoffice'])) {
      			$this->error['postcode'] = $this->language->get('error_postcode');
    		}
        } */
		
		if ($this->request->post['csc_id'] == '') {
      		$this->error['price_dur'] = $this->language->get('error_cec');
    	}
		

		$this->load->model('localisation/country');
		
		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
		$test1 = $this->model_account_seller->getUsername($this->request->post['username']);
	
        if ((utf8_strlen($this->request->post['username']) < 3) )
		 {
      		$this->error['username'] = $this->language->get('error_username');
    	}
		
    	if ($this->request->post['country_id'] == '') {
      		$this->error['country'] = $this->language->get('error_country');
    	}
		
    	if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '') {
      		$this->error['zone'] = $this->language->get('error_zone');
    	} 
    	if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
      		$this->error['password'] = $this->language->get('error_password');
    	}

    	if ($this->request->post['confirm'] != $this->request->post['password']) {
      		$this->error['confirm'] = $this->language->get('error_confirm');
    	}
		
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');
			
		$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id')); 
			
			if ($information_info && !isset($this->request->post['agree'])) {
      			$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}
		print_r($this->error);
		
		
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}
  	}
	
 public function country() {
		$json = array();
		
		$this->load->model('localisation/country');

    	$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);
		
		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}
		
		$this->response->setOutput(json_encode($json));
	}
	public function getDungkhag() {
		//echo "testttt";
		$this->language->load('account/sellerregister');
		$output = '<option value="0">' . $this->language->get('text_none') . '</option>';
	
		$this->load->model('localisation/dungkhag');
	
		$results = $this->model_localisation_dungkhag->getDungkhagByZoneId($this->request->post['zone_id']);
		
		foreach ($results as $result) {
			$output .= '<option value="' . $result['dungkhag_id'] . '"';
		
			$output .= '>' . $result['name'] . '</option>';
		}
	
		$this->response->setOutput($output);
	
	}
} 
?>