<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CalendarModel extends CI_Model {

/*************************************************************************/
	public function get_schedule_sunat($period)
	{
		$query=$this->db->query("CALL sp_GetScheduleSunatByPeriod('$period')");

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
	public function get_schedule_year_sunat($period)
	{
		$query=$this->db->query("CALL sp_GetScheduleSunatByYear('$period')");

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
	public function set_schedule_sunat($data)
    {

    	$period        = $data['txt_period'];
    	$digit     	   = $data['cbo_digit'];
    	$duedate       = $data['txt_duedate'];
    	$scheduleddate = $data['txt_scheduleddate'];
    	$scheduletime  = $data['txt_scheduletime'];
    	$status		   = $data['txt_status'];
    	$iduser		   = $this->session->userdata('UserId');

    	$query=$this->db->query("CALL sp_SetScheduleSunat('$period',$digit,'$duedate','$scheduleddate','$scheduletime',$status,$iduser)");

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
			"message"=>"ERROR, No se puede registrar, Vuelva a intentarlo2.",
			"type"=>"danger",
			"icon"=>"warning");	
		}		
		return $output;
    }
/*************************************************************************/
	public function get_schedule_alert()
	{
		$query=$this->db->query("CALL sp_GetScheduleAlert()");

		if ($query->num_rows()==1)
		{
			$resp= $query->row();
			return $resp;
		}
		else
		{
			return FALSE; 
		}
	}
/*************************************************************************/
	public function update_complete_schedule($data)
	{
		$period        = $data['period'];
    	$digit     	   = $data['digit'];

    	$query=$this->db->query("CALL sp_UpdateCompleteScheduleSunat('$period',$digit)");
	}

/*************************************************************************/
}


