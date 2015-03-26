<?php
class ControllerLocalisationcsc extends Controller { 
	private $error = array();
 
	public function index() {
		$this->language->load('localisation/csc');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/csc');
		
		$this->getList();
	}

	public function insert() {
		$this->language->load('localisation/csc');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/csc');
		if(!isset($_POST['logout']) && !isset($_POST['home'])){
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_csc->addGeoZone($this->request->post);
			
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
			
			$this->redirect($this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
                }
		$this->getForm();
	}

	public function update() {
		$this->language->load('localisation/csc');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/csc');
		if(!isset($_POST['logout']) && !isset($_POST['home'])){
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_csc->editGeoZone($this->request->get['csc_id'], $this->request->post);

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
			
			$this->redirect($this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
                }
		$this->getForm();
	}

	public function delete() {
		$this->language->load('localisation/csc');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/csc');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $csc_id) {
				$this->model_localisation_csc->deleteGeoZone($csc_id);
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
			
			$this->redirect($this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
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
			'href'      => $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['insert'] = $this->url->link('localisation/csc/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('localisation/csc/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['cscs'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$csc_total = $this->model_localisation_csc->getTotalGeoZones();
		
		$results = $this->model_localisation_csc->getGeoZones($data);

		foreach ($results as $result) {
			$action = array();
			
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('localisation/csc/update', 'token=' . $this->session->data['token'] . '&csc_id=' . $result['csc_id'] . $url, 'SSL')
			);
					
			$this->data['cscs'][] = array(
				'csc_id'      => $result['csc_id'],
				'name'        => $result['name'],
				'address'     => $result['address'],
				'country'     => $result['country'],
				'zone_id'     => $result['zone_id'],
				'zone_name'     => $result['zone_name'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['csc_id'], $this->request->post['selected']),
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
		 
		$this->data['sort_name'] = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . '&sort=a.name' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . '&sort=address' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . '&sort=c.name' . $url, 'SSL');
		$this->data['sort_description'] = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . '&sort=a.zone_name' . $url, 'SSL');
		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
												
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $csc_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'localisation/csc_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_address'] = $this->language->get('entry_address');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_csc'] = $this->language->get('button_add_csc');
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
			'href'      => $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
				
		if (!isset($this->request->get['csc_id'])) {
			$this->data['action'] = $this->url->link('localisation/csc/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('localisation/csc/update', 'token=' . $this->session->data['token'] . '&csc_id=' . $this->request->get['csc_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('localisation/csc', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['csc_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$csc_info = $this->model_localisation_csc->getGeoZone($this->request->get['csc_id']);
		}
		
		$this->data['token'] = $this->session->data['token'];
		
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($csc_info)) {
			$this->data['name'] = $csc_info['name'];
		} else {
			$this->data['name'] = '';
		}

		if (isset($this->request->post['address'])) {
			$this->data['address'] = $this->request->post['address'];
		} elseif (!empty($csc_info)) {
			$this->data['address'] = $csc_info['address'];
		} else {
			$this->data['address'] = '';
		}
		
		
		if (isset($this->request->post['country_id'])) {
			$this->data['country_id'] = $this->request->post['country_id'];
		} elseif (!empty($csc_info)) {
			$this->data['country_id'] = $csc_info['country_id'];
		} else {
			$this->data['country_id'] = '';
		}
		
		
		
		
		if (isset($this->request->post['zone_id'])) {
			$this->data['zone_id'] = $this->request->post['zone_id'];
		} elseif (!empty($csc_info)) {
			$this->data['zone_id'] = $csc_info['zone_id'];
		} else {
			$this->data['zone_id'] = '';
		}
		
		
			
		if (isset($this->request->post['zone_name'])) {
			$this->data['zone_name'] = $this->request->post['zone_name'];
		} elseif (!empty($csc_info)) {
			$this->data['zone_name'] = $csc_info['zone_name'];
		} else {
			$this->data['zone_name'] = '';
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
		 
        $this->data['countries'] = $this->model_localisation_country->getCountries();

//		if (isset($this->request->post['zone_to_geo_zone'])) {
//			$this->data['zone_to_geo_zones'] = $this->request->post['zone_to_geo_zone'];
//		} elseif (isset($this->request->get['geo_zone_id'])) {
//			$this->data['zone_to_geo_zones'] = $this->model_localisation_csc->getZoneToGeoZones($this->request->get['geo_zone_id']);
//		} else {
//			$this->data['zone_to_geo_zones'] = array();
//		}

		$this->template = 'localisation/csc.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'localisation/csc')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['address']) < 3) || (utf8_strlen($this->request->post['address']) > 255)) {
			$this->error['description'] = $this->language->get('error_description');
		}
		
		$this->load->model('localisation/country');
		
		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);
			if ($this->request->post['country_id'] == '') {
      		$this->error['country'] = $this->language->get('error_country');
    	}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'localisation/csc')) {
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
	
	/*public function zone() {
		$output = '<option value="0">' . $this->language->get('text_all_zones') . '</option>';
		
		$this->load->model('localisation/zones');
		
		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			if ($this->request->get['zone_id'] == $result['zone_id']) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
	} 		*/

 public function getState() {		
		//echo "testttt";
		$output = '<option value="0">' . $this->language->get('text_all_zones') . '</option>';
		
		$this->load->model('localisation/zone');
		
		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			if ($this->request->get['zone_id'] == $result['zone_id']) {
				$output .= ' selected="selected"';
			}

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
		
		
	}
} 
?>