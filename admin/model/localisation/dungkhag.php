<?php
class ModelLocalisationDungkhag extends Model {
	
	public function addDungkhag($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "dungkhag SET name = '" . $this->db->escape($data['name']) . "', zone_id = '" . (int)$data['zone_id'] . "'");	
		$this->cache->delete('dungkhag');
	}
	
	public function editDungkhag($dungkhag_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "dungkhag SET name = '" . $this->db->escape($data['name']) . "', zone_id = '" . (int)$data['zone_id'] . "' WHERE dungkhag_id = '" . (int)$dungkhag_id . "'");
		$this->cache->delete('dungkhag');
	}
	
	public function deleteDungkhag($dungkhag_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "dungkhag WHERE dungkhag_id = '" . (int)$dungkhag_id . "'");
		
		$this->cache->delete('dungkhag');
	}
	public function getDungkhag($dungkhag_id) {
		if (is_numeric($dungkhag_id)) {
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "dungkhag WHERE dungkhag_id = '" . (int)$dungkhag_id . "'");
		}else {
			session_destroy();
			header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
	
		}
		return $query->row;
	}
	public function getDungkhags($data = array()) {
		$sql = "SELECT du.dungkhag_id, dz.name, du.name AS dungkhags FROM " . DB_PREFIX . "dungkhag du LEFT JOIN " . DB_PREFIX . "zone dz ON (dz.zone_id = du.zone_id)";
		
		if (isset($data['filter_zone_id']) && !is_null($data['filter_zone_id'])) {
			if (is_numeric($data['filter_zone_id'])) {
				$sql .= " WHERE du.zone_id = '" . (int)$data['filter_zone_id'] . "'";
			} else {
				session_destroy();
				header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
			} 
		}else {
			$sql .= " WHERE du.zone_id > '0'";
		}
		
		$sort_data = array(
			'dz.name',
			'du.name'
		);
				
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY du.name";
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
	
		
	public function getDungkhagByZoneId($zone_id) {
		$dungkhag_data = $this->cache->get('dungkhag.' . (int)$zone_id);
		
		if (!$dungkhag_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "dungkhag WHERE zone_id = '" . (int)$zone_id . "' ORDER BY name");
		
			$dungkhag_data = $query->rows;
				
			$this->cache->set('dungkhag.' . (int)$zone_id, $dungkhag_data);
		}
		
		return $dungkhag_data;
	}

	public function getTotalDungkhags($data = array()) {
	
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "dungkhag");
		
		return $query->row['total'];
    }

	public function getTotalDungkhagByZoneId($zone_id) {
		
	}
	
   	public function getDungkhagName($dungkhag) {
   		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "dungkhag WHERE name = '" . $dungkhag . "'");
   		
   		return $query->row;
	}
}
?>