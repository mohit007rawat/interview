<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Api_model extends CI_Model
{
	public function __construct() {
        parent::__construct();
        $this->load->database();
    }

	
	public function select($tbl,$con='')
	{

		$this->db->select('*');
		$this->db->from($tbl);

		if ($con)
			$this->db->where($con);

		$q = $this->db->get();
		return $q->result();

	}

	public function join_select($select,$tbl1,$tbl2,$on,$con)
	{
		$this->db->select($select);
		$this->db->from($tbl1);
		$this->db->join($tbl2, $on, 'LEFT');
		$this->db->where($con);
		$q = $this->db->get();
		return $q->result();
				
	}


}
?>
