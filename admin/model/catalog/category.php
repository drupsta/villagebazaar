<?php
class ModelCatalogCategory extends Model {
	public function addCategory($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "category SET parent_id = '" . (int)$data['parent_id'] . "', `column` = '" . (int)$data['column'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");

		$category_id = $this->db->getLastId();
				
		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "category SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE category_id = '" . (int)$category_id . "'");
		}
		
		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', meta_keyword = '" . $this->db->escape($value['meta_keyword']) . "', meta_description = '" . $this->db->escape($value['meta_description']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

		// MySQL Hierarchical Data Closure Table Pattern
		$level = 0;
		
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY `level` ASC");
		
		foreach ($query->rows as $result) {
			$this->db->query("INSERT INTO `" . DB_PREFIX . "category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', `level` = '" . (int)$level . "'");
			
			$level++;
		}
		
		$this->db->query("INSERT INTO `" . DB_PREFIX . "category_path` SET `category_id` = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', `level` = '" . (int)$level . "'");

	
		$this->cache->delete('category');
	}
	
	public function editCategory($category_id, $data) {
	$this->db->query("UPDATE " . DB_PREFIX . "category SET parent_id = '" . (int)$data['parent_id'] . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE category_id = '" . (int)$category_id . "'");

		if (isset($data['image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "category SET image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "' WHERE category_id = '" . (int)$category_id . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "'");

		foreach ($data['category_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "category_description SET category_id = '" . (int)$category_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
		
		// MySQL Hierarchical Data Closure Table Pattern
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "category_path` WHERE path_id = '" . (int)$category_id . "' ORDER BY level ASC");
		
		if ($query->rows) {
			foreach ($query->rows as $category_path) {
				// Delete the path below the current one
				$this->db->query("DELETE FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' AND level < '" . (int)$category_path['level'] . "'");
				
				$path = array();
				
				// Get the nodes new parents
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");
				
				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}
				
				// Get whats left of the nodes current path
				$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_path['category_id'] . "' ORDER BY level ASC");
				
				foreach ($query->rows as $result) {
					$path[] = $result['path_id'];
				}
				
				// Combine the paths with a new level
				$level = 0;
				
				foreach ($path as $path_id) {
					$this->db->query("REPLACE INTO `" . DB_PREFIX . "category_path` SET category_id = '" . (int)$category_path['category_id'] . "', `path_id` = '" . (int)$path_id . "', level = '" . (int)$level . "'");
					
					$level++;
				}
			}
		} else {
			// Delete the path below the current one
			$this->db->query("DELETE FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$category_id . "'");
			
			// Fix for records with no paths
			$level = 0;
			
			$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "category_path` WHERE category_id = '" . (int)$data['parent_id'] . "' ORDER BY level ASC");
			
			foreach ($query->rows as $result) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$result['path_id'] . "', level = '" . (int)$level . "'");
				
				$level++;
			}
			
			$this->db->query("REPLACE INTO `" . DB_PREFIX . "category_path` SET category_id = '" . (int)$category_id . "', `path_id` = '" . (int)$category_id . "', level = '" . (int)$level . "'");
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "category_to_store WHERE category_id = '" . (int)$category_id . "'");
		
								
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . (int)$category_id. "'");
		
		$this->cache->delete('category');
	}
	
	public function deleteCategory($category_id) {
         $this->db->query("update " . DB_PREFIX . "category set status=0 WHERE category_id = '" . (int)$category_id . "'");   
         $this->db->query("update " . DB_PREFIX . "category set status=0 WHERE parent_id = '" . (int)$category_id . "'"); 
         $this->db->query("DELETE FROM " . DB_PREFIX . "category_path WHERE category_id = '" . (int)$category_id . "'");
         
         $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_path WHERE path_id = '" . (int)$category_id . "'");
					foreach ($query->rows as $result) {	
			$this->deleteCategory($result['category_id']);
		}
        }

	public function repairCategories(){
       	$query = $this->db->query("SELECT c.category_id as category_id FROM oc_category c, oc_category_description cd WHERE ((PARENT_ID =0) and (c.category_id=cd.category_id) and (c.category_id not in (select parent_id from oc_category))) ");
       	foreach ($query->rows as $result) {	
			$this->deleteCategory($result['category_id']);
		}
    }		
	public function getCategory($category_id) {
         // echo  $qry= "SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR ' &gt; ') FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . (int)$category_id . "') AS keyword FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query("SELECT DISTINCT *, (SELECT GROUP_CONCAT(cd1.name ORDER BY level SEPARATOR ' &gt; ') FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "category_description cd1 ON (cp.path_id = cd1.category_id AND cp.category_id != cp.path_id) WHERE cp.category_id = c.category_id AND cd1.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY cp.category_id) AS path, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'category_id=" . (int)$category_id . "') AS keyword FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd2 ON (c.category_id = cd2.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd2.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	} 
	
    public function getCat($data) {
		 
        $sql = "SELECT c.category_id AS category_id ,c1.name from oc_category c,oc_category_description c1 where c.category_id = c1.category_id AND parent_id=0 and status=1  ";
          
		if (!empty($data['filter_category'])) {
        	$qry="SELECT c.category_id AS category_id ,c1.name as name from oc_category c,oc_category_description c1 where c.category_id = c1.category_id AND parent_id=0 and status=1 and c1.name LIKE '" . $this->db->escape($data['filter_category']) . "%'";
            $query = $this->db->query($qry);
			return $query->rows;
        }
    }
                
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
        
	/// Added by Astha///////////
   public function getCategoriesforProduct($parent_id) 
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.sort_order, cd.name ASC");
		return $query->rows;

	}
        
        
        /////
	public function getCategoryDescriptions($category_id) {
		$category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_description WHERE category_id = '" . (int)$category_id . "'");
		
		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'meta_keyword'     => $result['meta_keyword'],
				'meta_description' => $result['meta_description'],
				'description'      => $result['description']
			);
		}
		
		return $category_description_data;
	}	
	
	public function getCategoryFilters($category_id) {
		$category_filter_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");
		
		foreach ($query->rows as $result) {
			$category_filter_data[] = $result['filter_id'];
		}

		return $category_filter_data;
	}

	
	public function getCategoryStores($category_id) {
		$category_store_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_store WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$category_store_data[] = $result['store_id'];
		}
		
		return $category_store_data;
	}

	public function getCategoryLayouts($category_id) {
		$category_layout_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_layout WHERE category_id = '" . (int)$category_id . "'");
		
		foreach ($query->rows as $result) {
			$category_layout_data[$result['store_id']] = $result['layout_id'];
		}
		
		return $category_layout_data;
	}
		
	public function getTotalCategories($data) {
      	//$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category");
	$query = $this->db->query("SELECT COUNT(*) AS total FROM oc_category, oc_category_description where status=1 and oc_category.`category_id`=oc_category_description.`category_id` and parent_id=0");
		//return $query->row['total'];
                if (!empty($data['filter_category'])) {
                 $parent= "SELECT oc_category.category_id FROM oc_category, oc_category_description where status=1 and oc_category.`category_id`=oc_category_description.`category_id` and parent_id=0 and name='" . $data['filter_category'] . "'";
                 $parent_id=$this->db->query($parent);
                 $test=$parent_id->row;
               //  print_r($test);
               //  echo $parent_id;
                $qry = "SELECT count(*) AS total FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and status=1 and parent_id='" . $test['category_id']. "'";
                 $query = $this->db->query($qry);
//$query = $this->db->query("SELECT count(*) AS total FROM oc_category_description cd ,oc_category c where cd.`category_id`=c.`category_id` and name='" . $data['filter_category'] . "'");
//return $query->row['total'];
		
                }
                return $query->row['total'];
	}	
		
	public function getTotalCategoriesByImageId($image_id) {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category WHERE image_id = '" . (int)$image_id . "'");
		
		return $query->row['total'];
	}

	public function getTotalCategoriesByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

		return $query->row['total'];
	}	
        
        //Added by Astha
    public function getSubcategory($data = array()) {
		$sql = "SELECT name, c.category_id  as category_id FROM oc_category_description cd ,oc_category c where cd.category_id=c.category_id and status = 1";
		if (isset($data['filter_parent_id']) && !is_null($data['filter_parent_id'])) {
			if (is_numeric($data['filter_parent_id'])) {
				$sql .= " and parent_id = " .(int)$data['filter_parent_id'];
			} else {
				session_destroy();
				header("location:http://".HTTP_SERVERIP."/villagebazaar/index.php?route=account/login");
		
			}
		}
		
		$sort_data = array(	'cd.name','c.category_id');
				
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
		
			$query = $this->db->query($sql);
		return $query->rows;
	}
	
    public function getSubcategoryCount($data = array()) {
    	if (isset($data['filter_parent_id']) && !is_null($data['filter_parent_id'])) {
			$query = $this->db->query("SELECT count(*) as total FROM oc_category_description cd ,oc_category c where cd.category_id =c.category_id and parent_id='" . (int)$data['filter_parent_id'] . "'");
    	}
    	else {
    		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "category_description cd,". DB_PREFIX . "category c where cd.category_id=c.category_id ");
    	}
		return $query->row['total'];
	}
        //// Used to find if product exist for a category
        
    public function getCategoryProduct($category_id) {
		$query = $this->db->query("SELECT pc.category_id, p.product_id FROM `oc_product_to_category` pc, oc_category c, oc_product p WHERE p.product_id=pc.product_id and p.status=1 and (c.`category_id`= '" . (int)$category_id . "' or c.parent_id = '" . (int)$category_id . "') and c.category_id= pc.category_id");

		return $query->row;
	}
        
    public function editSubcategory($category_id, $data) {
		$query = $this->db->query("UPDATE `oc_category_description` SET `name` = '".$data['subcategory']."' ,`description` = '".$data['description']."' WHERE `oc_category_description`.`category_id` ='" . (int)$category_id . "'") ;

		//return $query->row;
	}
    public function editCategoryNew($category_id, $data) {
	//echo $qry=	"UPDATE `oc_category_description` SET `name` = '".$data['displayValue3']."' ,`description` = '".$data['description']."'  WHERE `oc_category_description`.`category_id` ='" . (int)$category_id . "'";
           $query = $this->db->query("UPDATE `oc_category_description` SET `name` = '".$data['displayValue3']."' ,`description` = '".$data['description']."' WHERE `oc_category_description`.`category_id` ='" . (int)$category_id . "'") ;

		//return $query->row;
	}
        
       
    public function deleteSubcategory($category_id) {
		$query = $this->db->query("UPDATE `oc_category` SET `status` = 0  WHERE `oc_category`.`category_id` ='" . (int)$category_id . "'") ;

		//return $query->row;
	}
    public function validateSubcategory($category_id) {
		$query = $this->db->query("SELECT count(*) FROM `oc_category` WHERE `parent_id` ='" . (int)$category_id . "' and `status`=1 ") ;

		return $query->row;
	}

}
?>