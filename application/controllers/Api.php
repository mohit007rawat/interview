<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

//include Rest Controller library
require APPPATH . '/libraries/REST_Controller.php';

class Api extends REST_Controller {

    public function __construct() { 
        parent::__construct();
        $this->load->model('Api_model','am');
    }
	
	public function get_bookmark_get()
	{
		$user_id = $this->am->select('users');
		foreach ($user_id as $key => $value) {
			$data[] = ['user_id'=>$value->id,'get_bookmark'=>$this->am->join_select('v.id as video_id,v.title,b.id as bookmark_id',
				'videos as v',
				'bookmark as b',
				'v.id=b.video_id',
				['b.user_id'=> $value->id]
				)];
		}
		
		$this->response([
					'status' => TRUE,
					'message' => 'Video bookmark found successfully.',
					'data' => $data
				], REST_Controller::HTTP_OK);
	}

	public function get_video_list_get()
	{
		$user_id = $this->am->select('users');
		foreach ($user_id as $key => $value) {

		$this->db->select('v.title,v.id');
		$this->db->from('transaction_detail as td');
		$this->db->join('packages_program_mapping as ppm', 'td.package_id = ppm.package_id', 'LEFT');
		$this->db->join('program_video_mapping as pvm', 'pvm.program_id = ppm.program_id', 'LEFT');
		$this->db->join('videos as v', 'pvm.video_id = v.id', 'LEFT');
		$this->db->where(['td.user_id'=>$value->id]);
		$exc_query = $this->db->get()->result();
		
		$data[] = ['user_id'=>$value->id,'video_list'=>$exc_query];
		}

		$this->response([
					'status' => TRUE,
					'message' => 'Video List found successfully.',
					'data' => $data
				], REST_Controller::HTTP_OK);

	}  
}

?>
