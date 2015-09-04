<?php
class ModelLocalisationZone extends Model {
	public function addZone($data) {
		//$this->db->query("INSERT INTO " . DB_PREFIX . "zone SET status = '" . (int)$data['status'] . "', name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', country_id = '" . (int)$data['country_id'] . "'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "zone SET status = '1', name = '" . $this->db->escape($data['name']) . "', country_id = '" . (int)$data['country_id'] . "'");	
		$this->cache->delete('zone');
	}
	
	public function editZone($zone_id, $data) {
		//$this->db->query("UPDATE " . DB_PREFIX . "zone SET status = '" . (int)$data['status'] . "', name = '" . $this->db->escape($data['name']) . "', code = '" . $this->db->escape($data['code']) . "', country_id = '" . (int)$data['country_id'] . "' WHERE zone_id = '" . (int)$zone_id . "'");
                $this->db->query("UPDATE " . DB_PREFIX . "zone SET name = '" . $this->db->escape($data['name']) . "', country_id = '" . (int)$data['country_id'] . "' WHERE zone_id = '" . (int)$zone_id . "'");
		$this->cache->delete('zone');
	}
	
	public function deleteZone($zone_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "'");

		$this->cache->delete('zone');	
	}
	
	public function getZone($zone_id) {
		 if (is_numeric($zone_id)) {
            $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "'");
                 }else {
                    session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		
                }
		return $query->row;
	}
	
	public function getZones($data = array()) {
		$sql = "SELECT *, z.name, c.name AS country FROM " . DB_PREFIX . "zone z LEFT JOIN " . DB_PREFIX . "country c ON (z.country_id = c.country_id)";
		
        if (isset($data['filter_country_id']) && !is_null($data['filter_country_id'])) {
            if (is_numeric($data['filter_country_id'])) {
				$sql .= " WHERE z.country_id = '" . (int)$data['filter_country_id'] . "'";
			} else {
                session_destroy();
            	header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		    } 
        }else {
			$sql .= " WHERE z.country_id > '0'";
		}
                
		$sort_data = array(
			'c.name',
			'z.name',
			'z.code'
		);	
			
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.name";	
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


public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);
	
		if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");
	
			$zone_data = $query->rows;
			
			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}
	
		return $zone_data;
	}

	public function getTotalZones($data = array()) {
		if (isset($data['filter_country_id']) && !is_null($data['filter_country_id'])) {
	      	$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "zone`";
			$sql .= " WHERE country_id = '" . (int)$data['filter_country_id'] . "'";
			$query = $this->db->query($sql);
		} else {
	      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "zone");
		}
        return $query->row['total'];
    }

				
	public function getTotalZonesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "'");
	
		return $query->row['total'];
	}
    
    public function getZoneName($zone) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "zone WHERE name = '" . $zone . "'");		
		
		return $query->row;
	}
}
?>