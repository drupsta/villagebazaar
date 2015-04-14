<?php
class ModelAccountSeller extends Model {
	public function addCustomer($data) 
	{
    	if(isset($_SESSION['username'])!= 'root') {
				//$this->db->query("INSERT INTO `" . DB_PREFIX . "user` SET username = '" . $this->db->escape(ucwords($data['username'])) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "',telephone = '" . $this->db->escape($data['telephone']) . "',landline = '" . $this->db->escape($data['landline']) . "',address_1 = '" . $this->db->escape($data['address_1']) . "',address_2 = '" . $this->db->escape($data['address_2']) . "',city = '" . $this->db->escape($data['city']) . "',postcode = '" . $this->db->escape($data['postcode']) . "',country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "', user_group_id='11',status = '1',date_added = NOW()");
				$this->db->query("INSERT INTO `" . DB_PREFIX . "user` SET username = '" . $this->db->escape(ucwords($data['username'])) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "',telephone = '" . $this->db->escape($data['telephone']) . "',landline = '" . $this->db->escape($data['fixedline']) . "',country_code = '" . $this->db->escape($data['country_code']) . "',std = '" . $this->db->escape($data['areacode']) . "',address_1 = '" . $this->db->escape($data['address_1']) . "',postoffice = '" . $this->db->escape($data['postoffice']) . "', csc_id = '" . $this->db->escape($data['csc_id']) . "',city = '" . $this->db->escape($data['city']) . "',country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "',dungkhag_id = '" . $this->db->escape($data['dungkhag_id']) . "', geog = '" . $this->db->escape($data['geog']) . "',user_group_id='11',status = '1',date_added = NOW()");
				//Added by Astha 8th July 2014
				//$query="INSERT INTO " . DB_PREFIX . "customer SET store_id = '0', username = '" . $this->db->escape(ucwords($data['username'])) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "',  salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', customer_group_id = '1', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '1', date_added = NOW()";
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET store_id = '0', username = '" . $this->db->escape(ucwords($data['username'])) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "',country_code = '" . $this->db->escape($data['country_code']) . "', landline = '" . $this->db->escape($data['fixedline']) . "',std = '" . $this->db->escape($data['areacode']) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', customer_group_id = '1', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '1', date_added = NOW()");
				$customer_id = $this->db->getLastId();
				$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])). "',  address_1 = '" . $this->db->escape($data['address_1']) . "',  city = '" . $this->db->escape(ucwords($data['city'])) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "',postoffice = '" . $this->db->escape($data['postoffice']) . "',dungkhag_id='".$this->db->escape($data['dungkhag_id'])."', geog = '".$this->db->escape($data['geog'])."', csc_id = '" . $this->db->escape($data['csc_id']) . "'");
						//$customer_id = $this->db->getLastId();
				$address_id = $this->db->getLastId();
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
		} else {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "user` SET username = '" . $this->db->escape(ucwords($data['username'])) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "',telephone = '" . $this->db->escape($data['telephone']) . "',country_code = '" . $this->db->escape($data['country_code']) . "',landline = '" . $this->db->escape($data['fixedline']) . "',std = '" . $this->db->escape($data['std']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', postoffice = '" . $this->db->escape($data['postoffice']) . "', csc_id = '" . $this->db->escape($data['csc_id']) . "',city = '" . $this->db->escape($data['city']) . "',country_id = '" . $this->db->escape($data['country_id']) . "',zone_id = '" . $this->db->escape($data['zone_id']) . "', dungkhag_id='".$this->db->escape($data['dungkhag_id'])."',geog = '".$this->db->escape($data['geog'])."',user_group_id='1',status = '1',date_added = NOW()");
				//Added by Astha 8th July 2014
				//$query="INSERT INTO " . DB_PREFIX . "customer SET store_id = '0', username = '" . $this->db->escape(ucwords($data['username'])) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "',  salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', customer_group_id = '1', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '1', date_added = NOW()";
				$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET store_id = '0', username = '" . $this->db->escape(ucwords($data['username'])) . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', country_code = '" . $this->db->escape($data['country_code']) . "',landline = '" . $this->db->escape($data['landline']) . "',std = '" . $this->db->escape($data['std']) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', newsletter = '" . (isset($data['newsletter']) ? (int)$data['newsletter'] : 0) . "', customer_group_id = '1', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', status = '1', approved = '1', date_added = NOW()");
				$customer_id = $this->db->getLastId();
				$this->db->query("INSERT INTO " . DB_PREFIX . "address SET customer_id = '" . (int)$customer_id . "', firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])). "',  address_1 = '" . $this->db->escape($data['address_1']) . "',  city = '" . $this->db->escape(ucwords($data['city'])) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "',dungkhag_id = '".$this->db->escape($data['dungkhag_id'])."', geog = '".$this->db->escape($data['geog'])."', postoffice = '" . $this->db->escape($data['postoffice']) . "', csc_id = '" . $this->db->escape($data['csc_id']) . "'");
						//$customer_id = $this->db->getLastId();
				$address_id = $this->db->getLastId();
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET address_id = '" . (int)$address_id . "' WHERE customer_id = '" . (int)$customer_id . "'");
   		}

	}	

	
public function cscDetails() {
		//if (!$csc_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "csc_detail ");	
			return $query->rows;
}

public function getUsername($username) {
	$query = $this->db->query("SELECT username FROM " . DB_PREFIX . "user where username='$username' ");
        return $query->rows;
}
		//Added on 9th July by Astha

public function getTotalUsersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "user WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
		
		return $query->row['total'];
	}
	

}
?>
