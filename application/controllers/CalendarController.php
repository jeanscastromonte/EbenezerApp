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
	public function get_schedule_sunat()
	{
		$period = $this->input->post('period', TRUE);
		$list 	= $this->CalendarModel->get_schedule_sunat($period);
		$output = array("Data" => $list);
		echo json_encode($output);
	}
/****************************************************************************************************/
	public function set_schedule_sunat()
    {
        $json 				= file_get_contents('php://input');
        $data 				= json_decode($json,TRUE);		
		$set_schedule_sunat = $this->CalendarModel->set_schedule_sunat($data);
		json_encode( $set_schedule_sunat );
    }
/****************************************************************************************************/
}
