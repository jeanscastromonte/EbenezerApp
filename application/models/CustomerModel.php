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
    	$status		   = $data['chck_status'];
    	$userid		   = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_InsertUser('$txtcustomer','$txtruc','$txtusersol','$txtpasswordsol','$txtaddress','$txtphone','$txtemail','$txtregtrib','$txtreg4ta','$txtreglab',$txtstartdate,$status,$userid)");

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


