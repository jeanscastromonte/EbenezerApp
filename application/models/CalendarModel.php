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
}


