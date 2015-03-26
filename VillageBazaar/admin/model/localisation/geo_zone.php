<?php
class ModelLocalisationGeoZone extends Model {
	public function addGeoZone($data) {
		
        $this->db->query("INSERT INTO " . DB_PREFIX . "geo_zone SET name = '" . $this->db->escape($data['name']) . "', country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "', date_added = NOW()");
		$geo_zone_id = $this->db->getLastId();
		
		$this->cache->delete('geo_zone');
	}
	
	public function editGeoZone($geo_zone_id, $data) {
		// Added by astha
        $this->db->query("UPDATE " . DB_PREFIX . "geo_zone SET name = '" . $this->db->escape($data['name']) . "', country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "', date_modified = NOW() WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		
		$this->cache->delete('geo_zone');
	}
	
	public function deleteGeoZone($geo_zone_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		$this->cache->delete('geo_zone');
	}
	
	public function getGeoZone($geo_zone_id) {
             if (is_numeric($geo_zone_id)) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "geo_zone WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");
             }else {
                    session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		
                }
		return $query->row;
	}
public function getGeoZoneName($geo_zone_name) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "geo_zone WHERE name = '" . $geo_zone_name . "'");
		
		return $query->row;
	}
        public function getGeoZones($data = array()) {
		if ($data) {
			//$sql = "SELECT a.name,a.address,a.csc_id,a.zone_id, c.name AS country FROM " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "country c ON (a.country_id = c.country_id)";
			
			
			$sql = "SELECT a.name,  a.geo_zone_id,d.name as zone_id, c.name AS country FROM oc_geo_zone a, oc_country c, oc_zone d WHERE a.country_id = c.country_id AND a.zone_id = d.zone_id";

			//$sql = "SELECT a.name,a.address,a.csc_id,z.zone_id AS zone, c.name AS country FROM " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "country c ON (a.country_id = c.country_id) " . DB_PREFIX . "csc_detail a LEFT JOIN " . DB_PREFIX . "zone z ON (a.zone_id = z.zone_id)";
if (isset($data['filter_country_id']) && !is_null($data['filter_country_id'])) {
if (is_numeric($data['filter_country_id'])) {			
    $sql .= " and a.country_id = '" . (int)$data['filter_country_id'] . "'";
		} else {
                   session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		
        } }
        else {
            $sql .= " and a.country_id = '0'";
                    }
	
                if (isset($data['filter_zone_id']) && !is_null($data['filter_zone_id'])) {
			$sql .= " and a.zone_id = '" . (int)$data['filter_zone_id'] . "'";
		} else {
			$sql .= " and a.zone_id > '0'";
		}
                
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
			//echo $sql;
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
//	public function getGeoZones($data = array()) {
//		if ($data) {
//			$sql = "SELECT * FROM " . DB_PREFIX . "geo_zone";
//	
//			$sort_data = array(
//				'name',
//				'description'
//			);	
//			
//			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
//				$sql .= " ORDER BY " . $data['sort'];	
//			} else {
//				$sql .= " ORDER BY name";	
//			}
//			
//			if (isset($data['order']) && ($data['order'] == 'DESC')) {
//				$sql .= " DESC";
//			} else {
//				$sql .= " ASC";
//			}
//			
//			if (isset($data['start']) || isset($data['limit'])) {
//				if ($data['start'] < 0) {
//					$data['start'] = 0;
//				}					
//
//				if ($data['limit'] < 1) {
//					$data['limit'] = 20;
//				}	
//			
//				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
//			}
//			
//			$query = $this->db->query($sql);
//	
//			return $query->rows;
//		} else {
//			$geo_zone_data = $this->cache->get('geo_zone');
//
//			if (!$geo_zone_data) {
//				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone ORDER BY name ASC");
//	
//				$geo_zone_data = $query->rows;
//			
//				$this->cache->set('geo_zone', $geo_zone_data);
//			}
//			
//			return $geo_zone_data;				
//		}
//	}
	
	public function getTotalGeoZones($data = array()) {
            $sql="SELECT COUNT(*) AS total FROM " . DB_PREFIX . "geo_zone";
      //	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "geo_zone");
	if (isset($data['filter_country_id']) && !is_null($data['filter_country_id'])) {
			$sql .= " where country_id = '" . (int)$data['filter_country_id'] . "'";
		} else {
			$sql .= " where country_id = '0'";
		}
	
                if (isset($data['filter_zone_id']) && !is_null($data['filter_zone_id'])) {
			$sql .= " and zone_id = '" . (int)$data['filter_zone_id'] . "'";
		} else {
			$sql .= " and zone_id > '0'";
		}
                $query=$this->db->query($sql);
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
        // Added on 14-08-2014 for Countries and states populating in drop down of cities
        public function getCountries() {
      	$query = $this->db->query("SELECT distinct (c.name) as name, c.country_id as country_id FROM oc_country c , oc_geo_zone z where z.country_id=c.country_id ORDER BY c.name ASC");
		
		return $query->rows;
	}
        
        public function getStatesByCountryId($country_id) {
      	$query = $this->db->query("SELECT distinct(g.zone_id) as zone_id, z.name as name FROM `oc_geo_zone` g, oc_zone z WHERE g.country_id=' ".(int)$country_id."' and z.country_id=g.country_id and z.zone_id=g.zone_id order by z.name ASC ");
		
		return $query->rows;
	}
        
}
?>