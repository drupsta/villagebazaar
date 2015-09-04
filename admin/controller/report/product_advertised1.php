<?php
class ControllerReportProductAdvertised extends Controller { 
	public function index() {   
		$this->language->load('report/product_advertised');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}
		if (isset($this->request->get['filter_manufacturer_name'])) {
			$filter_manufacturer_name = $this->request->get['filter_manufacturer_name'];
		} else {
			$filter_manufacturer_name = '';
		}
		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}	
		
		
						
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
                if (isset($this->request->get['filter_manufacturer_name'])) {
			$url .= '&filter_manufacturer_name=' . $this->request->get['filter_manufacturer_name'];
		}
		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
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
			'href'      => $this->url->link('report/product_advertised', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
                //For printing report
	$this->data['print_report'] = $this->url->link('report/product_advertised/print_report', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['products'] = array();
		
		$data = array(
			'filter_date_start'	     => $filter_date_start, 
			'filter_date_end'	     => $filter_date_end, 
            'filter_manufacturer_name'=> $filter_manufacturer_name,
			'filter_order_status_id' => $filter_order_status_id,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);
				
		//$product_total = $this->model_report_product->getTotalPurchased($data);

		$results = $this->model_report_product->getProductsAdvertised($data);
		//print_r($results);
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
                'manufacturer_name'=> $result['manufacturer_name'],
				'country'=> $result['country'],
				'zone'=> $result['zone'],
				//'geo_zone'=> $result['geo_zone'],
      			'date_added'   => $result['date_added']
			);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');
		$this->data['text_all_manufacturers'] = $this->language->get('text_all_manufacturers');
		$this->data['column_name'] = $this->language->get('column_name');
        $this->data['column_manufacturer'] = $this->language->get('column_manufacturer');
		$this->data['column_country'] = $this->language->get('column_country');
		$this->data['column_zone'] = $this->language->get('column_zone');
		$this->data['column_geo_zone'] = $this->language->get('column_geo_zone');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
        $this->data['entry_manufacturer_name'] = $this->language->get('entry_manufacturer_name');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_address'] = $this->language->get('entry_address');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		

		$this->data['button_filter'] = $this->language->get('button_filter');
                // Button for download
		$this->data['button_download'] = $this->language->get('button_download');
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		$this->load->model('catalog/manufacturer');
		
        $this->data['manufacturers'] = $this->model_catalog_manufacturer->getSeller();
		$url = '';
						
		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}
		
		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
                if (isset($this->request->get['filter_manufacturer_name'])) {
			$url .= '&filter_manufacturer_name=' . $this->request->get['filter_manufacturer_name'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
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
		
		$pagination = new Pagination();
	    //$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();		
		
		$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end'] = $filter_date_end;	
        $this->data['filter_manufacturer_name'] = $filter_manufacturer_name;	
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		
		$this->template = 'report/product_advertised.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
	$this->response->setOutput($this->render());			
		
	}
	 public function getState() {		
		
		$output = '<option value="0">' . $this->language->get('text_all_zones') . '</option>';
		
		$this->load->model('localisation/zone');
		
		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']);

		foreach ($results as $result) {
			$output .= '<option value="' . $result['zone_id'] . '"';

			$output .= '>' . $result['name'] . '</option>';
		}

		$this->response->setOutput($output);
		
		
	}
	
		 public function getCity() {		
		
		$output = '<option value="0">' . $this->language->get('text_all_geo_zones') . '</option>';
		
		$this->load->model('localisation/geo_zone');
		
		$results = $this->model_localisation_geo_zone->getGeoZonesByZoneId($this->request->post['zone_id']);
		

		foreach ($results as $result) {
			$output .= '<option value= "' . $result['geo_zone_id'] . '"';

			$output .= '>' . $result['name'] . '</option>';
		}
		$this->response->setOutput($output);
	}  
}
?>