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
		$sql = "SELECT pd.name, u.username as manufacturer_name, c.name as country, z.name as zone , DATE(p.date_added) as date_added, price  from " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd, " . DB_PREFIX . "user u, " . DB_PREFIX . "country c, " . DB_PREFIX . "zone z where user_group_id = 11 and p.product_id = pd.product_id and p.user_id=u.user_id and z.zone_id=u.zone_id and c.country_id=u.country_id";
		
		
		if (!empty($data['filter_manufacturer_name'])) {
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		}
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		
        if (!empty($data['filter_country'])) {
			$sql .= " AND c.country_id = '" . $this->db->escape($data['filter_country']) . "'";
		}
		
		 if (!empty($data['filter_zone'])) {
			$sql .= " AND z.name = '" . $this->db->escape($data['filter_zone']) . "'";
		}
		
		 if (!empty($data['filter_cec'])) {
			$sql .= " AND ce.cec_id = '" . $this->db->escape($data['filter_cec']) . "'";
		}

              //  $sql.= " AND (op.product_id = oc.product_id) and (oc.manufacturer_id = om.manufacturer_id)";
		// added by devendra
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
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cec_detail ");
	
			return $query->rows;
		
	}
}
?>