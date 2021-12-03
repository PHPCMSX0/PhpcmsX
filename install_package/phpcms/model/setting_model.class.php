<?php
defined('IN_PHPCMS') or exit('The resource access forbidden.'); 
pc_base::load_sys_class('model', '', 0);
class setting_model extends model {
	public function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'default';
		$this->table_name = 'attachment_setting';
		parent::__construct();
	}
}
?>
