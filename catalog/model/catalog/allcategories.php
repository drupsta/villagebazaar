<?php
//-----------------------------------------------------
// TagCloud for Opencart v1.5.3    
// Created by villagedefrance                          
// contact@villagedefrance.net                                    
//-----------------------------------------------------

class ModelCatalogAllCategories extends Model {

	public function getUrlCategory($category_id){
			$query		=	$this->db->query("select * from ".DB_PREFIX."url_alias where query='category_id=".$category_id."'");
			return $query->row;
	}
	
}
?>