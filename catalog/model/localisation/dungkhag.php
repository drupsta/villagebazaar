<?php
class ModelLocalisationDungkhag extends Model {
	
	
	public function getDungkhag($dungkhag_id) {
		if (is_numeric($dungkhag_id)) {
			$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "dungkhag WHERE dungkhag_id = '" . (int)$dungkhag_id . "'");
		}else {
			session_destroy();
			header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
	
		}
		return $query->row;
	}
		
	public function getDungkhags() {
		$dungkhag_data = $this->cache->get('dungkhag.status');
		if (!$dungkhag_data) {
			$query = $this->db->query("SELECT dungkhag_id, name, zone_id FROM " . DB_PREFIX . "dungkhag   ORDER BY name ASC");
			$dungkhag_data = $query->rows;
						
			$this->cache->set('dungkhag.status', $dungkhag_data);
		}
		return $dungkhag_data;
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
}
?>