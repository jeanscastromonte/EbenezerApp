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


