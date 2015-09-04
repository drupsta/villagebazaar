<?php 
class ControllerProductCategory extends Controller {  
	public function index() { 
		$this->language->load('product/category');
		
		$this->load->model('catalog/category');
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
                
        $this->load->model('localisation/geo_zone'); 
                
//     
		$city_name = $this->model_localisation_geo_zone->getGeoZoneByName();   
		//echo $city_name['geo_zone_id'];
           
		if (isset($this->request->get['filter'])) {
			$filter = $this->request->get['filter'];
		} else {
			$filter = '';
		}
				
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
                      		} else {
			$sort = 'p.price';
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
							
		if (isset($this->request->get['limit'])) {
			$limit = $this->request->get['limit'];
		} else {
			$limit = $this->config->get('config_catalog_limit');
		}
		if (isset($this->request->get['location'])) {
			$location = $this->request->get['location'];
		} else {
			$location = $city_name['geo_zone_id'];
        }
        if (isset($this->request->get['product_type'])) {
			 $product_type = $this->request->get['product_type'];
		} else {
			 $product_type = '';
        }
              //  $arr = get_defined_vars();
                      
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			//'href'      => $this->url->link('common/home'),
                     'href'      => HTTP_SERVER,
       		'separator' => false
   		);	
			
		if (isset($this->request->get['path'])) {
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
                            			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
                          			}
                        if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
                        }
			$path = '';
		
			$parts = explode('_', (string)$this->request->get['path']);
		
			$category_id = (int)array_pop($parts);
		
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}
									
				$category_info = $this->model_catalog_category->getCategory($path_id);
				
				if ($category_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $category_info['name'],
					'href'      => $this->url->link('product/category', 'path=' . $path . $url),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}
		} else {
			$category_id = 0;
		}

		
		$category_info = $this->model_catalog_category->getCategory($category_id);
	
		if ($category_info) {
	  		$this->document->setTitle($category_info['name']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			
			$this->data['heading_title'] = $category_info['name'];
			
			$this->data['text_refine'] = $this->language->get('text_refine');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			$this->data['text_quantity'] = $this->language->get('text_quantity');
			$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$this->data['text_model'] = $this->language->get('text_model');
			$this->data['text_price'] = $this->language->get('text_price');
			$this->data['text_tax'] = $this->language->get('text_tax');
			$this->data['text_points'] = $this->language->get('text_points');
			$this->data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$this->data['text_display'] = $this->language->get('text_display');
			$this->data['text_list'] = $this->language->get('text_list');
			$this->data['text_grid'] = $this->language->get('text_grid');
			$this->data['text_sort'] = $this->language->get('text_sort');
			$this->data['text_limit'] = $this->language->get('text_limit');
					
			$this->data['button_cart'] = $this->language->get('button_cart');
			$this->data['button_wishlist'] = $this->language->get('button_wishlist');
			$this->data['button_compare'] = $this->language->get('button_compare');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['action'] = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url);
            $this->data['entry_location'] = $this->language->get('entry_location');
            $this->data['text_select'] = $this->language->get('text_select');
			// Set the last category breadcrumb		
			$url = '';
			if (isset($this->error['location'])) {
			$this->data['error_location'] = $this->error['location'];
		} else {
			$this->data['error_location'] = '';
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
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if (isset($this->request->get['location'])) {
      				$url .= '&location=' . $this->request->get['location'];
      			}
                        
                        if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
                        }
			$this->data['breadcrumbs'][] = array(
				'text'      => $category_info['name'],
				'href'      => $this->url->link('product/category', 'path=' . $this->request->get['path']),
				'separator' => $this->language->get('text_separator')
			);
							
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
			} else {
				$this->data['thumb'] = '';
			}
									
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
                        
			$this->data['compare'] = $this->url->link('product/compare');
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}	
						
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			
                        ///////////////////////////////////////////////////------------------------------
            if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
            }
                        
            if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
            } 
			$this->data['categories'] = array();
			
			$results = $this->model_catalog_category->getCategories($category_id);
			//print_r($results);
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);
				
				$product_total = $this->model_catalog_product->getTotalProducts($data);				
				
				$this->data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url)
				);
			}
			
			$this->data['products'] = array();
			
			$data = array(
				'filter_category_id' => $category_id,
				'filter_filter'      => $filter, 
				'sort'               => $sort,
				'order'              => $order,
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit,
                'location'           => $location,
                'product_type'       => $product_type
			);
			$product_total = $this->model_catalog_product->getTotalProducts($data); 
			
			$results = $this->model_catalog_product->getProducts($data);
			
			foreach ($results as $result) {
                         //print_r($results);
                           //  echo $result['state'];
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')),'Nu.');
				} else {
					$price = false;
				}
				
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')),'Nu.');
				} else {
					$special = false;
				}	
				
				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'],'Nu.');
				} else {
					$tax = false;
				}				
				
				if ($this->config->get('config_review_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}
                                //Added by Astha
                if ($result['selleraddress']) {
				 $selleraddress = $result['selleraddress'];
                                    //echo  $selleraddress; 
				} else {
					$selleraddress = false;
				}
				if ($result['city']) {
					$sellercity = $result['city'];
					//echo  $selleraddress;
				} else {
					$sellercity = false;
				}
				if ($result['product_type']) {
				 $product_type = $result['product_type'];
                                  //   echo  $product_type; 
				} else {
					$product_type = false;
				}
               if ($result['state']) {
				 $state = $result['state'];
      				} else {
					$state = false;
				}
                                
                if ($result['country']) {
				 $country = $result['country'];
      				} else {
					$country = false;
				}
                                
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $result['rating'],
                    'selleraddress' => $result['selleraddress'],
				    'product_type' => $result['product_type'],
					'sellercity' => $sellercity,
                    'state' => $result['state'],
                    'country'=> $result['country'],
					'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
                         }
                         if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
                         } 
                                               
			$this->data['sorts'] = array();

			
			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			); 

			$this->data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			); 
			

			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			$this->data['limits'] = array();
	
			$limits = array_unique(array($this->config->get('config_catalog_limit'), 25, 50, 75, 100));
			
			sort($limits);
	
			foreach($limits as $limits){
				$this->data['limits'][] = array(
					'text'  => $limits,
					'value' => $limits,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $limits)
				);
			}
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
                        if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
                         }
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
      			}
                        
			$this->load->model('localisation/geo_zone');
		
    // $geozones= $this->data['locations'] = $this->model_localisation_geo_zone->getGeoZones();
      		$locations=  $this->model_localisation_geo_zone->getGeoZones();
                                                                                                   
                     
		//	$this->data['location'] = array();  
                   
           foreach ($locations as $locations) {
                $this->data['locations'][] = array(
                           	'name'  => $locations['name'],
                            'value' => $locations['geo_zone_id'], 
							'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] .$url. '&location=' . $locations['geo_zone_id'] )
			 				);
                 //print_r($locations['geo_zone_id']);
                       }
                 //  $this->data['geozones'] = array();
                  //       print_r(get_defined_vars());
                       $url = '';
                        
                       
                        
                        if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
                        }
//                         if (isset($this->request->get['product_type'])) {
//				$url .= '&product_type=' . $this->request->get['product_type'];
//                                         			}                      
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
                            //   echo "In limit";
			}
                    //   $url = '';
            $product_types = $this->model_catalog_product->getProductType1();
                        
                       
        	foreach ($product_types as $product_types) {
            	$this->data['product_types'][] = array(
                              		'value' => $product_types['product_type'], 
									'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] .$url.'&product_type=' . $product_types['product_type'] )
			 					);
                       
            }
                       $url = '';
                        if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
                                         			}
                         if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
                                         			}                      
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
				
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
	
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
                            //   echo "In limit";
			}
                        
                        
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
			$this->data['location'] = $location;
            $this->data['product_type'] = $product_type;
                        $this->data['sort'] = $sort;
			$this->data['order'] = $order;
			$this->data['limit'] = $limit;
		// print_r(get_defined_vars());
			//$this->data['continue'] = $this->url->link('common/home');
                        // $this->data['continue'] = $this->url->link('module/allcategories');
                         $this->data['continue'] =HTTP_SERVER;
//print_r($location);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/category.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/category.tpl';
			} else {
				$this->template = 'default/template/product/category.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
				
			$this->response->setOutput($this->render());										
    	} else {
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
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
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
			//Added by Astha
            if (isset($this->request->get['location'])) {
				$url .= '&location=' . $this->request->get['location'];
            }
            if (isset($this->request->get['product_type'])) {
				$url .= '&product_type=' . $this->request->get['product_type'];
            }
                                                
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      	//	$this->data['continue'] = $this->url->link('common/home');
           //      $this->data['continue'] = $this->url->link('module/allcategories');
                  $this->data['continue'] =HTTP_SERVER;
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
			}
			
			$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);
					
			$this->response->setOutput($this->render());
		}
  	}
}
?>