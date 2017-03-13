<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class UserModel extends CI_Model {

/*************************************************************************/
	public function login_user($user, $password)
	{
		$query=$this->db->query("CALL sp_LoginUser('$user','$password')");

		if ($query->num_rows()==1)
		{
			$resp= $query->row();
			// $query->next_result();
			// $query->free_result();
			return $resp;
		}
		else
		{
			return FALSE; 
		}
	}
/*************************************************************************/
	public function get_menu($role_id)
	{
		$query=$this->db->query("CALL sp_GetMenuByRole($role_id)");

		if ($query->num_rows()>0)
		{
			$resp= $query->result();
			$query->next_result();
			$query->free_result();
			return $resp;
		}
		else
		{
			return FALSE;
		} 
	}
/*************************************************************************/
	public function get_submenu($role_id,$menu_id)
	{

		$query=$this->db->query("CALL sp_GetSubMenu($role_id,$menu_id)");

		if ($query->num_rows()>0)
		{
			$resp= $query->result();
			$query->next_result();
			$query->free_result();
			return $resp;
		}
		else
		{
			return FALSE;
		} 
	}
/*************************************************************************/
	public function get_all_users()
	{

		$query=$this->db->query("CALL sp_GetAllUsers()");

		if ($query->num_rows()>0)
		{
			$resp= $query->result();
			// $query->next_result();
			// $query->free_result();
			return $resp;
		}
		else
		{
			return FALSE;
		} 
	}
/*************************************************************************/
	public function insert_user($data)
    {

    	$roleid        = $data['cbo_role'];
    	$user     	   = $data['txt_user'];
    	$password      = $data['txt_password'];
    	$name 		   = $data['txt_name'];
    	$lastname      = $data['txt_lastname'];
    	$birthday	   = $data['txt_birthday'];
    	$telephone	   = $data['txt_telephone'];
    	$email		   = $data['txt_email'];
    	$status		   = $data['chck_status'];
    	$userid		   = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_InsertUser($roleid,'$user','$password','$name','$lastname','$birthday','$telephone','$email',$status,$userid)");

    	if($query)
		{
			$output = array(
			"status" => TRUE,
			"message"=>"Se registró exitosamente",
			"type"=>"success",
			"icon"=>"check");			
		}
		else
		{
			$output = array(
			"status" => FALSE,
			"message"=>"ERROR, No se puede registrar, Vuelva a intentarlo.",
			"type"=>"danger",
			"icon"=>"warning");	
		}		
		return $output;
    }
/*************************************************************************/
	public function get_user_by_userid($data)
	{
		$userid=$data['userid'];
		$query=$this->db->query("CALL sp_GetUserByUserId($userid)");

		if ($query->num_rows()==1)
		{
			$resp= $query->row();
			// $query->next_result();
			// $query->free_result();
			return $resp;
		}
		else
		{
			return FALSE; 
		}
	}
/*************************************************************************/
	public function update_user($data)
    {
    	$userid        = $data['userid'];
    	$roleid        = $data['cbo_role'];
    	$user     	   = $data['txt_user'];
    	$password      = $data['txt_password'];
    	$name 		   = $data['txt_name'];
    	$lastname      = $data['txt_lastname'];
    	$birthday	   = $data['txt_birthday'];
    	$telephone	   = $data['txt_telephone'];
    	$email		   = $data['txt_email'];
    	$status		   = $data['chck_status'];
    	$respuserid    = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_UpdateUser($userid,$roleid,'$user','$password','$name','$lastname','$birthday','$telephone','$email',$status,$respuserid)");

    	if($query)
		{
			$output = array(
			"status" => TRUE,
			"message"=>"Se editó exitosamente",
			"type"=>"success",
			"icon"=>"check");			
		}
		else
		{
			$output = array(
			"status" => FALSE,
			"message"=>"ERROR, No se puede editar, Vuelva a intentarlo.",
			"type"=>"danger",
			"icon"=>"warning");	
		}		
		return $output;
    }
/*************************************************************************/
	public function delete_user($data)
    {
    	$userid = $data['userid'];
    	$query=$this->db->query("CALL sp_DeleteUser($userid)");

    	if($query)
		{
			$output = array(
			"status" => TRUE,
			"message"=>"Se eliminó exitosamente",
			"type"=>"success",
			"icon"=>"check");			
		}
		else
		{
			$output = array(
			"status" => FALSE,
			"message"=>"ERROR, No se puede eliminar, Vuelva a intentarlo.",
			"type"=>"danger",
			"icon"=>"warning");	
		}		
		return $output;
    }
/*************************************************************************/
	public function get_all_roles()
	{

		$query=$this->db->query("CALL sp_GetAllRoles()");

		if ($query->num_rows()>0)
		{
			$resp= $query->result();
			// $query->next_result();
			// $query->free_result();
			return $resp;
		}
		else
		{
			return FALSE;
		} 
	}
}


