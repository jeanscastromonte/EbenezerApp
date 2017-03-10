<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CustomerModel extends CI_Model {

/*************************************************************************/
	public function get_all_customer($option)
	{

		$query=$this->db->query("CALL sp_GetAllCustomer()");

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
	public function insert_customer($data)
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
	public function get_customer_by_customerid($data)
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
}


