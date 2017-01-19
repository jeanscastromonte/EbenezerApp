<?php defined('BASEPATH') OR exit('No direct script access allowed');

include_once (dirname(__FILE__) . "/MasterController.php");

class SaleController extends  MasterController{

/****************************************************************************************************/
	public function sale_view()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				redirect(base_url());
				break;

			case TRUE:			
				$data= array(
				'get_view'=> 'SaleView/Index',				
				'get_menu'=> $this->get_menu(8),
				'get_information_user'=> $this->get_information_user());

				$this->load->view('MasterView/Index',$data);
				break;	;			
		}
		
	}
/****************************************************************************************************/
}
