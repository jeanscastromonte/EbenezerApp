<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class CalendarController extends  MasterController{
 
/****************************************************************************************************/
	public function schedule_view()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				redirect(base_url());
				break;

			case TRUE:			
				$data= array(
				'get_view'=> 'CalendarView/Index',				
				'get_menu'=> $this->get_menu(19),
				'get_information_user'=> $this->get_information_user(),
				'get_script_page'=>'<script src="application/helpers/CalendarHelper.js" type="text/javascript"></script>');

				$this->load->view('MasterView/Index',$data);
				break;	;			
		}		
	}
/****************************************************************************************************/
}
