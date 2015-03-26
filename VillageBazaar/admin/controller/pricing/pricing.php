<?php 
class ControllerPricingPricing extends Controller {
	private $error = array();
 
	public function index() {
		$this->language->load('pricing/pricing');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricing/pricing');
		
		$this->getList();
	}

	public function insert() {
		$this->language->load('pricing/pricing');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricing/pricing');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_pricing_pricing->addPricing($this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}
			$this->redirect($this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('pricing/pricing');

		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('pricing/pricing');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm1() ) {
			$this->model_pricing_pricing->editPricing($this->request->get['policy_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
				if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}	
			$this->redirect($this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}
 
	public function delete() {
		$this->language->load('pricing/pricing');
 
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('pricing/pricing');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $policy_id) {
				$this->model_pricing_pricing->deletePricing($policy_id);
			}
			
			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}
			$this->redirect($this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}
		if (isset($this->request->get['price_duration_id'])) {
      		$price_duration_id = $this->request->get['price_duration_id'];    	
		} else {
      		$price_duration_id = '';
    	}
		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		//echo "test3";
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
			
		$url = '';
		if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}	
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
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
			'href'      => $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('pricing/pricing/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('pricing/pricing/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		// $this->data['update'] = $this->url->link('pricing/pricing/update', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['prices'] = array();

		$data = array(
			'sort'  => $sort,
                    'price_duration_id' => $price_duration_id,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$this->load->model('catalog/product');
		
		$this->data['price_duration'] = $this->model_catalog_product->getPriceDuration();
		$pricing_total = $this->model_pricing_pricing->getTotalPrices($data);
		
		$results = $this->model_pricing_pricing->getPrices($data);
		//echo $_SESSION['range'];
		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('pricing/pricing/update', 'token=' . $this->session->data['token'] . '&policy_id=' . $result['policy_id'] . $url, 'SSL')
			);

			$this->data['prices'][] = array(
				'policy_id' => $result['policy_id'],
				//'duration_policy_id'       => $result['duration_policy_id'] . (($result['policy_id'] == $this->config->get('config_country_id')) ? $this->language->get('text_default') : null),
				'duration_policy_id'       => $result['duration_policy_id'] ,
                            'from_price_range' => $result['from_price_range'],
                            
				'to_price_range' => $result['to_price_range'],
				'amount_percentage' => $result['amount_percentage'],
                            'from_date' => $result['date_added'],
                            'to_date' => $result['date_modified'],
                            'status' => $result['status'],
				'selected'   => isset($this->request->post['selected']) && in_array($result['policy_id'], $this->request->post['selected']),			
				'action'     => $action
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['column_duration'] = $this->language->get('column_duration');
		$this->data['column_from_price'] = $this->language->get('column_from_price');
		$this->data['column_to_price'] = $this->language->get('column_to_price');
		$this->data['column_percentage'] = $this->language->get('column_percentage');
		$this->data['column_action'] = $this->language->get('column_action');	

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
                $this->data['token']=$this->session->data['token'];
                ///////
                $pricing_total1 = $this->model_pricing_pricing->getTotalPrices1($data);
                $test4=  $this->model_pricing_pricing->checkPolicyId($price_duration_id);
                for($i=0;$i<($pricing_total1-1);$i++){
                //    while ($test4[]['duration_policy_id']=1 || $test4[]['duration_policy_id']=2 || $test4[]['duration_policy_id']=3 ) {
                    if (($test4[$i+1]['from_price_range']-1!=$test4[$i]['to_price_range']) && ($test4[$i+1]['duration_policy_id']==$test4[$i]['duration_policy_id'] ))
                    {
                        $a=$test4[$i]['to_price_range']+1;
                        $b=$test4[$i+1]['from_price_range']-1;
                        $this->data['test4']= "Range between ".$a." and ".$b." for ".$test4[$i+1]['duration_policy_id']." month duration not found.Please set the policy for the range.";
                    }
                }
           ///// 
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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->data['sort_name'] = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$this->data['sort_photo'] = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . '&sort=from_price_range' . $url, 'SSL');
		$this->data['sort_iso_code_3'] = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . '&sort=to_price_range' . $url, 'SSL');
		
		$this->data['sort_percentage'] = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . '&sort=amount_percentage' . $url, 'SSL');
		
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}
		$pagination = new Pagination();
		$pagination->total = $pricing_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();
		$this->data['price_duration_id'] = $price_duration_id;
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'pricing/pricing_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		//$this->data['text_enabled'] = $this->language->get('text_enabled');
		//$this->data['text_disabled'] = $this->language->get('text_disabled');
		
		$this->data['text_one_months'] = $this->language->get('text_one_months');
		$this->data['text_two_months'] = $this->language->get('text_two_months');
		$this->data['text_three_months'] = $this->language->get('text_three_months');
		$this->data['text_four_months'] = $this->language->get('text_four_months');
		$this->data['text_five_months'] = $this->language->get('text_five_months');
		$this->data['text_six_months'] = $this->language->get('text_six_months');
		$this->data['text_seven_months'] = $this->language->get('text_seven_months');
		$this->data['text_eight_months'] = $this->language->get('text_eight_months');
		$this->data['text_nine_months'] = $this->language->get('text_nine_months');
		$this->data['text_ten_months'] = $this->language->get('text_ten_months');
		$this->data['text_eleven_months'] = $this->language->get('text_eleven_months');
		$this->data['text_twelve_months'] = $this->language->get('text_twelve_months');
		
		$this->data['text_from_Priceone'] = $this->language->get('text_from_Priceone');
		$this->data['text_from_Priceoneth'] = $this->language->get('text_from_Priceoneth');
		$this->data['text_from_Pricetwoth'] = $this->language->get('text_from_Pricetwoth');
		$this->data['text_from_Pricefiveth'] = $this->language->get('text_from_Pricefiveth');
		
		
	    $this->data['text_to_Priceoneth'] = $this->language->get('text_to_Priceoneth');
		$this->data['text_to_Pricetwoth'] = $this->language->get('text_to_Pricetwoth');
		$this->data['text_to_Pricefiveth'] = $this->language->get('text_to_Pricefiveth');
		$this->data['text_to_Pricetenth'] = $this->language->get('text_to_Pricetenth');
		
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_price_range'] = $this->language->get('entry_price_range');
		$this->data['entry_from_range'] = $this->language->get('entry_from_range');
		$this->data['entry_to_range'] = $this->language->get('entry_to_range');
		$this->data['entry_amount_percentage'] = $this->language->get('entry_amount_percentage');
		$this->data['entry_postcode_required'] = $this->language->get('entry_postcode_required');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['amount_percentage'])) {
			$this->data['error_name'] = $this->error['amount_percentage'];
		} else {
			$this->data['error_name'] = '';
		}
		if (isset($this->error['from_price_range'])) {
			$this->data['error_price'] = $this->error['from_price_range'];
		} else {
			$this->data['error_price'] = '';
		}
                if (isset($this->error['to_price_range'])) {
			$this->data['error_policy'] = $this->error['to_price_range'];
		} else {
			$this->data['error_policy'] = '';
		}
                //Added for update validations
                if (isset($this->error['from_price_range_one'])) {
			$this->data['error_price_one'] = $this->error['from_price_range_one'];
		} else {
			$this->data['error_price_one'] = '';
		} 
                
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
if (isset($this->request->get['price_duration_id'])) {
			$url .= '&price_duration_id=' . $this->request->get['price_duration_id'];
		}
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
							
		if (!isset($this->request->get['policy_id'])) { 
			$this->data['action'] = $this->url->link('pricing/pricing/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			//$this->data['action'] = $this->url->link('pricing/pricing/update', 'token=' . $this->session->data['token'] . '&duration_policy_id=' . $this->request->get['duration_policy_id'] . $url, 'SSL');
                    $this->data['action'] = $this->url->link('pricing/pricing/update', 'token=' . $this->session->data['token'] . '&policy_id=' . $this->request->get['policy_id'] . $url, 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (isset($this->request->get['policy_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$country_info = $this->model_pricing_pricing->getPricing($this->request->get['policy_id']);
		}
              //  print_r($country_info);

		if (isset($this->request->post['amount_percentage'])) {
			$this->data['amount_percentage'] = $this->request->post['amount_percentage'];
		} elseif (!empty($country_info)) {
			$this->data['amount_percentage'] = $country_info['amount_percentage'];
		} else {
			$this->data['amount_percentage'] = '';
		}

		if (isset($this->request->post['from_price_range'])) {
			$this->data['from_price_range'] = $this->request->post['from_price_range'];
		} elseif (!empty($country_info)) {
			$this->data['from_price_range'] = $country_info['from_price_range'];
		} else {
			$this->data['from_price_range'] = '';
		}
		
		/* if (isset($this->request->post['duration_name'])) {
			$this->data['duration_name'] = $this->request->post['duration_name'];
		} elseif (!empty($country_info)) {
			$this->data['duration_name'] = $country_info['duration_name'];
		} else {
			$this->data['duration_name'] = '';
		} */

		if (isset($this->request->post['to_price_range'])) {
			$this->data['to_price_range'] = $this->request->post['to_price_range'];
		} elseif (!empty($country_info)) {
			$this->data['to_price_range'] = $country_info['to_price_range'];
		} else {
			$this->data['to_price_range'] = '';
		}
		
		
		if (isset($this->request->post['amount_percentage'])) {
			$this->data['amount_percentage'] = $this->request->post['amount_percentage'];
		} elseif (!empty($country_info)) {
			$this->data['amount_percentage'] = $country_info['amount_percentage'];
		} else {
			$this->data['amount_percentage'] = '';
		}
                
                //Added by Astha 01-Aug-2014
		if (isset($this->request->post['duration_policy_id'])) {
			$this->data['duration_policy_id'] = $this->request->post['duration_policy_id'];
		} elseif (!empty($country_info)) {
			$this->data['duration_policy_id'] = $country_info['duration_policy_id'];
		} else {
			$this->data['duration_policy_id'] = '';
		}

		/*if (isset($this->request->post['address_format'])) {
			$this->data['address_format'] = $this->request->post['address_format'];
		} elseif (!empty($country_info)) {
			$this->data['address_format'] = $country_info['address_format'];
		} else {
			$this->data['address_format'] = '';
		}

		if (isset($this->request->post['postcode_required'])) {
			$this->data['postcode_required'] = $this->request->post['postcode_required'];
		} elseif (!empty($country_info)) {
			$this->data['postcode_required'] = $country_info['postcode_required'];
		} else {
			$this->data['postcode_required'] = 0;
		}
				
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($country_info)) {
			$this->data['status'] = $country_info['status'];
		} else {
			$this->data['status'] = '1';
		}*/

		$this->template = 'pricing/pricing_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'pricing/pricing')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['amount_percentage']) < 1)) {
			$this->error['amount_percentage'] = $this->language->get('error_name');
		}
                
                if (!preg_match('/^[0-9]*$/', $this->request->post['amount_percentage'])) {
			$this->error['amount_percentage'] = $this->language->get('error_number');
		}
                 if ((utf8_strlen($this->request->post['from_price_range']) < 1)||!preg_match('/^[0-9]*$/', $this->request->post['from_price_range'])) {
			$this->error['from_price_range'] = $this->language->get('error_number');
		
                   } 
                   if ((utf8_strlen($this->request->post['to_price_range']) < 1)||!preg_match('/^[0-9]*$/', $this->request->post['to_price_range'])) {
			$this->error['to_price_range'] = $this->language->get('error_number');
		
                   }

                  if (($this->request->post['from_price_range']) >= ($this->request->post['to_price_range'])) {
			$this->error['from_price_range'] = $this->language->get('error_price');
		
                   }    

 if ($this->request->post['to_price_range']) {
    $test= $this->model_pricing_pricing->getPolicyId($this->request->post);
   
     if ($test!=Array()){
               $this->error['to_price_range'] = $this->language->get('error_policy'); 
     } 
                          }
        
   	if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
        
        protected function validateForm1() {
		if (!$this->user->hasPermission('modify', 'pricing/pricing')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['amount_percentage']) < 1)) {
			$this->error['amount_percentage'] = $this->language->get('error_name');
		}

                if (!preg_match('/^[0-9]*$/', $this->request->post['amount_percentage'])) {
			$this->error['amount_percentage'] = $this->language->get('error_number');
		}
                 if ((utf8_strlen($this->request->post['from_price_range']) < 1)||!preg_match('/^[0-9]*$/', $this->request->post['from_price_range'])) {
			$this->error['from_price_range'] = $this->language->get('error_number');
		
                   } 
                   if ((utf8_strlen($this->request->post['to_price_range']) < 1)||!preg_match('/^[0-9]*$/', $this->request->post['to_price_range'])) {
			$this->error['to_price_range'] = $this->language->get('error_number');
		
                   }
                if (($this->request->post['from_price_range']) >= ($this->request->post['to_price_range'])) {
			$this->error['from_price_range'] = $this->language->get('error_price');
		
                   } 
                    if (($this->request->post['duration_policy_id'])) {
                      $abc= $this->request->get['policy_id'];
//                      echo $abc;
//                      if (is_numeric($abc)){
//                          echo "true";
//                      } else {
//                          echo "false";
//                      }
//                      echo $abc;
//                      $abcd=filter_var($abc);
//                      echo $abcd;
                        if (is_numeric($abc)){
			$test1= $this->model_pricing_pricing->getPolicyId1($this->request->get['policy_id']);
                        $test2= $this->model_pricing_pricing->getPolicyId2(($this->request->post),($this->request->get['policy_id']));
                        $test3=  $this->model_pricing_pricing->getPolicyId3(($this->request->post),($this->request->get['policy_id']));
                        
                         if ($test1['from_price_range']==1 && ($this->request->post['from_price_range'])!=1 ) {
                            $this->error['from_price_range_one'] = $this->language->get('error_price_one'); 
                         }
                         if($test2!=Array()){
                             $this->error['to_price_range'] = $this->language->get('error_policy');
                         }
                         if($test3!=Array()){
                         $_SESSION['range']=$test3['to_price_range'] ;
                        }
                    }else {
                       // session_destroy();
                         $url='';
                     //    $this->redirect($this->url->link('pricing/pricing/update', 'token=' . $this->session->data['token'] . $url, 'SSL'));
                        return false;
                       
                     // $this->redirect($this->url->link('pricing/pricing', 'token=' . $this->session->data['token'] . $url, 'SSL'));
                    //$this->redirect("location:http://".HTTP_SERVERIP."//VillageBazaar/upload/");
                    //header("location:http://".HTTP_SERVERIP."//VillageBazaar/upload/");
                    }
                    } 
   	if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'pricing/pricing')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
				
		foreach ($this->request->post['selected'] as $duration_policy_id) {
			if ($this->config->get('config_country_id') == $duration_policy_id) {
				$this->error['warning'] = $this->language->get('error_default');
			}
			
			/*$store_total = $this->model_setting_store->getTotalStoresByCountryId($policy_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}*/
			
			/*$address_total = $this->model_sale_customer->getTotalAddressesByCountryId($policy_id);
	
			if ($address_total) {
				$this->error['warning'] = sprintf($this->language->get('error_address'), $address_total);
			}*/

			/*$affiliate_total = $this->model_sale_affiliate->getTotalAffiliatesByCountryId($policy_id);
	
			if ($affiliate_total) {
				$this->error['warning'] = sprintf($this->language->get('error_affiliate'), $affiliate_total);
			}
							
			$zone_total = $this->model_localisation_zone->getTotalZonesByCountryId($policy_id);
		
			if ($zone_total) {
				$this->error['warning'] = sprintf($this->language->get('error_zone'), $zone_total);
			}
		
			$zone_to_geo_zone_total = $this->model_localisation_geo_zone->getTotalZoneToGeoZoneByCountryId($policy_id);
		
			if ($zone_to_geo_zone_total) {
				$this->error['warning'] = sprintf($this->language->get('error_zone_to_geo_zone'), $zone_to_geo_zone_total);
			}*/
		}
	
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>