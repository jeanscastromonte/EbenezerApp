<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CustomerModel extends CI_Model {

/*************************************************************************/
	public function get_all_customer($digit,$status)
	{
		$query=$this->db->query("CALL sp_GetAllCustomer('$digit','$status')");

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
	public function get_customer_by_customerid($data)
	{
		$customerid   = $data['customerid'];
		$query=$this->db->query("CALL sp_GetCustomerByCustomerId($customerid)");

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
	public function insert_customer($data)
    {
    	$txtcustomer   = $data['txtcustomer'];
    	$txtruc        = $data['txtruc'];
    	$txtusersol    = $data['txtusersol'];
    	$txtpasswordsol= $data['txtpasswordsol'];
    	$txtaddress    = $data['txtaddress'];
    	$txtphone	   = $data['txtphone'];
    	$txtemail	   = $data['txtemail'];
    	$txtregtrib	   = $data['txtregtrib'];
    	$txtreg4ta	   = $data['txtreg4ta'];
    	$txtreglab	   = $data['txtreglab'];
    	$txtstartdate  = $data['txtstartdate'];
    	$status		   = $data['cbo_status'];
    	$userid		   = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_InsertCustomer('$txtcustomer','$txtruc','$txtusersol','$txtpasswordsol','$txtaddress','$txtphone','$txtemail','$txtregtrib','$txtreg4ta','$txtreglab','$txtstartdate','$status',$userid)");

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
	public function update_customer($data)
    {
    	$customerid    = $data['customerid'];
    	$txtcustomer   = $data['txtcustomer'];
    	$txtruc        = $data['txtruc'];
    	$txtusersol    = $data['txtusersol'];
    	$txtpasswordsol= $data['txtpasswordsol'];
    	$txtaddress    = $data['txtaddress'];
    	$txtphone	   = $data['txtphone'];
    	$txtemail	   = $data['txtemail'];
    	$txtregtrib	   = $data['txtregtrib'];
    	$txtreg4ta	   = $data['txtreg4ta'];
    	$txtreglab	   = $data['txtreglab'];
    	$txtstartdate  = $data['txtstartdate'];
    	$status		   = $data['cbo_status'];
    	$userid		   = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_UpdateCustomer($customerid,'$txtcustomer','$txtruc','$txtusersol','$txtpasswordsol','$txtaddress','$txtphone','$txtemail','$txtregtrib','$txtreg4ta','$txtreglab','$txtstartdate','$status',$userid)");

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
	public function delete_customer($data)
    {
    	$customerid = $data['customerid'];
    	$query=$this->db->query("CALL sp_DeleteCustomer($customerid)");

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


