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
				'get_information_user'=> $this->get_information_user(),
				'get_script_page'=>'<script src="application/helpers/UserHelper.js" type="text/javascript"></script>');

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
	public function logout_user() 
    {
        $this->session->sess_destroy();           
        redirect(base_url());
    }
/****************************************************************************************************/
	public function get_all_users()
	{
		$list = $this->UserModel->get_all_users();

		$array = array();
		foreach ($list as $row)
		{
			$data['UserId'] = $row->UserId;
			$data['UserImage'] = base64_decode($row->UserImage);
			$data['UserLoginName'] = $row->UserLoginName;
			$data['UserName'] = $row->UserName;
			$data['UserLastName'] = $row->UserLastName;
			$data['UserBirthdate'] = $row->UserBirthdate;
			$data['UserTelephone'] = $row->UserTelephone;
			$data['UserEmail'] = $row->UserEmail;
			$data['UserStatus'] = $row->UserStatus;
			$data['RoleName'] = $row->RoleName;

			array_push($array,$data);
		}

		$output = array('Data'=>$array);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function get_user_by_userid()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->UserModel->get_user_by_userid($data);

		$data= array(
			'UserId'=>$output->UserId,
			'UserImage'=>base64_decode($output->UserImage),
			'UserLoginName'=>$output->UserLoginName,
			'UserLoginPassword'=>$output->UserLoginPassword,
			'UserName'=>$output->UserName,
			'UserLastName'=>$output->UserLastName,
			'UserBirthdate'=>$output->UserBirthdate,
			'UserTelephone'=>$output->UserTelephone,
			'UserEmail'=>$output->UserEmail,
			'UserStatus'=>$output->UserStatus,
			'RoleId'=>$output->RoleId,
			'RoleName'=>$output->RoleName
			);

		echo json_encode($data);
	}
/****************************************************************************************************/
	public function insert_user()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$insert_user=$this->UserModel->insert_user($data);

		if($insert_user)
		{
			$output = array(
			"status" => TRUE,
			"message"=>"Se registró exitosamente",
			"type"=>"success",
			"icon"=>"check");

			$userid=$insert_user->out_userid;

			move_uploaded_file($_FILES[$data['file']]['tmp_name'], 'file/' . $_FILES[$data['file']]['name']);
			//echo $userid.' :::::'.$_FILES['file']['name']."-----".pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
		}
		else
		{
			$output = array(
			"status" => FALSE,
			"message"=>"ERROR, No se puede registrar, Vuelva a intentarlo.",
			"type"=>"danger",
			"icon"=>"warning");	
		}

		echo json_encode($output);
	}	
/****************************************************************************************************/
	public function update_user()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->UserModel->update_user($data);
		echo json_encode($output);		 
	}
/****************************************************************************************************/
	public function delete_user()
	{
		$json =	file_get_contents('php://input');
		$data =	json_decode($json,TRUE);
		$output=$this->UserModel->delete_user($data);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function upload_file()
	{
       

    }
/****************************************************************************************************/
}
