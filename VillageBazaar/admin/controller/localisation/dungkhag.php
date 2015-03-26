<?php 
class ControllerLocalisationDungkhag extends Controller {
	private $error = array(); 

	public function index() {
		$this->language->load('localisation/dungkhag');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('localisation/dungkhag');
		
		$this->getList();
	}
	
	protected function getList() {
		
		if (isset($this->request->get['filter_zone_id'])) {
			$filter_zone_id = $this->request->get['filter_zone_id'];
		} else {
			$filter_zone_id = null;
		}
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'du.name';
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
				'href'      => $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
		);
		
		$this->data['insert'] = $this->url->link('localisation/dungkhag/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('localisation/dungkhag/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['dungkhags'] = array();
			
		$data = array(
				'filter_zone_id' => $filter_zone_id,
				'sort'  => $sort,
				'order' => $order,
				'start' => ($page - 1) * $this->config->get('config_admin_limit'),
				'limit' => $this->config->get('config_admin_limit')
		);		
		
		$dungkhag_total = $this->model_localisation_dungkhag->getTotalDungkhags($data);
		$results = $this->model_localisation_dungkhag->getDungkhags($data);
		$this->load->model('localisation/zone');
		$this->data['dzongkhags'] = $this->model_localisation_zone->getZones();
				
		foreach ($results as $result) {
			$action = array();
				
			$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('localisation/dungkhag/update', 'token=' . $this->session->data['token'] . '&dungkhag_id=' . $result['dungkhag_id'] . $url, 'SSL')
			);
				
			$this->data['dungkhags'][] = array(
					'dungkhag_id'  => $result['dungkhag_id'],
					'zone'  => $result['name'],
					'name'  => $result['dungkhags'] . (($result['dungkhag_id'] == $this->config->get('config_dungkhag_id')) ? $this->language->get('text_default') : null),
					'selected' => isset($this->request->post['selected']) && in_array($result['dungkhag_id'], $this->request->post['selected']),
					'action'   => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_select_dzongkhag'] = $this->language->get('text_select_dzongkhag');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['column_country'] = $this->language->get('column_country');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_code'] = $this->language->get('column_code');
		
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['token'] = $this->session->data['token'];
		
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
		
		if (isset($this->request->get['filter_zone_id'])) {
			$this->data['sort_name'] = $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . '&filter_zone_id=' . $this->request->get['filter_zone_id']  . '&sort=du.name' . $url, 'SSL');
		} else {			
			$this->data['sort_name'] = $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . '&sort=du.name' . $url, 'SSL');
		}		
		$this->data['filter_zone_id'] = $filter_zone_id;
		
		$url = '';
		
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}
		
		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}		
		
		$pagination = new Pagination();
		$pagination->total = $dungkhag_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
		
		$this->data['pagination'] = $pagination->render();
		
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		
		$this->template = 'localisation/dungkhag_list.tpl';
		$this->children = array(
				'common/header',
				'common/footer'
		);		
	
		$this->response->setOutput($this->render());
	}
	
	public function insert() {
		
		$this->language->load('localisation/dungkhag');		
		$this->document->setTitle($this->language->get('heading_title'));		
		$this->load->model('localisation/dungkhag');
		
		
		if(!isset($_POST['logout']) && !isset($_POST['home'])){
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
				$this->model_localisation_dungkhag->addDungkhag($this->request->post);
		
				$this->session->data['success'] = $this->language->get('text_success');
					
				$url = '';
							
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
					
				$this->redirect($this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			
			}
		}
				
		$this->getForm();
	}
	
	public function update() {
		$this->language->load('localisation/dungkhag');
	
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('localisation/dungkhag');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_localisation_dungkhag->editDungkhag($this->request->get['dungkhag_id'], $this->request->post);
				
			$this->session->data['success'] = $this->language->get('text_success');
				
			$url = '';
				
			if (isset($this->request->get['filter_dungkhag_id'])) {
				$url .= '&filter_dungkhag_id=' . $this->request->get['filter_dungkhag_id'];
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
				
			$this->redirect($this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
		$this->getForm();
	}
	
	public function delete() {
		$this->language->load('localisation/dungkhag');
	
		$this->document->setTitle($this->language->get('heading_title'));
	
		$this->load->model('localisation/dungkhag');
	    echo "HERE IN DELETE FUNCTION!";
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $dungkhag_id) {
				$this->model_localisation_dungkhag->deleteDungkhag($dungkhag_id);
			}
	
			$this->session->data['success'] = $this->language->get('text_success');
	
			$url = '';
	
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
	
			$this->redirect($this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
		$this->getList();
	}
	
	protected function getForm() {
		
		if (isset($this->request->get['filter_zone_id'])) {
			$filter_zone_id = $this->request->get['filter_zone_id'];
		} else {
			$filter_zone_id = 384;
		}
		
		$this->data['filter_zone_id'] = $filter_zone_id;
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_select_dungkhag'] = $this->language->get('text_select_dungkhag');
		
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_name'] = $this->language->get('entry_name');	
		$this->data['entry_dungkhag'] = $this->language->get('entry_dungkhag');
		$this->data['text_select_dzongkhag'] = $this->language->get('text_select_dzongkhag');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
				
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
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
		$url = '';
		
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
				'href'      => $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL'),
				'separator' => ' :: '
		);
				
		if (!isset($this->request->get['dungkhag_id'])) {
			$this->data['action'] = $this->url->link('localisation/dungkhag/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('localisation/dungkhag/update', 'token=' . $this->session->data['token'] . '&dungkhag_id=' . $this->request->get['dungkhag_id'] . $url, 'SSL');
		}
			
		$this->data['cancel'] = $this->url->link('localisation/dungkhag', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		if (isset($this->request->get['dungkhag_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$dungkhag_info = $this->model_localisation_dungkhag->getDungkhag($this->request->get['dungkhag_id']);
		}
				
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} elseif (!empty($dungkhag_info)) {
			$this->data['name'] = $dungkhag_info['name'];
		} else {
			$this->data['name'] = '';
		}
		
		if (isset($this->request->post['dungkhag_id'])) {
			$this->data['dungkhag_id'] = $this->request->post['dungkhag_id'];
		} elseif (!empty($dungkhag_info)) {
			$this->data['dungkhag_id'] = $dungkhag_info['dungkhag_id'];
		} else {
			$this->data['dungkhag_id'] = '';
		}
		
		$this->load->model('localisation/zone');
		$this->data['dzongkhags'] = $this->model_localisation_zone->getZones();
		
		if (isset($this->error['dzongkhag'])) {
			$this->data['error_dzongkhag'] = $this->error['dzongkhag'];
		} else {
			$this->data['error_dzongkhag'] = '';
		}
		$this->template = 'localisation/dungkhag_form.tpl';
		$this->children = array(
				'common/header',
				'common/footer'
		);
		
		$this->response->setOutput($this->render());
	}
	
	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'localisation/dungkhag')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
	
		$this->load->model('localisation/dungkhag');
	
		$state_info = $this->model_localisation_dungkhag->getDungkhagName($this->request->post['name']);
	
		if($state_info != Array()){
			$this->error['name'] = $this->language->get('error_same');
		}
		if ($this->request->post['zone_id'] == '') {
			$this->error['zone'] = $this->language->get('error_zone');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'localisation/dungkhag')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
	
		foreach ($this->request->post['selected'] as $dungkhag_id) {
			if ($this->config->get('config_zone_id') == $dungkhag_id) {
				$this->error['warning'] = $this->language->get('error_default');
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