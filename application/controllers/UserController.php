<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class UserController extends  MasterController{

/****************************************************************************************************/
	// public function sales_view()
	// {
	// 	switch ($this->session->userdata('login')) 
	// 	{
	// 		case FALSE:
	// 			redirect(base_url());
	// 			break;

	// 		case TRUE:			
	// 			$data= array(
	// 			'get_header'=> $this->get_header(),
	// 			'get_menu'=> $this->get_menu(8),					
	// 			'get_footer'=> $this->get_footer(),
	// 			'get_information_user'=> $this->get_information_user());

	// 			$this->load->view('SaleView/Index',$data);
	// 			break;			
	// 	}
		
	// }
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
				$result = array('result' => '<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>
				Usuario y/o contraseña incorrecto, Vuelva intentalo. </span>
				</div>');
				echo json_encode($result);
				break;
		}
	}
/****************************************************************************************************/
}
