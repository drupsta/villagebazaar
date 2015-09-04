<?php  
class ControllerUsermyaccount extends Controller {  
	private $error = array();
	
  	public function index() {
    	$this->language->load('user/myaccount');

    	$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('user/myaccount');
                if(!isset($_POST['logout']) && !isset($_POST['home']))
                {
                if (($this->request->server['REQUEST_METHOD'] == 'POST' )     && $this->validateForm()) {
			$this->model_user_myaccount->editUser($this->user->getId(), $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			$this->redirect($this->url->link('user/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    	}
                }
                
    	$this->getform();
  	}

	protected function getForm() {
    	$this->data['heading_title'] = $this->language->get('heading_title');
	
    	$this->data['entry_firstname'] = $this->language->get('entry_firstname');
    	$this->data['entry_lastname'] = $this->language->get('entry_lastname');
    	$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_city'] = $this->language->get('entry_city');		
        $this->data['entry_address_2'] = $this->language->get('entry_address_2');
    	$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');
	$this->data['entry_password'] = $this->language->get('entry_password');
    	$this->data['entry_confirm'] = $this->language->get('entry_confirm');	

		$this->data['logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
    
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
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
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
		
	 	if (isset($this->error['address_1'])) {
			$this->data['error_address_1'] = $this->error['address_1'];
		} else {
			$this->data['error_address_1'] = '';
		}
		
		
	 	if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
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
	 	if (isset($this->error['city'])) {
			$this->data['error_city'] = $this->error['city'];
		} else {
			$this->data['error_city'] = '';
		}
                if (isset($this->error['address_2'])) {
			$this->data['error_cec'] = $this->error['address_2'];
		} else {
			$this->data['error_cec'] = '';
		}
                
		
		$url = '';


  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('user/myaccount', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		

	    $this->data['action'] = $this->url->link('user/myaccount', 'token=' . $this->session->data['token'] . $url, 'SSL');	  
    	$this->data['cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token'] . $url, 'SSL');


        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
      		$user_info = $this->model_user_myaccount->getUser($this->user->getId());
    	}
            //print_r($user_info);
		if (isset($this->request->post['firstname'])) {
      		$this->data['firstname'] = $this->request->post['firstname'];
    	} elseif (!empty($user_info)) {
			$this->data['firstname'] = $user_info['firstname'];
		} else {
      		$this->data['firstname'] = '';
    	}

		if (isset($this->request->post['address_1'])) {
      		$this->data['address_1'] = $this->request->post['address_1'];
    	} elseif (!empty($user_info)) {
			$this->data['address_1'] = $user_info['address_1'];
		} else {
      		$this->data['address_1'] = '';
    	}

  		
    	if (isset($this->request->post['telephone'])) {
      		$this->data['telephone'] = $this->request->post['telephone'];
    	} elseif (!empty($user_info)) {
			$this->data['telephone'] = $user_info['telephone'];
		} else {
      		$this->data['telephone'] = '';
    	}
		
    	if (isset($this->request->post['city'])) {
      		$this->data['city'] = $this->request->post['city'];
    	} elseif (!empty($user_info)) {
			$this->data['city'] = $user_info['city'];
		} else {
      		$this->data['city'] = '';
    	}		

    	if (isset($this->request->post['lastname'])) {
      		$this->data['lastname'] = $this->request->post['lastname'];
    	} elseif (!empty($user_info)) {
			$this->data['lastname'] = $user_info['lastname'];
		} else {
      		$this->data['lastname'] = '';
   		}
  
    	if (isset($this->request->post['email'])) {
      		$this->data['email'] = $this->request->post['email'];
    	} elseif (!empty($user_info)) {
			$this->data['email'] = $user_info['email'];
		} else {
      		$this->data['email'] = '';
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
        
//        if (isset($this->request->post['address_2'])) {
//      		$this->data['address_2'] = $this->request->post['address_2'];
//    	} elseif (!empty($user_info)) {
//			$this->data['address_2'] = $user_info['address_2'];
//		} else {
//      		$this->data['address_2'] = '';
//    	}
        if (isset($this->request->post['csc_id'])) {
      		$this->data['csc_id'] = $this->request->post['csc_id'];
    	} elseif (!empty($user_info)) {
			$this->data['csc_id'] = $user_info['csc_id'];
		} else {
      		$this->data['csc_id'] = '';
    	}
 
$this->load->model('user/myaccount');
		$this->data['csc_details'] = $this->model_user_myaccount->cscDetails();
            //    $this->data['csc_name'] = $this->model_user_myaccount->getCscName($this->user->getId());
             //   $cscName= $this->model_user_myaccount->getCscName($this->user->getId());
                
	//	echo "hghghghgghgh".$cscName[0]['name']	;
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


		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
					
		$url = '';
		
		
		$this->template = 'user/myaccount.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());	
  	}
  	
  	protected function validateForm() {
    	if (!$this->user->hasPermission('modify', 'user/myaccount')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}
		
    	if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32) ||!preg_match('/^[a-zA-Z ]*$/', $this->request->post['firstname'])) {
			$this->error['firstname'] = $this->language->get('error_firstname');
    	}

    	if ((utf8_strlen($this->request->post['lastname']) < 1) || (utf8_strlen($this->request->post['lastname']) > 32) ||!preg_match('/^[a-zA-Z ]*$/', $this->request->post['lastname'])) {
      		$this->error['lastname'] = $this->language->get('error_lastname');
    	}
		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error['email'] = $this->language->get('error_email');
		}
	
        if ($this->request->post['password'] || (!isset($this->request->get['user_id']))) {
      		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
        		$this->error['password'] = $this->language->get('error_password');
      		}
	
	  		if ($this->request->post['password'] != $this->request->post['confirm']) {
	    		$this->error['confirm'] = $this->language->get('error_confirm');
	  		}
    	}        
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}
  	}

}

?>