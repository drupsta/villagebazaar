<?php
class ControllerLocalisationGeoZone extends Controller { 
	private $error = array();
 
	public function index() {
		$this->language->load('localisation/geo_zone');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/geo_zone');
		
		$this->getList();
	}

	public function insert() {
				
		$this->language->load('localisation/geo_zone');
		$this->document->setTitle($this->language->get('heading_title'));		
		$this->load->model('localisation/geo_zone');
		
		if(!isset($_POST['logout']) && !isset($_POST['home'])){
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_localisation_geo_zone->addGeoZone($this->request->post);
			
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
				if (isset($this->request->get['filter_country_id'])) {
					$url .= '&filter_country_id=' . $this->request->get['filter_country_id'];
				}
                if (isset($this->request->get['filter_zone_id'])) {
					$url .= '&filter_zone_id=' . $this->request->get['filter_zone_id'];
                }
				$this->redirect($this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
        }
       
		$this->getForm();
	}

	public function update() {
		$this->language->load('localisation/geo_zone');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/geo_zone');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_geo_zone->editGeoZone($this->request->get['geo_zone_id'], $this->request->post);

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
			if (isset($this->request->get['filter_country_id'])) {
				$url .= '&filter_country_id=' . $this->request->get['filter_country_id'];
			}
                if (isset($this->request->get['filter_zone_id'])) {
				$url .= '&filter_zone_id=' . $this->request->get['filter_zone_id'];
                }
			$this->redirect($this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('localisation/geo_zone');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/geo_zone');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $geo_zone_id) {
				$this->model_localisation_geo_zone->deleteGeoZone($geo_zone_id);
			}
						
			$this->session->data['success'] = $this->language->get('text_success');
 
			$url = '';
			
                        if (isset($this->request->get['filter_country_id'])) {
				$url .= '&filter_country_id=' . $this->request->get['filter_country_id'];
			}
                        
                        if (isset($this->request->get['filter_zone_id'])) {
				$url .= '&filter_zone_id=' . $this->request->get['filter_zone_id'];
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
			
			$this->redirect($this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
	
        if (isset($this->request->get['filter_country_id'])) {
			$filter_country_id = $this->request->get['filter_country_id'];
		} else {
			$filter_country_id = 25;
		}
     
        if (isset($this->request->get['filter_zone_id'])) {
			$filter_zone_id = $this->request->get['filter_zone_id'];
		} else {
			$filter_zone_id = null;
		}
            
        if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
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
		if (isset($this->request->get['filter_country_id'])) {
				$url .= '&filter_country_id=' . $this->request->get['filter_country_id'];
			}
                if (isset($this->request->get['filter_zone_id'])) {
				$url .= '&filter_zone_id=' . $this->request->get['filter_zone_id'];
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
			'href'      => $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('localisation/geo_zone/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('localisation/geo_zone/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['geo_zones'] = array();

		$data = array(
                    'filter_country_id' => $filter_country_id,
                    'filter_zone_id' => $filter_zone_id,
					'sort'  => $sort,
					'order' => $order,
					'start' => ($page - 1) * $this->config->get('config_admin_limit'),
					'limit' => $this->config->get('config_admin_limit')
		);
		
		$geo_zone_total = $this->model_localisation_geo_zone->getTotalGeoZones($data);
		
		$results = $this->model_localisation_geo_zone->getGeoZones($data);

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('localisation/geo_zone/update', 'token=' . $this->session->data['token'] . '&geo_zone_id=' . $result['geo_zone_id'] . $url, 'SSL')
			);
					
			$this->data['geozones'][] = array(
				'geo_zone_id'      => $result['geo_zone_id'],
				'name'        => $result['name'],
				'country'     => $result['country'],
				'zone_id'     => $result['zone_id'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['geo_zone_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
	
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_description'] = $this->language->get('column_description');
		$this->data['column_country'] = $this->language->get('column_country');
		$this->data['column_zone'] = $this->language->get('column_zone');
		
		
		$this->data['column_action'] = $this->language->get('column_action');	

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 
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

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		 
		$this->data['sort_name'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . '&sort=a.name' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . '&sort=address' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . '&sort=c.name' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . '&sort=a.zone_name' . $url, 'SSL');
		$url = '';
                
        if (isset($this->request->get['filter_country_id'])) {
				$url .= '&filter_country_id=' . $this->request->get['filter_country_id'];
		}
        if (isset($this->request->get['filter_zone_id'])) {
				$url .= '&filter_zone_id=' . $this->request->get['filter_zone_id'];
		}
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $geo_zone_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

        $this->data['filter_country_id'] = $filter_country_id;
        $this->data['filter_zone_id'] = $filter_zone_id;
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
    	
      $this->data['countries'] = $this->model_localisation_geo_zone->getCountries();
      
      $this->data['zones'] = $this->model_localisation_zone->getZonesByCountryId($filter_country_id);
	
        $this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'localisation/geo_zone_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		
		if (isset($this->request->get['country_id'])) {
			$filter_country_id = $this->request->get['country_id'];
		} else {
			$filter_country_id = 25;
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_address'] = $this->language->get('entry_address');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_select_country'] = $this->language->get('text_select_country');
		$this->data['text_select_dzongkhag'] = $this->language->get('text_select_dzongkhag');
		$this->data['text_none'] = $this->language->get('text_none');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		//$this->data['button_add_csc'] = $this->language->get('button_add_csc');
		$this->data['button_remove'] = $this->language->get('button_remove');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = '';
		}
        if (isset($this->error['name1'])) {
			$this->data['error_same'] = $this->error['name1'];
		} else {
			$this->data['error_same'] = '';
		}
 		if (isset($this->error['address'])) {
			$this->data['error_address'] = $this->error['address'];
		} else {
			$this->data['error_address'] = '';
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

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
				
		if (!isset($this->request->get['geo_zone_id'])) {
			$this->data['action'] = $this->url->link('localisation/geo_zone/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('localisation/geo_zone/update', 'token=' . $this->session->data['token'] . '&geo_zone_id=' . $this->request->get['geo_zone_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('localisation/geo_zone', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['geo_zone_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$geo_zone_info = $this->model_localisation_geo_zone->getGeoZone($this->request->get['geo_zone_id']);
		}
		
		$this->data['token'] = $this->session->data['token'];
		
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($geo_zone_info)) {
			$this->data['name'] = $geo_zone_info['name'];
		} else {
			$this->data['name'] = '';
		}
	
		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];
		} elseif (!empty($geo_zone_info)) {
			$this->data['country_id'] = $geo_zone_info['country_id'];
		} else {
			$this->data['country_id'] = '';
		}		
		
		if (isset($this->request->post['zone_id'])) {
			$this->data['zone_id'] = $this->request->post['zone_id'];
		} elseif (!empty($geo_zone_info)) {
			$this->data['zone_id'] = $geo_zone_info['zone_id'];
		} else {
			$this->data['zone_id'] = '';
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
		
		$this->load->model('localisation/country');
		$this->load->model('localisation/zone');
		 
        $this->data['countries'] = $this->model_localisation_country->getCountries();
        $this->data['zones'] = $this->model_localisation_zone->getZonesByCountryId($filter_country_id);

		$this->template = 'localisation/geo_zone_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'localisation/geo_zone')){
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		$this->load->model('localisation/geo_zone');
		

                $city_info = $this->model_localisation_geo_zone->getGeoZoneName($this->request->post['name']);
                
                //print_r($city_info);
                if($city_info != Array()){
                   $this->error['name1'] = $this->language->get('error_same'); 
                }
                if ($this->request->post['country_id'] == '') {
      		$this->error['country'] = $this->language->get('error_country');
    	}
        if ($this->request->post['zone_id'] == 0) {
      		$this->error['zone'] = $this->language->get('error_zone');
    	}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'localisation/geo_zone')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		$this->load->model('localisation/tax_rate');

		foreach ($this->request->post['selected'] as $csc_id) {
			$tax_rate_total = $this->model_localisation_tax_rate->getTotalTaxRatesByGeoZoneId($csc_id);

			if ($tax_rate_total) {
				$this->error['warning'] = sprintf($this->language->get('error_tax_rate'), $tax_rate_total);
			}
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	

 public function getState() {		
		//echo "testttt";
		$output = '<option value="0">' . $this->language->get('text_all_zones') . '</option>';
		
		$this->load->model('localisation/zone');
		//$this->load->model('localisation/geo_zone');
		$results= $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']);
               // $results= $this->model_localisation_geo_zone->getStatesByCountryId($this->request->post['country_id']);
		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			if ($this->request->get['filter_zone_id'] == $result['zone_id']) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
		
		
	}
	
			
}


?>