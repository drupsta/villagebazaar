<?php
class ModelCatalogManufacturer extends Model {
	public function getManufacturer($user_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "seller_to_store m2s ON (m.user_id = m2s.user_id) WHERE m.user_id  = '" . (int)$user_id . "' AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'");
		

		return $query->row;	
	}
	
	public function getManufacturers($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "seller_to_store m2s ON (m.user_id = m2s.user_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";
		
		
		$sort_data = array(
				'username',
				'sort_order'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY username";	
			}
			
			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}
			
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
		else {
			$manufacturer_data = $this->cache->get('manufacturer.' . (int)$this->config->get('config_store_id'));
		
			if (!$manufacturer_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user m LEFT JOIN " . DB_PREFIX . "seller_to_store m2s ON (m.user_id = m2s.user_id) WHERE m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY username");
				

				$manufacturer_data = $query->rows;
			
				$this->cache->set('manufacturer.' . (int)$this->config->get('config_store_id'), $manufacturer_data);
			}
		 
			return $manufacturer_data;
		}	
	} 
}
?>