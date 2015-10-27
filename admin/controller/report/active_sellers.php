<?php
class ControllerReportActiveSellers extends Controller { 
	public function index() {   
		$this->language->load('report/active_sellers');

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
		if (isset($this->request->get['filter_country'])) {
			$filter_country = $this->request->get['filter_country'];
		} else {
			$filter_country = '';
		}	
		
		if (isset($this->request->get['filter_zone'])) {
			$filter_zone = $this->request->get['filter_zone'];
		} else {
			$filter_zone = '';
		}	
			if (isset($this->request->get['filter_cec'])) {
			$filter_cec = $this->request->get['filter_cec'];
		} else {
			$filter_cec = '';
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
		if (isset($this->request->get['filter_country'])) {
			$url .= '&filter_country=' . $this->request->get['filter_country'];
		}
		
		if (isset($this->request->get['filter_zone'])) {
			$url .= '&filter_zone=' . $this->request->get['filter_zone'];
		}
		
		if (isset($this->request->get['filter_cec'])) {
			$url .= '&filter_cec=' . $this->request->get['filter_cec'];
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
			'href'      => $this->url->link('report/active_sellers', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
                //For printing report
	$this->data['print_report'] = $this->url->link('report/active_sellers/print_report', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['products'] = array();
		
		$data = array(
			'filter_date_start'	     => $filter_date_start, 
			'filter_date_end'	     => $filter_date_end, 
            'filter_manufacturer_name'=> $filter_manufacturer_name,
			'filter_country'		 => $filter_country,
			'filter_zone'			 => $filter_zone,
			'filter_cec'			 => $filter_cec,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);
				
		//$product_total = $this->model_report_product->getTotalPurchased($data);

		//$results = $this->model_report_product->getProductsAdvertised($data);
                $results = $this->model_report_product->getactivesellers($data);
                
		//print_r($results);
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
            
                                'count'=> $result['cnt'],
				
				'zone'=> $result['zone'],
				'cec'=> $result['cec'],
                            
	      			'date_added'   => $result['date_added'],
			//	'price'   => $result['price']
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
		$this->data['column_cec'] = $this->language->get('column_cec');
		$this->data['column_price'] = $this->language->get('column_price');
		
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
		$this->data['entry_cec'] = $this->language->get('entry_cec');
		

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
		
		if (isset($this->request->get['filter_country'])) {
			$url .= '&filter_country=' . $this->request->get['filter_country'];
		}
		
		if (isset($this->request->get['filter_zone'])) {
			$url .= '&filter_zone=' . $this->request->get['filter_zone'];
		}
		
        if (isset($this->request->get['filter_cec'])) {
			$url .= '&filter_cec=' . $this->request->get['filter_cec'];
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
		
			if (isset($this->request->post['cec'])) {
    		$this->data['cec'] = $this->request->post['cec'];
		} else {
			$this->data['cec'] = '';
		}
		
		if (isset($this->error['price_dur'])) {
			$this->data['error_cec'] = $this->error['price_dur'];
		} else {
			$this->data['error_cec'] = '';
		}
		
		$this->load->model('localisation/country');
		 
        $this->data['countries'] = $this->model_localisation_country->getCountries();
        //Added by Astha
        $this->load->model('localisation/zone');
	$this->data['states'] = $this->model_localisation_zone->getZonesByCountryId('99');	
	/////	
        
        $this->load->model('report/product');
		
		$this->data['cec_details'] = $this->model_report_product->cecDetails();
	    $this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		
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
		$this->data['filter_country'] = $filter_country;
		$this->data['filter_zone'] = $filter_zone;
		$this->data['filter_cec'] = $filter_cec;
		
		$this->template = 'report/active_sellers.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
	$this->response->setOutput($this->render());			
		
	}
//	 public function getState() {		
//	 
//		
//		$output = '<option value="0">' . $this->language->get('text_all_zones') . '</option>';
//		
//		$this->load->model('localisation/zone');
//		
//		$results = $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']);
//	$this->data['states'] = $this->model_localisation_zone->getZonesByCountryId($this->request->post['country_id']);
//		foreach ($results as $result)
//		{
//			$output .= '<option value="' . $result['zone_id'] . '"';
//
//			$output .= '>' . $result['name'] . '</option>';
//		}
//
//		$this->response->setOutput($output);
//		
//		
//	}
	
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