<?php
class ModelReportProduct extends Model {
	public function getProductsViewed($data = array()) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 ORDER BY p.viewed DESC";
					
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}	
	
	public function getTotalProductsViewed() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE viewed > 0");
		
		return $query->row['total'];
	}
	
	public function getTotalProductViews() {
      	$query = $this->db->query("SELECT SUM(viewed) AS total FROM " . DB_PREFIX . "product");
		
		return $query->row['total'];
	}
			
	public function reset() {
		$this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = '0'");
	}
	
	public function getPurchased($data = array()) {
		$sql = "SELECT tmp.name, tmp.model, tmp.manufacturer_name, tmp.quantity, tmp.total FROM (SELECT op.name, op.model, om.name AS manufacturer_name, SUM(op.quantity) AS quantity, SUM(op.total + op.total * op.tax / 100) AS total FROM " . DB_PREFIX . "product oc, " . DB_PREFIX . "manufacturer om , " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";
		
		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		if (!empty($data['filter_manufacturer_name'])) {
			$sql .= " AND om.manufacturer_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		}
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
                $sql.= " AND (op.product_id = oc.product_id) and (oc.manufacturer_id = om.manufacturer_id)";
		
		$sql .= " GROUP BY op.model ORDER BY total DESC ) tmp";
					
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	
	public function getTotalPurchased($data) {
      	$sql = "SELECT COUNT(DISTINCT op.model) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id)";

		if (!empty($data['filter_order_status_id'])) {
			$sql .= " WHERE o.order_status_id = '" . (int)$data['filter_order_status_id'] . "'";
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		
		$query = $this->db->query($sql);
				
		return $query->row['total'];
	}
	
public function getProductsAdvertised($data = array()) {
		$sql = "SELECT pd.name, u.username as manufacturer_name, c.name as country, z.name as zone, ce.name as cec, DATE(p.date_added) as date_added, price from " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd, " . DB_PREFIX . "user u, " . DB_PREFIX . "country c, " . DB_PREFIX . "zone z, " . DB_PREFIX . "csc_detail ce where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id and z.zone_id=u.zone_id and c.country_id=u.country_id and p.status=1 and ce.csc_id=u.csc_id";
		
		
		if (!empty($data['filter_manufacturer_name'])) {
                    if(is_numeric($data['filter_manufacturer_name'])){
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		} else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
                if (!empty($data['filter_country'])) {
			$sql .= " AND c.country_id = '" . $this->db->escape($data['filter_country']) . "'";
		}
                
//                if (!empty($data['filter_zone'])) {
//			$sql .= " AND z.zone_id = '" . $this->db->escape($data['filter_zone']) . "'";
//		}
//		
//		 if (!empty($data['filter_cec'])) {
//			$sql .= " AND ce.csc_id = '" . $this->db->escape($data['filter_cec']) . "'";
//		}
//		
                if (!empty($data['filter_zone'])) {
             if(is_numeric($data['filter_zone'])){
			$sql .= " AND z.zone_id = '" . $this->db->escape($data['filter_zone']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		
                } }
                 if (!empty($data['filter_cec'])) {
                     if(is_numeric($data['filter_cec'])){
			$sql .= " AND ce.csc_id = '" . $this->db->escape($data['filter_cec']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
              //  $sql.= " AND (op.product_id = oc.product_id) and (oc.manufacturer_id = om.manufacturer_id)";
		
		//$sql .= " GROUP BY op.model ORDER BY total DESC ) tmp";
		$sql .= "  ORDER BY DATE(p.date_added) DESC ";
                
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
        
        public function cecDetails() {
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "csc_detail ");
	
			return $query->rows;
		
	}
        
        // Expired products
public function getProductsExpiry($data = array()) {
		$sql = "SELECT pd.name, u.username as manufacturer_name, DATE(p.date_added) as date_added, DATE(p.date_expiry) as date_expiry, price from " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd, " . DB_PREFIX . "user u where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id and p.status=1 and date_expiry>=NOW() ";
		
		
		if (!empty($data['filter_manufacturer_name'])) {
                    if(is_numeric($data['filter_manufacturer_name'])){
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
                
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
               	if (!empty($data['filter_week'])) {
			$sql .= " AND date_expiry <= (NOW() + INTERVAL '" . (int)$data['filter_week'] . "' WEEK )";
		}	
	  
              //  $sql.= " AND (op.product_id = oc.product_id) and (oc.manufacturer_id = om.manufacturer_id)";
		
		//$sql .= " GROUP BY op.model ORDER BY total DESC ) tmp";
		$sql .= "  ORDER BY date_expiry ASC ";
                
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		//echo $sql;
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
        
        // Active sellers
        
public function getactivesellers($data) {
      	$sql = "select username as name, count(*) as cnt,z.name as zone, ce.name as cec, DATE(p.date_added) as date_added from " . DB_PREFIX . "user u, " . DB_PREFIX . "zone z, " . DB_PREFIX . "product p, " . DB_PREFIX . "csc_detail ce where p.user_id=u.user_id and z.zone_id=u.zone_id and ce.csc_id=u.csc_id ";

		if (!empty($data['filter_manufacturer_name'])) {
                    if(is_numeric($data['filter_manufacturer_name'])){
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		} else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
                if (!empty($data['filter_country'])) {
			$sql .= " AND c.country_id = '" . $this->db->escape($data['filter_country']) . "'";
		}
                
//        if (!empty($data['filter_zone'])) {
//			$sql .= " AND z.zone_id = '" . $this->db->escape($data['filter_zone']) . "'";
//		}
//                 if (!empty($data['filter_cec'])) {
//			$sql .= " AND ce.csc_id = '" . $this->db->escape($data['filter_cec']) . "'";
//		}
                
                
         if (!empty($data['filter_zone'])) {
             if(is_numeric($data['filter_zone'])){
			$sql .= " AND z.zone_id = '" . $this->db->escape($data['filter_zone']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
                 if (!empty($data['filter_cec'])) {
                     if(is_numeric($data['filter_cec'])){
			$sql .= " AND ce.csc_id = '" . $this->db->escape($data['filter_cec']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
		 $sql .= "group by p.user_id order by cnt desc";
		$query = $this->db->query($sql);
				
		return $query->rows;
	}
        
         public function getproductscategories($data) {
      	$sql = "select name, price, date(date_added) as date_added from oc_product p, oc_product_description pd, oc_product_to_category pc where p.product_id=pd.product_id and pc.product_id=pd.product_id ";

		if (!empty($data['product_category'])) {
                    if(is_numeric($data['product_category'])){
			$sql .= " AND pc.category_id = '" . (int)$data['product_category'] . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }

		$query = $this->db->query($sql);
				
		return $query->rows;
	}
        
public function getusersprofile($data) {
      	$sql = "select u.username as name, CONCAT(c.firstname, ' ', c.lastname) AS fullname, c.email as email,c.telephone as mobile, ug.name as usergroup, z.name as zone, ce.name as cec, DATE(u.date_added) as date_added from ". DB_PREFIX ."user u, ". DB_PREFIX ."user_group ug, ". DB_PREFIX ."customer c, ". DB_PREFIX ."zone z,  ". DB_PREFIX ."csc_detail ce where c.username=u.username and z.zone_id=u.zone_id and ce.csc_id=u.csc_id and ug.user_group_id=u.user_group_id ";

		if (!empty($data['filter_manufacturer_name'])) {
                    if(is_numeric($data['filter_manufacturer_name'])){
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		} else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
//		if (!empty($data['filter_date_start'])) {
//			$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
//		}
//
//		if (!empty($data['filter_date_end'])) {
//			$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
//		}
                if (!empty($data['filter_country'])) {
			$sql .= " AND c.country_id = '" . $this->db->escape($data['filter_country']) . "'";
		}
                
        if (!empty($data['filter_zone'])) {
             if(is_numeric($data['filter_zone'])){
			$sql .= " AND z.zone_id = '" . $this->db->escape($data['filter_zone']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
                 if (!empty($data['filter_cec'])) {
                     if(is_numeric($data['filter_cec'])){
			$sql .= " AND ce.csc_id = '" . $this->db->escape($data['filter_cec']) . "'";
		}else {
                  session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		  
                } }
		// $sql .= "group by p.user_id order by cnt desc";
		$query = $this->db->query($sql);
				
		return $query->rows;
	}
	public function getViewedProducts()
	{
		$sql= "SELECT pd.name as name, p.model, p.viewed as viewed FROM ".DB_PREFIX ."product p LEFT JOIN ". DB_PREFIX ."product_description pd ON (p.product_id = pd.product_id) WHERE  p.viewed > 0 ORDER BY p.viewed DESC";
		$query = $this->db->query($sql);
		
		return $query->rows;
	} 
	public function getProducts()
	{
		$sql= "SELECT name, price, date(date_added) AS date_added FROM ". DB_PREFIX ."product p, ". DB_PREFIX ."product_description pd, ". DB_PREFIX ."product_to_category pc where p.product_id=pd.product_id and pc.product_id=pd.product_id";
		$query = $this->db->query($sql);
	
		return $query->rows;
	}
	public function getRecentProducts()
	{
		$sql = "SELECT pd.name as name, u.username as manufacturer_name, c.name as country, z.name as zone, ce.name as cec, DATE(p.date_added) as date_added, price from oc_product p, oc_product_description pd, oc_user u, oc_country c, oc_zone z, oc_csc_detail ce where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id and z.zone_id=u.zone_id and c.country_id=u.country_id and ce.csc_id=u.csc_id";
		
		$sql .= "  ORDER BY DATE(p.date_added) DESC ";
		
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
	
	public function getNearExpiryProducts()
	{
		$sql= "SELECT pd.name as name, u.username as manufacturer_name, DATE(p.date_added) as date_added, DATE(p.date_expiry) as date_expiry, price from oc_product p, oc_product_description pd, oc_user u where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id";
		$query = $this->db->query($sql);
		
		return $query->rows;
	}
}
?>