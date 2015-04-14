<?php
class ModelAccountAddress extends Model {
	public function addAddress($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$this->customer->getId() . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', company_id = '" . $this->db->escape(isset($data['company_id']) ? $data['company_id'] : '') . "', tax_id = '" . $this->db->escape(isset($data['tax_id']) ? $data['tax_id'] : '') . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', city = '" . $this->db->escape($data['city']) . "', zone_id = '" . (int)$data['zone_id'] . "', country_id = '" . (int)$data['country_id'] . "'");
		
		$address_id = $this->db->getLastId();
		
		if (!empty($data['default'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}
		
		return $address_id;
	}
	
	public function editAddress($address_id, $data) {
		//$this->db->query("UPDATE " . DB_PREFIX . "address SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', company = '" . $this->db->escape($data['company']) . "', company_id = '" . $this->db->escape(isset($data['company_id']) ? $data['company_id'] : '') . "', tax_id = '" . $this->db->escape(isset($data['tax_id']) ? $data['tax_id'] : '') . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', city = '" . $this->db->escape($data['city']) . "', zone_id = '" . (int)$data['zone_id'] . "', country_id = '" . (int)$data['country_id'] . "' WHERE address_id  = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
        $this->db->query("UPDATE " . DB_PREFIX . "address SET firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', address_1 = '" . $this->db->escape($data['address_1']) . "',address_2 = '" . $this->db->escape($data['address_2']) . "', postoffice = '" . $this->db->escape($data['postoffice']) . "', city = '" . $this->db->escape($data['city']) . "',geog='".$this->db->escape($data['geog']). "', csc_id = '" . $this->db->escape($data['csc_id']) . "', zone_id = '" . (int)$data['zone_id'] . "', dungkhag_id='".(int)$data['dungkhag_id']."',country_id = '" . (int)$data['country_id'] . "' WHERE address_id  = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
        $this->db->query("UPDATE " . DB_PREFIX . "customer SET firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	 	$this->db->query("UPDATE " . DB_PREFIX . "user SET firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', address_1 = '" . $this->db->escape($data['address_1']) . "',postoffice = '" . $this->db->escape($data['postoffice']) . "', csc_id = '" . $this->db->escape($data['csc_id']) . "', city = '" . $this->db->escape($data['city']) . "', zone_id = '" . (int)$data['zone_id'] . "', country_id = '" . (int)$data['country_id'] . "' WHERE username = '".$this->customer->getUserName()."'");
//		if (!empty($data['default'])) {
//			$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
//		}
	}
	
	public function deleteAddress($address_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
	}	
	
	public function getAddress($address_id) {
		$address_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "address WHERE address_id = '" . (int)$address_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
		
		if ($address_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");
			
			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';	
				$address_format = '';
			}
			
			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}	

			$dungkhag_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "dungkhag` WHERE dungkhag_id = '" . (int)$address_query->row['dungkhag_id'] . "'");
				
			if ($dungkhag_query->num_rows) {
				$dungkhag = $dungkhag_query->row['name'];
				$dungkhag_code = $dungkhag_query->row['code'];
			} else {
				$dungkhag = '';
				$dungkhag_code = '';
			}
          
			$address_data = array(
				'firstname'      => $address_query->row['firstname'],
				'lastname'       => $address_query->row['lastname'],
				'company'        => $address_query->row['company'],
				'company_id'     => $address_query->row['company_id'],
				'tax_id'         => $address_query->row['tax_id'],
				'address_1'      => $address_query->row['address_1'],
				'address_2'      => $address_query->row['address_2'],
				'postcode'       => $address_query->row['postcode'],
				'city'           => $address_query->row['city'],
                'postoffice'     => $address_query->row['postoffice'],
                'csc_id'         => $address_query->row['csc_id'],
				'zone_id'        => $address_query->row['zone_id'],
				'dungkhag_id'    => $address_query->row['dungkhag_id'],
				'geog'        	 => $address_query->row['geog'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'dungkhag'		=> $dungkhag,
				'country_id'     => $address_query->row['country_id'],
				'country'        => $country,	
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
			);
			
			return $address_data;
		} else {
			return false;	
		}
	}
	
	public function getAddresses() {
		$address_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	
		foreach ($query->rows as $result) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$result['country_id'] . "'");
			
			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';	
				$address_format = '';
			}
			
			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$result['zone_id'] . "'");
			
			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}		
		
			$address_data[$result['address_id']] = array(
				'address_id'     => $result['address_id'],
				'firstname'      => $result['firstname'],
				'lastname'       => $result['lastname'],
				'company'        => $result['company'],
				'company_id'     => $result['company_id'],
				'tax_id'         => $result['tax_id'],				
				'address_1'      => $result['address_1'],
				'address_2'      => $result['address_2'],
				'postcode'       => $result['postcode'],
				'city'           => $result['city'],
				'zone_id'        => $result['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $result['country_id'],
				'country'        => $country,	
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format
			);
		}		
		
		return $address_data;
	}	
	
	public function getTotalAddresses() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "address WHERE customer_id = '" . (int)$this->customer->getId() . "'");
	
		return $query->row['total'];
	}
}
?>