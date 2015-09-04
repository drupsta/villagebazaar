<?php 
class ControllerAccountLogin extends Controller {
	private $error = array();
	public function index() {
	$this->load->model('account/address');
	$this->load->model('account/customer');
        ///////////////////////////////////////////////////
if(isset($this->request->post['username']))
	{
	//if($this->request->post['username']=="admin")
	{
	$_SESSION['username']=$this->request->post['username'];
	$_SESSION['password']=$this->request->post['password'];
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate1($this->request->post['username'],$this->request->post['password'])) { 
			$this->session->data['token'] = md5(mt_rand());
			$_SESSION['token_key']=$this->session->data['token'];
                        
                        $user = $this->model_account_customer->getUserGroup($_SESSION['username']);
                        //print_r($user_group_id);
			if (isset($this->request->post['redirect'])) {
				//$this->redirect($this->request->post['redirect'] . '&token=' . $this->session->data['token']);
			} else {
                        $_SESSION['usergroupid']=$user['user_group_id'];
			    
                            if($user['user_group_id']==1){
                                $this->redirect("http://".HTTP_SERVERIP."/villagebazaar/admin/index.php?route=catalog/product&token=".$_SESSION['token_key']);
                            }
                            else {
				$this->redirect("http://".HTTP_SERVERIP."/villagebazaar/");
                            }
                        }
		}
            }
}
        
///////////////////////////////////////////////////	
	
	$this->load->model('account/customer');
		// Login override for admin users
		if (!empty($this->request->get['token'])) {
			$this->customer->logout();
			$this->cart->clear();
		unset($this->session->data['wishlist']);
			unset($this->session->data['shipping_address_id']);
			unset($this->session->data['shipping_country_id']);
			unset($this->session->data['shipping_zone_id']);
			unset($this->session->data['shipping_postcode']);
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_address_id']);
			unset($this->session->data['payment_country_id']);
			unset($this->session->data['payment_zone_id']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			
			//$customer_info = $this->model_account_customer->getCustomerByToken($this->request->get['token']);
                        $customer_info = $this->model_account_customer->getUser($_SESSION['username']);
			//print_r($customer_info);
		 //	if ($customer_info && $this->customer->login($customer_info['email'], '', true)) {
                 		if ($customer_info && $this->customer->login($customer_info['username'], '', true)) {
				// Default Addresses
				$this->load->model('account/address');
					
				$address_info = $this->model_account_address->getAddress($this->customer->getAddressId());
										
				if ($address_info) {
					if ($this->config->get('config_tax_customer') == 'shipping') {
						$this->session->data['shipping_country_id'] = $address_info['country_id'];
						$this->session->data['shipping_zone_id'] = $address_info['zone_id'];
						$this->session->data['shipping_postcode'] = $address_info['postcode'];	
					}
					
					if ($this->config->get('config_tax_customer') == 'payment') {
						$this->session->data['payment_country_id'] = $address_info['country_id'];
						$this->session->data['payment_zone_id'] = $address_info['zone_id'];
					}
				} else {
					unset($this->session->data['shipping_country_id']);	
					unset($this->session->data['shipping_zone_id']);	
					unset($this->session->data['shipping_postcode']);
					unset($this->session->data['payment_country_id']);	
					unset($this->session->data['payment_zone_id']);	
				}
									
				$this->redirect($this->url->link('account/account', '', 'SSL')); 
			}
		}		
		
		if ($this->customer->isLogged()) {  
      	//$this->redirect($this->url->link('account/account', '', 'SSL'));
                    $this->redirect("http://".HTTP_SERVERIP."/villagebazaar/");
			//$this->redirect($this->url->link('common/home'));
    	}
	
    	$this->language->load('account/login');

    	$this->document->setTitle($this->language->get('heading_title'));
								
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			unset($this->session->data['guest']);
			
			// Default Shipping Address
			$this->load->model('account/address');
				
			$address_info = $this->model_account_address->getAddress($this->customer->getAddressId());
									
			if ($address_info) {
				if ($this->config->get('config_tax_customer') == 'shipping') {
					$this->session->data['shipping_country_id'] = $address_info['country_id'];
					$this->session->data['shipping_zone_id'] = $address_info['zone_id'];
					$this->session->data['shipping_postcode'] = $address_info['postcode'];	
				}
				
				if ($this->config->get('config_tax_customer') == 'payment') {
					$this->session->data['payment_country_id'] = $address_info['country_id'];
					$this->session->data['payment_zone_id'] = $address_info['zone_id'];
				}
			} else {
				unset($this->session->data['shipping_country_id']);	
				unset($this->session->data['shipping_zone_id']);	
				unset($this->session->data['shipping_postcode']);
				unset($this->session->data['payment_country_id']);	
				unset($this->session->data['payment_zone_id']);	
			}
							
			// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				$this->redirect(str_replace('&amp;', '&', $this->request->post['redirect']));
			} else {
				$this->redirect($this->url->link('account/account', '', 'SSL')); 
			}
    	}  
		
      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),       	
        	'separator' => false
      	);
  
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_login'),
			'href'      => $this->url->link('account/login', '', 'SSL'),      	
        	'separator' => $this->language->get('text_separator')
      	);
				
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_new_customer'] = $this->language->get('text_new_customer');
    	$this->data['text_register'] = $this->language->get('text_register');
    	$this->data['text_register_account'] = $this->language->get('text_register_account');
		$this->data['text_returning_customer'] = $this->language->get('text_returning_customer');
		$this->data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
    	$this->data['text_forgotten'] = $this->language->get('text_forgotten');

    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_password'] = $this->language->get('entry_password');

    	$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_login'] = $this->language->get('button_login');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->data['action'] = $this->url->link('account/login', '', 'SSL');
		//$this->data['register'] = $this->url->link('account/register', '', 'SSL');
                //Added by Astha on 8th July 2014
                $this->data['register'] = $this->url->link('account/sellerregister', '', 'SSL');
		$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

    	// Added strpos check to pass McAfee PCI compliance test (http://forum.opencart.com/viewtopic.php?f=10&t=12043&p=151494#p151295)
		if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
			$this->data['redirect'] = $this->request->post['redirect'];
		} elseif (isset($this->session->data['redirect'])) {
      		$this->data['redirect'] = $this->session->data['redirect'];
	  		
			unset($this->session->data['redirect']);		  	
    	} else {
			$this->data['redirect'] = '';
		}

		if (isset($this->session->data['success'])) {
    		$this->data['success'] = $this->session->data['success'];
    
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}
                if (isset($this->request->post['username'])) {
		$this->data['username'] = $this->request->post['username'];
			$_SESSION['username']=$this->request->post['username'];
			
		} else {
			$this->data['username'] = '';
		}
                
		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
			$_SESSION['password']=$this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}
		
			
			
	
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/login.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/login.tpl';
		} else {
			$this->template = 'default/template/account/login.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
						
		//$this->response->setOutput($this->render());
                ///////// Sanjay sir
                
$this->response->setOutput($this->render());
//////////////////////////////////////////////
  	}
  
  
 function validate() {
    //	if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
            	if (!$this->customer->login($this->request->post['username'], $this->request->post['password'])) {
      		$this->error['warning'] = $this->language->get('error_login');
    	}
	
	//	$customer_info = $this->model_account_customer->getCustomerByEmail($this->request->post['email']);
		
//    	if ($customer_info && !$customer_info['approved']) {
//      		$this->error['warning'] = $this->language->get('error_approved');
//    	}		
		
    	if (!$this->error) {
      		return true;
    	} else {
      		return false;
    	}  	
  	}
	
	
	function login($username, $password) {
    	$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE username = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");
        //    $user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE email = '" . $this->db->escape($username) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");
    	if ($user_query->num_rows) {
			$this->session->data['user_id'] = $user_query->row['user_id'];
			
			$this->user_id = $user_query->row['user_id'];
			$this->username = $user_query->row['username'];			

      		$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

	  		$permissions = unserialize($user_group_query->row['permission']);

			if (is_array($permissions)) {
				foreach ($permissions as $key => $value) {
					$this->permission[$key] = $value;
				}
			}      		return true;
    	} else {return false;
    	}
  	}
 function validate1($username,$password) {
     if (!$this->customer->login($this->request->post['username'], $this->request->post['password'])) {
      		$this->error['warning'] = $this->language->get('error_login');
    	}
$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE username = '" . $this->request->post['username'] . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . md5($this->request->post['password']) . "') AND status = '1'");
    	if ($user_query->num_rows) {
			$this->session->data['user_id'] = $user_query->row['user_id'];
			$this->user_id = $user_query->row['user_id'];
			$this->username = $user_query->row['username'];			
      		$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");
	  		$permissions = unserialize($user_group_query->row['permission']);
			if (is_array($permissions)) {
				foreach ($permissions as $key => $value) {
					//$this->permission[$key] = $value;
				}
			}
                        
      		return true;
    	} else {
      		return false;    	}}}?>
