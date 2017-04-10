<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class CustomerController extends  MasterController{
 
/****************************************************************************************************/
	public function customer_view()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				redirect(base_url());
				break;

			case TRUE:			
				$data= array(
				'get_view'=> 'CustomerView/Index',				
				'get_menu'=> $this->get_menu(2),
				'get_information_user'=> $this->get_information_user(),
				'get_script_page'=>'<script src="application/helpers/CustomerHelper.js" type="text/javascript"></script>');

				$this->load->view('MasterView/Index',$data);
				break;	;			
		}
	}
/****************************************************************************************************/
	public function get_all_customer()
	{
		$digit = $this->input->post('digit', TRUE);
		$status = $this->input->post('status', TRUE);
				
		$list = $this->CustomerModel->get_all_customer($digit,$status);	
		$output = array("Data" => $list);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function insert_customer()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->CustomerModel->insert_customer($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function get_customer_by_customerid()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->CustomerModel->get_customer_by_customerid($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
}