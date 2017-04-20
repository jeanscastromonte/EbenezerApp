<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class RoleModel extends CI_Model {

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
/*************************************************************************/
	public function get_role_by_roleid($data)
	{
		$roleid=$data['roleid'];
		$query=$this->db->query("CALL sp_GetRoleByRoleId($roleid)");

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
	public function insert_role($data)
    {
    	$rolename  	   = strtoupper($data['txt_rolename']);

    	$query=$this->db->query("CALL sp_InsertRole('$rolename')");

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
	public function update_role($data)
    {
    	$roleid   = $data['roleid'];
    	$rolename = strtoupper($data['txt_rolename']);

    	$query=$this->db->query("CALL sp_UpdateRole($roleid,'$rolename')");

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
	public function delete_role($data)
    {
    	$roleid = $data['roleid'];
    	$query=$this->db->query("CALL sp_DeleteRole($roleid)");

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
}


