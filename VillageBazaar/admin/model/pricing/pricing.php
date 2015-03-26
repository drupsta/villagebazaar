<?php
class ModelPricingPricing extends Model {
	public function addPricing($data) {
		//$this->db->query("INSERT INTO " . DB_PREFIX . "pricing_policy SET duration_policy_id = '" . $this->db->escape($data['duration_policy_id']) . "',from_price_range  = '" . $this->db->escape($data['from_price_range']) . "', to_price_range = '" . $this->db->escape($data['to_price_range']) . "', amount_percentage = '" . $this->db->escape($data['amount_percentage']) . "'");
	// Changed by Astha 01-Aug-2014 (added fields for dates)
            $this->db->query("INSERT INTO " . DB_PREFIX . "pricing_policy SET duration_policy_id = '" . $this->db->escape($data['duration_policy_id']) . "',from_price_range  = '" . $this->db->escape($data['from_price_range']) . "', to_price_range = '" . $this->db->escape($data['to_price_range']) . "', amount_percentage = '" . $this->db->escape($data['amount_percentage']) . "', date_added = NOW(), date_modified='9999-12-31', status=1");
		$this->cache->delete('pricing_policy');
	}
	
	public function editPricing($policy_id, $data) {
		//$this->db->query("UPDATE " . DB_PREFIX . "pricing_policy SET duration_policy_id = '" . $this->db->escape($data['duration_policy_id']) . "', from_price_range  = '" . $this->db->escape($data['from_price_range']) . "', to_price_range = '" . $this->db->escape($data['to_price_range']) . "', amount_percentage = '" . $this->db->escape($data['amount_percentage']) . "' WHERE policy_id = '" . (int)$policy_id . "'");
            // Changed by Astha 01-Aug-2014 (added fields for dates)    
            $this->db->query("UPDATE " . DB_PREFIX . "pricing_policy SET date_modified= NOW(), status=0 WHERE policy_id = '" . (int)$policy_id . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "pricing_policy SET duration_policy_id = '" . $this->db->escape($data['duration_policy_id']) . "',from_price_range  = '" . $this->db->escape($data['from_price_range']) . "', to_price_range = '" . $this->db->escape($data['to_price_range']) . "', amount_percentage = '" . $this->db->escape($data['amount_percentage']) . "', date_added = NOW(), date_modified='9999-12-31', status=1");
		$this->cache->delete('pricing_policy');
	}
	
	public function deletePricing($policy_id) {
		//$this->db->query("DELETE FROM " . DB_PREFIX . "pricing_policy WHERE policy_id = '" . (int)$policy_id . "'");
		$this->db->query("UPDATE " . DB_PREFIX . "pricing_policy SET date_modified= NOW(), status=0 WHERE policy_id = '" . (int)$policy_id . "'");
		$this->cache->delete('pricing_policy');
	}
	
	public function getPricing($policy_id) {
          //  $qry="SELECT DISTINCT * FROM " . DB_PREFIX . "pricing_policy WHERE policy_id = '" . (int)$policy_id . "'";
	if (is_numeric($policy_id))	{
            $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "pricing_policy WHERE policy_id = '" . (int)$policy_id . "'");
        
            return $query->row;
        }
        else {
            session_destroy();
            header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
        }
		
	}
		
        
	public function getPrices($data = array()) {
		if ($data) {
			$sql = "SELECT * FROM " . DB_PREFIX . "pricing_policy";
			
			$sort_data = array(
				'duration_policy_id',
			
			);	
			if (!empty($data['price_duration_id'])) {
			$sql .= " where duration_policy_id = '" . (int)$data['price_duration_id'] . "' and status=1 ";
		}
			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY status desc, duration_policy_id asc, from_price_range, to_price_range ";	
			}
			
			//if (isset($data['order']) && ($data['order'] == 'DESC')) {
				//$sql .= " DESC";
			//} else {
				//$sql .= " ASC";
			//}
			
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
			$country_data = $this->cache->get('pricing_policy');
		
			if (!$country_data) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "pricing_policy ORDER BY duration_policy_id ASC");
	
				$country_data = $query->rows;
			
				$this->cache->set('pricing_policy', $country_data);
			}

			return $country_data;			
		}	
	}
	
	public function getTotalPrices($data) {
      $sql=	"SELECT COUNT(*) AS total FROM " . DB_PREFIX . "pricing_policy ";
		if (!empty($data['price_duration_id'])) {
			$sql .= " where duration_policy_id = '" . (int)$data['price_duration_id'] . "' and status=1 ";
		}
                $query = $this->db->query($sql);
		return $query->row['total'];
	}
        
        public function getTotalPrices1($data) {
      $sql=	"SELECT COUNT(*) AS total FROM " . DB_PREFIX . "pricing_policy where status=1 ";
		if (!empty($data['price_duration_id'])) {
			$sql .= " and duration_policy_id = '" . (int)$data['price_duration_id'] . "'  ";
		}
                $query = $this->db->query($sql);
		return $query->row['total'];
	}
        public function getPolicyId($data) {
       $query = $this->db->query("SELECT duration_policy_id,from_price_range, to_price_range FROM " . DB_PREFIX . "pricing_policy where status=1 and duration_policy_id='" . $this->db->escape($data['duration_policy_id']) . "' and ((from_price_range between '" . $this->db->escape($data['from_price_range']) . "' and '" . $this->db->escape($data['to_price_range']) . "') or (to_price_range between '" . $this->db->escape($data['from_price_range']) . "' and '" . $this->db->escape($data['to_price_range']) . "') or ((to_price_range>= '" . $this->db->escape($data['to_price_range']) . "') and (from_price_range <='" . $this->db->escape($data['from_price_range']) . "') ))");
		
		return $query->rows;
	}
        public function getPolicyId1($policy_id) {
       $query = $this->db->query("SELECT from_price_range   FROM " . DB_PREFIX . "pricing_policy where status=1  and policy_id= $policy_id ");
		
		return $query->row;
	}
        public function getPolicyId2($data,$policy_id) {
      // $query = $this->db->query("SELECT to_price_range   FROM " . DB_PREFIX . "pricing_policy where status=1 and duration_policy_id='" . $this->db->escape($data['duration_policy_id']) . "' and policy_id != $policy_id ");
		$query = $this->db->query("SELECT policy_id   FROM " . DB_PREFIX . "pricing_policy where status=1 and duration_policy_id='" . $this->db->escape($data['duration_policy_id']) . "' and policy_id != $policy_id and  (to_price_range >='" . $this->db->escape($data['to_price_range']) . "') and (from_price_range <= '" . $this->db->escape($data['to_price_range']) . "') ");
		return $query->row;
	}
        public function getPolicyId3($data,$policy_id) {
      // $query = $this->db->query("SELECT to_price_range   FROM " . DB_PREFIX . "pricing_policy where status=1 and duration_policy_id='" . $this->db->escape($data['duration_policy_id']) . "' and policy_id != $policy_id ");
		$query = $this->db->query("SELECT to_price_range  FROM " . DB_PREFIX . "pricing_policy where status=1 and policy_id = $policy_id and  (to_price_range >'" . $this->db->escape($data['to_price_range']) . "')  ");
		return $query->row;
	}
        
        public function checkPolicyId($data) {
            $qry="SELECT * FROM  `oc_pricing_policy` WHERE    `status` =1 ";
            if (!empty($data['price_duration_id'])) {
			$qry .= " and duration_policy_id = '" . (int)$data['price_duration_id'] . "'  ";
		}
                $qry.=" ORDER BY  `duration_policy_id`, `from_price_range` ,  `to_price_range`";
            $query = $this->db->query($qry);
            return $query->rows;
            
            
          //  $query1 = $this->db->query(" SELECT COUNT(*) AS total FROM oc_pricing_policy where status=1 ");
	//	
	//	return $query1->row['total'];
           
//            $rs=mysql_query($qry);
//            while($row= mysql_fetch_array($rs))
//            {
//           $_SESSION['from_price']=$row['from_price_range'];
//                                  
//echo $qry="SELECT from_price_range,to_price_range FROM  `oc_pricing_policy` 
//WHERE  policy_id=".$row[0];
//                $rsqry=mysql_query($qry);
//                $rowqry= mysql_fetch_array($rsqry);
//                 if(($rowqry['to_price_range']+1)!=$row['from_price_range'])  
//  {
//      echo $rowqry['to_price_range']."error!!!!!!!!!!!!".$row['from_price_range']."next";
//  }
//             }
 
        }   
        
        
        
}



        
        
?>