<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class RoleController extends  MasterController{
 
/****************************************************************************************************/
	public function role_view()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				redirect(base_url());
				break;

			case TRUE:			
				$data= array(
				'get_view'=> 'RoleView/Index',				
				'get_menu'=> $this->get_menu(5),
				'get_information_user'=> $this->get_information_user(),
				'get_script_page'=>'<script src="application/helpers/RoleHelper.js" type="text/javascript"></script>');

				$this->load->view('MasterView/Index',$data);
				break;	;			
		}		
	}
/****************************************************************************************************/
	public function get_all_roles()
	{
		$list=$this->RoleModel->get_all_roles();
		$output = array("Data" => $list);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function get_role_by_roleid()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->RoleModel->get_role_by_roleid($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function insert_role()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->RoleModel->insert_role($data);
		echo json_encode($output);
	}	
/****************************************************************************************************/
	public function update_role()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->RoleModel->update_role($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function delete_role()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->RoleModel->delete_role($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
}
