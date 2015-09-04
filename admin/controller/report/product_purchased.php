<?php
class ControllerReportProductPurchased extends Controller { 
	public function index() {   
		$this->language->load('report/product_purchased');

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
			'href'      => $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
                //For printing report
	$this->data['print_report'] = $this->url->link('report/product_purchased/print_report', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['products'] = array();
		
		$data = array(
			'filter_date_start'	     => $filter_date_start, 
			'filter_date_end'	     => $filter_date_end, 
                        'filter_manufacturer_name'   => $filter_manufacturer_name,
			'filter_order_status_id' => $filter_order_status_id,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);
				
		$product_total = $this->model_report_product->getTotalPurchased($data);

		$results = $this->model_report_product->getPurchased($data);
		
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
				'model'      => $result['model'],
                                'manufacturer_name'      => $result['manufacturer_name'],
      				'quantity'   => $result['quantity'],
				'total'      => $this->currency->format($result['total'], $this->config->get('config_currency'))
			);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');
		$this->data['text_all_manufacturers'] = $this->language->get('text_all_manufacturers');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
                $this->data['column_manufacturer'] = $this->language->get('column_manufacturer');
      		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_total'] = $this->language->get('column_total');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
                $this->data['entry_manufacturer_name'] = $this->language->get('entry_manufacturer_name');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['button_filter'] = $this->language->get('button_filter');
                // Button for download
		$this->data['button_download'] = $this->language->get('button_download');
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$this->load->model('catalog/manufacturer');
                $this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();
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
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();		
		
		$this->data['filter_date_start'] = $filter_date_start;
		$this->data['filter_date_end'] = $filter_date_end;	
                $this->data['filter_manufacturer_name'] = $filter_manufacturer_name;	
		$this->data['filter_order_status_id'] = $filter_order_status_id;
		
		$this->template = 'report/product_purchased.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
	$this->response->setOutput($this->render());			
		
	}
     public function print_report() {
		$this->language->load('report/product_purchased');

		$this->data['title'] = $this->language->get('heading_title');

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$this->data['base'] = HTTPS_SERVER;
		} else {
			$this->data['base'] = HTTP_SERVER;
		}

		$this->data['direction'] = $this->language->get('direction');
		$this->data['language'] = $this->language->get('code');

		$this->data['text_invoice'] = $this->language->get('text_invoice');

		$this->data['text_order_id'] = $this->language->get('text_order_id');
		$this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
		$this->data['text_invoice_date'] = $this->language->get('text_invoice_date');
		$this->data['text_date_added'] = $this->language->get('text_date_added');
		$this->data['text_telephone'] = $this->language->get('text_telephone');
		$this->data['text_fax'] = $this->language->get('text_fax');
		$this->data['text_to'] = $this->language->get('text_to');
		$this->data['text_company_id'] = $this->language->get('text_company_id');
		$this->data['text_tax_id'] = $this->language->get('text_tax_id');		
		$this->data['text_ship_to'] = $this->language->get('text_ship_to');
		$this->data['text_payment_method'] = $this->language->get('text_payment_method');
		$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');

		$this->data['column_name'] = $this->language->get('column_product');
		$this->data['column_manufacturer'] = $this->language->get('column_model');
		$this->data['column_model'] = $this->language->get('column_quantity');
		$this->data['column_quantity'] = $this->language->get('column_price');
		$this->data['column_total'] = $this->language->get('column_total');
		

		$this->load->model('report/product');

		$this->load->model('setting/setting');

		$this->data['products'] = array();
		$data=array();
//		$data = array(
//			'filter_date_start'	     => $filter_date_start, 
//			'filter_date_end'	     => $filter_date_end, 
//                        'filter_manufacturer_name'   => $filter_manufacturer_name,
//			'filter_order_status_id' => $filter_order_status_id,
//			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
//			'limit'                  => $this->config->get('config_admin_limit')
//		);
				
		$product_total = $this->model_report_product->getTotalPurchased($data);
//
		$results = $this->model_report_product->getPurchased($data);
//		$results = array();
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
				'model'      => $result['model'],
                                'manufacturer_name'      => $result['manufacturer_name'],
      				'quantity'   => $result['quantity'],
				'total'      => $this->currency->format($result['total'], $this->config->get('config_currency'))
			);
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_all_status'] = $this->language->get('text_all_status');
		$this->data['text_all_manufacturers'] = $this->language->get('text_all_manufacturers');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
                $this->data['column_manufacturer'] = $this->language->get('column_manufacturer');
      		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_total'] = $this->language->get('column_total');
		
		$this->data['entry_date_start'] = $this->language->get('entry_date_start');
		$this->data['entry_date_end'] = $this->language->get('entry_date_end');
                $this->data['entry_manufacturer_name'] = $this->language->get('entry_manufacturer_name');
		$this->data['entry_status'] = $this->language->get('entry_status');

		$this->data['button_filter'] = $this->language->get('button_filter');
                // Button for download
		$this->data['button_download'] = $this->language->get('button_download');
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/order_status');
		
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$this->load->model('catalog/manufacturer');
                $this->data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();
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
		
		$pagination = new Pagination();
		$pagination->total = $product_total;
	//	$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('report/product_purchased', 'token=' . $this->session->data['token'] . $url . '&page={page}');
			
		$this->data['pagination'] = $pagination->render();		
		
//		$this->data['filter_date_start'] = $filter_date_start;
//		$this->data['filter_date_end'] = $filter_date_end;	
//                $this->data['filter_manufacturer_name'] = $filter_manufacturer_name;	
//		$this->data['filter_order_status_id'] = $filter_order_status_id;
		
//		$this->template = 'report/product_purchased.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
			
		

		$this->template = 'report/print_report.tpl';   
                $this->response->setOutput($this->render());
     }
     
}
?>