<?php
class ModelUserUser extends Model {
	public function addUser($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "user` SET username = '" . $this->db->escape(ucwords($data['username'])) . "', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', user_group_id = '" . (int)$data['user_group_id'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
	}
	
	public function editUser($user_id, $data) {
		//$this->db->query("UPDATE `" . DB_PREFIX . "user` SET username = '" . $this->db->escape($data['username']) . "', firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', user_group_id = '" . (int)$data['user_group_id'] . "', status = '" . (int)$data['status'] . "' WHERE user_id = '" . (int)$user_id . "'");
              //  $this->db->query("UPDATE `" . DB_PREFIX . "user` SET  firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "'  WHERE user_id = '" . (int)$user_id . "'");
             //   $this->db->query("UPDATE `" . DB_PREFIX . "user` SET  status = '" . (int)$data['status'] . "' WHERE user_id = '" . (int)$user_id . "'");
                $query=$this->db->query("select username from oc_user  WHERE user_id = '" . (int)$user_id . "'");
               $user=$query->row;
//print_r($user);
           //    $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET   firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "' WHERE username = '". $user['username']. "'");
		// Added by astha 
                
		if ($data['password']) {
			$this->db->query("UPDATE `" . DB_PREFIX . "user` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE user_id = '" . (int)$user_id . "'");
                        
                        $this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE username = '". $user['username']. "'");
		}
	}

	public function editPassword($user_id, $password) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "', code = '' WHERE user_id = '" . (int)$user_id . "'");
	}

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
			
	public function deleteUser($user_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "user` WHERE user_id = '" . (int)$user_id . "'");
	}
	
	public function getUser($user_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE user_id = '" . (int)$user_id . "'");
	
		return $query->row;
	}
	
	public function getUserByUsername($username) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE username = '" . $this->db->escape($username) . "'");
	
		return $query->row;
	}
		
	public function getUserByCode($code) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "user` WHERE code = '" . $this->db->escape($code) . "' AND code != ''");
	
		return $query->row;
	}
		
	public function getUsers($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "user` u,`" . DB_PREFIX . "customer` c where c.username=u.username ";
			
		$sort_data = array(
			'c.username',
			'status',
			'date_added'
		);	
		if (!empty($data['filter_manufacturer_name'])) {
			$sql .= " AND u.user_id = '" . (int)$data['filter_manufacturer_name'] . "'";
		}	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY c.username";	
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

	public function getTotalUsers() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user` u,`" . DB_PREFIX . "customer` c where c.username=u.username ");
		
		return $query->row['total'];
	}

	public function getTotalUsersByGroupId($user_group_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user` WHERE user_group_id = '" . (int)$user_group_id . "'");
		
		return $query->row['total'];
	}
	
	public function getTotalUsersByEmail($email) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "user` WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
		
		return $query->row['total'];
	}
        public function editForgottenPassword($email, $password) {
      	$this->db->query("UPDATE " . DB_PREFIX . "customer SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
        
        $this->db->query("UPDATE " . DB_PREFIX . "user SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
        
}
?>