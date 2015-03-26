<?php
class ModelLocalisationcsc extends Model {
	public function addGeoZone($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "csc_detail SET name = '" . $this->db->escape($data['name']) . "', address = '" . $this->db->escape($data['address']) . "',country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "'");

		$csc_id = $this->db->getLastId();
		//,zone_id = '" . $this->db->escape($data['zone_id']) . "'
		/*if (isset($data['zone_to_geo_zone'])) {
			foreach ($data['zone_to_geo_zone'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "zone_to_geo_zone SET country_id = '"  . (int)$value['country_id'] . "', zone_id = '"  . (int)$value['zone_id'] . "', geo_zone_id = '"  .(int)$geo_zone_id . "', date_added = NOW()");
			}
		}
		
		$this->cache->delete('geo_zone');*/
	}
	
public function editGeoZone($csc_id, $data) {
            if (is_numeric($csc_id)){
              
 $qry="UPDATE " . DB_PREFIX . "csc_detail SET name = '" . $this->db->escape($data['name']) . "', address = '" . $this->db->escape($data['address']) . "', country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "' WHERE csc_id = '" . (int)$csc_id . "'";
        
 }
            else {
                session_destroy();
                header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
            }
	 $this->db->query($qry);  

		//$this->db->query("DELETE FROM " . DB_PREFIX . "zone_to_geo_zone WHERE csc_id = '" . (int)$csc_id . "'");
		
	/*	if (isset($data['zone_to_geo_zone'])) {
			foreach ($data['zone_to_geo_zone'] as $value) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "zone_to_geo_zone SET country_id = '"  . (int)$value['country_id'] . "', zone_id = '"  . (int)$value['zone_id'] . "', geo_zone_id = '"  .(int)$geo_zone_id . "', date_added = NOW()");
			}
		}*/
		
		$this->cache->delete('geo_zone');
	}
	
	public function deleteGeoZone($csc_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "csc_detail WHERE csc_id = '" . (int)$csc_id . "'");
		//$this->db->query("DELETE FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		$this->cache->delete('csc_detail');
	}
	
	public function getGeoZone($csc_id) {
             if (is_numeric($csc_id)){
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "csc_detail WHERE csc_id = '" . (int)$csc_id . "'");
             }else {
                session_destroy();
                header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
            }
		return $query->row;
	}

	public function getGeoZones($data = array()) {
		if ($data) {
			//$sql = "SELECT a.name,a.address,a.csc_id,a.zone_id, c.name AS country FROM " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "country c ON (a.country_id = c.country_id)";
			
			
			$sql = "SELECT a.name, a.address, a.csc_id,d.name as zone_id, c.name AS country, a.zone_name
FROM oc_csc_detail a, oc_country c, oc_zone d
WHERE a.country_id = c.country_id
AND a.zone_id = d.zone_id";

			//$sql = "SELECT a.name,a.address,a.csc_id,z.zone_id AS zone, c.name AS country FROM " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "country c ON (a.country_id = c.country_id) " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "zone z ON (a.zone_id = z.zone_id)";

	
			$sort_data = array(
				'a.name',
				'a.description',
				'c.name'
			);	
			
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY a.name";	
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
		} else {
			$geo_zone_data = $this->cache->get('csc_detail');

			if (!$geo_zone_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "csc_detail ORDER BY name ASC");
	
				$geo_zone_data = $query->rows;
			
				$this->cache->set('csc_detail', $geo_zone_data);
			}
			
			return $geo_zone_data;				
		}
	}
	
	public function getTotalGeoZones() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "csc_detail");
		
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
}
?>