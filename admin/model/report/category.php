<?php
class ModelReportCategory extends Model {
public function getCategories($data) {
		$sql = "SELECT c.category_id AS category_id ,c1.name from oc_category c,oc_category_description c1 where c.category_id = c1.category_id AND parent_id=0 and status=1  ";
        if (!empty($data['filter_category_id'])) {
        	$qry="SELECT c.category_id AS category_id ,c1.name as name from oc_category c,oc_category_description c1 where c.category_id = c1.category_id AND parent_id=0 and status=1 and c1.category_id = '" . $this->db->escape($data['filter_category']) . "'";
            $query = $this->db->query($qry);
		    foreach ($query->rows as $result) {
        	    $qry="SELECT c1.name as name, c.category_id as category_id from oc_category c, oc_category_description c1 where c.category_id = c1.category_id and status=1 and parent_id='" . $this->db->escape($result['category_id']) . "'";
                $query = $this->db->query($qry);
               	return $query->rows;
            }                   
  		}   
	        
        $sql .= " order by c1.name ";
		
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
	
	public function get_ccategory()
	{
			
		$sql ="SELECT name, c.category_id FROM " . DB_PREFIX . "category_description cd ,oc_category c where 		  cd.`category_id`=c.`category_id` and parent_id=0 and status=1 order by name";
		$query = $this->db->query($sql);
		return $query->rows;
			
	}
	
}