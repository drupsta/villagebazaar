<?php
class ModelUsermyaccount extends Model {
	public function editUser($user_id, $data) {
		
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET  firstname = '" . $this->db->escape(ucwords($data['firstname'])) . "', lastname = '" . $this->db->escape(ucwords($data['lastname'])) . "', email = '" . $this->db->escape($data['email']) .  "', address_1 = '" . $this->db->escape($data['address_1']) .  "',csc_id = '" . $this->db->escape($data['csc_id']) .  "', telephone = '" . $this->db->escape($data['telephone']) .  "', city = '" . $this->db->escape($data['city']) . "' WHERE user_id = '" . (int)$user_id . "'");
	if ($data['password']) {
			$this->db->query("UPDATE `" . DB_PREFIX . "user` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE user_id = '" . (int)$user_id . "'");
		}
                
        }

	public function editCode($email, $code) {
		$this->db->query("UPDATE `" . DB_PREFIX . "user` SET code = '" . $this->db->escape($code) . "' WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
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
        
        public function cscDetails() {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "csc_detail ");
	
			return $query->rows;
		}
                
//                public function getCscName($user_id) {
//				$query = $this->db->query("Select name FROM oc_csc_detail c, oc_user u WHERE u.csc_id=c.csc_id and user_id='" . (int)$user_id . "' ");
//	
//			return $query->rows;
//		}
}

?>