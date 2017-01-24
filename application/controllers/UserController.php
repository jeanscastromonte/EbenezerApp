<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class UserController extends  MasterController{
 
/****************************************************************************************************/
	public function user_view()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				redirect(base_url());
				break;

			case TRUE:			
				$data= array(
				'get_view'=> 'UserView/Index',				
				'get_menu'=> $this->get_menu(3),
				'get_information_user'=> $this->get_information_user());

				$this->load->view('MasterView/Index',$data);
				break;	;			
		}		
	}
/****************************************************************************************************/
	public function login_user()
	{
		$json 		= 	file_get_contents('php://input');
		$data 		= 	json_decode($json,TRUE);
		$user 		=	$data['txtUser'];
		$password 	=	$data['txtPassword'];
		$login_user = 	$this->UserModel->login_user($user, $password);

		switch ($login_user) 
		{
			case TRUE:

				$array_session= array(
				'UserId'   		=> $login_user->UserId,
				'UserRolId'   	=> $login_user->RoleId,
				'UserRol'   	=> $login_user->RoleName,
				'UserLoginName' => $login_user->UserLoginName,
				'UserName'  	=> $login_user->UserName,
				'UserImage'	  	=> $login_user->UserImage,
				'login'   		=> TRUE);

				$this->session->set_userdata($array_session);

				$result = array('result' => '<script>window.location.href="'.base_url().'"</script>');
				echo json_encode($result);

				break;
			
			case FALSE:
				$result = array('result' => '<div class="alert alert-danger">
				<button class="close" data-close="alert"></button>
				<span>
				Usuario y/o contraseña incorrecto, Vuelva intentalo. </span>
				</div>');
				echo json_encode($result);
				break;
		}
	}
/****************************************************************************************************/
	public function get_all_users1()
	{                   
		$get_all_users=$this->UserModel->get_all_users();
		
		 $output = array("Data" => $get_all_users);
		//$output['Data']   =  $get_all_users[0];
		echo json_encode($output);
	}

	public function get_all_users()
	{
		$list = $this->UserModel->get_all_users();
		$data = array();
		$no = 0;
		foreach ($list as $user) {
			$no++;
			$row = array();
			$row[] = $no;			
			$row[] = $user->UserImage;
			$row[] = $user->UserLoginName;
			$row[] = $user->RoleName;
			$row[] = $user->UserName;
			$row[] = $user->UserLastName;
			$row[] = $user->UserBirthdate;
			$row[] = $user->UserTelephone;
			$row[] = $user->UserEmail;
			$row[] = $user->UserStatus;			

			$data[] = $row;
		}

		$output = array(
						// "draw" => $_POST['draw'],
						// "recordsTotal" => $this->UserModel->count_all(),
						// "recordsFiltered" => $this->UserModel->count_filtered(),
						"Data" => $data,
				);
		//output to json format
		echo json_encode($output);
	}
}
