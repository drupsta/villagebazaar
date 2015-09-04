<?php
class Controllerreportproductexpiry extends Controller { 
	public function index() {   
		$this->language->load('report/product_expiry');

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
                if (isset($this->request->get['filter_week'])) {
			$filter_week = $this->request->get['filter_week'];
		} else {
			$filter_week = '';
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
		if (isset($this->request->get['filter_week'])) {
			$url .= '&filter_week=' . $this->request->get['filter_week'];
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
			'href'      => $this->url->link('report/product_expiry', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$this->load->model('report/product');
                //For printing report
		$this->data['print_report'] = $this->url->link('report/product_expiry/print_report', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['createpdf'] = $this->url->link('report/product_expiry/createPDF', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['products'] = array();
		
		$data = array(
			'filter_date_start'	     => $filter_date_start, 
			'filter_date_end'	     => $filter_date_end, 
                        'filter_manufacturer_name'=> $filter_manufacturer_name,
                        'filter_week'             => $filter_week,
			'filter_country'		 => $filter_country,
			'filter_zone'			 => $filter_zone,
			'filter_cec'			 => $filter_cec,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);
				
		//$product_total = $this->model_report_product->getTotalPurchased($data);

		$results = $this->model_report_product->getProductsExpiry($data);
		//print_r($results);
		foreach ($results as $result) {
			$this->data['products'][] = array(
				'name'       => $result['name'],
                'manufacturer_name'=> $result['manufacturer_name'],
				
	      			'date_added'   => $result['date_added'],
				'date_expiry'   => $result['date_expiry'],
				'price'   => $result['price']
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
		$this->data['column_date_expiry'] = $this->language->get('column_date_expiry');
		
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
		if (isset($this->request->get['filter_week'])) {
			$url .= '&filter_week=' . $this->request->get['filter_week'];
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
        $this->data['filter_week'] = $filter_week;
		$this->data['filter_country'] = $filter_country;
		$this->data['filter_zone'] = $filter_zone;
		$this->data['filter_cec'] = $filter_cec;
		
		$this->template = 'report/product_expiry.tpl';
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

	public function createPDF()
	{
		$this->load->helper('tcpdf/config/tcpdf_config');
		$this->load->helper('tcpdf/tcpdf');
	
	
		// create new PDF document
	
		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
		$author = $this->config->get('pdf_catalog_author');
		$title = $this->config->get('pdf_catalog_title');
		$subject = $this->config->get('pdf_catalog_subject');
		$keywords = $this->config->get('pdf_catalog_description');
	
		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor($author);
		$pdf->SetTitle($title);
		$pdf->SetSubject($subject);
		$pdf->SetKeywords($keywords);
	
		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
		// set default monospaced font
		$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
	
		// set margins
		$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
		$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
		$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	
		// set auto page breaks
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	
		// set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
	
		// set some language-dependent strings (optional)
		if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
			require_once(dirname(__FILE__).'/lang/eng.php');
			$pdf->setLanguageArray($l);
		}
	
		// ---------------------------------------------------------
	
		// set font
		$pdf->SetFont('helvetica', 'B', 20);
	
		// add a page
		$pdf->AddPage();
	
		$pdf->Write(0, 'Product Expiry Date Report', '', 0, 'C', true, 0, false, false, 0);
		//$pdf->TextField('date', 120, 10, array(), array('v'=>date('Y-m-d'), 'dv'=>date('Y-m-d')));
		//$pdf->Write(0, '', '', 0, 'L', true, 0, false, false, 0);
	
	
		$pdf->SetFont('helvetica', '', 10);
	
		$pdf->Cell(35, 5, 'Reported on date:');
		$pdf->TextField('date', 30, 10, array(), array('v'=>date('d-m-Y'), 'dv'=>date('d-m-Y')));
		$pdf->Ln(10);
	
	
		$pdf->Write(0, '', '', 0, 'L', true, 0, false, false, 0);
		$tbl_header = '<table border="1">';
		$tbl_footer = '</table>';
		$tbl ='<tr><td align="center">Product Name</td><td  align="center">Seller Name</td><td  align="center">Date Added</td><td  align="center">Expiry Date</td></tr>';
	
		//var_dump($product_category);
		$this->load->model('report/product');
		$results = $this->model_report_product->getNearExpiryProducts();
	
		foreach($results as $row){
			$product=$row['name'];
    		$manufacturer=$row['manufacturer_name'];
    		$date_added=$row['date_added'];
  		 // $cec=$row['cec'];
   			$date=$row['date_expiry'];
    
    		$tbl .= '<tr><td align="center">'.$product.'</td><td align="center">'.$manufacturer.'</td><td align="center">'.$date_added.'</td><td align="center">'.$date.'</td></tr>';
		}
	
		$pdf->writeHTML($tbl_header . $tbl . $tbl_footer, true, false, false, false, '');
		// NON-BREAKING ROWS (nobr="true")
	
		$pdf->lastPage();
		$pdf->Output('SalesReport.pdf', 'I');
	
		/*
		 * To change this template, choose Tools | Templates
		 * and open the template in the editor.
		*/
	
	}
}
?>