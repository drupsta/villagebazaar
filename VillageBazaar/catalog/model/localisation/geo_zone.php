<?php
class ModelLocalisationGeoZone extends Model {
			
	public function getGeoZone($geo_zone_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		
		return $query->row;
	}

	public function getGeoZones($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "geo_zone where country_id=99 ";
	
			$sort_data = array(
				'name',
				'description'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY name";	
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
			echo $sql;
			$query = $this->db->query($sql);
	
			return $query->rows;
		} else {
			$geo_zone_data = $this->cache->get('geo_zone');

			if (!$geo_zone_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone where country_id=99 ORDER BY name ASC");
	
				$geo_zone_data = $query->rows;
			
				$this->cache->set('geo_zone', $geo_zone_data);
			}
			
			return $geo_zone_data;				
		}
	}
	
	public function getTotalGeoZones() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "geo_zone");
		
		return $query->row['total'];
	}	
	
	public function getZoneToGeoZones($geo_zone_id) {	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		
		return $query->rows;	
	}		

	public function getTotalZoneToGeoZoneByGeoZoneId($geo_zone_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		
		return $query->row['total'];
	}
	
	public function getTotalZoneToGeoZoneByCountryId($country_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "zone_to_geo_zone WHERE country_id = '" . (int)$country_id . "'");
		
		return $query->row['total'];
	}	
	
	public function getTotalZoneToGeoZoneByZoneId($zone_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "zone_to_geo_zone WHERE zone_id = '" . (int)$zone_id . "'");
		
		return $query->row['total'];
	}
        public function getGeoZoneByName() {
      	$query = $this->db->query("SELECT geo_zone_id FROM " . DB_PREFIX . "geo_zone WHERE name='Kolkata'");
		
		return $query->row;
	}
        
      public function getGeoZonesByZoneId($zone_id) {
	//	$zone_data = $this->cache->get('zone.' . (int)$country_id);
	
	//	if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone WHERE zone_id = '" . (int)$zone_id . "' ORDER BY name");
	
			$geozone_data = $query->rows;
			
	//		$this->cache->set('zone.' . (int)$country_id, $zone_data);
	//	}
	
		return $geozone_data;
	}  
}
?>