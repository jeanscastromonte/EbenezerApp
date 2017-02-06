<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MasterController extends CI_Controller {

	public function __construct(){
		parent::__construct();
		date_default_timezone_set('America/Lima');
	}

/****************************************************************************************************/
	public function index()
	{
		switch ($this->session->userdata('login')) 
		{
			case FALSE:
				$this->load->view('LoginView/Header-login');
				$this->load->view('LoginView/Login');
				$this->load->view('LoginView/Footer-login');
				break;

			case TRUE:			
				$data= array(
				'get_view'				=> 'DashboardView/Index',				
				'get_menu'				=> $this->get_menu(18),
				'get_information_user'	=> $this->get_information_user());

				$this->load->view('MasterView/Index',$data);
				break;			
		}
	}	
/****************************************************************************************************/
	public function get_menu($MenuId_active)
	{
		$role_id	=	$this->session->userdata('UserRolId');
		$get_menu 	= 	$this->UserModel->get_menu($role_id);		

		$menu='';
		foreach($get_menu as $row)
        {        	
			$sub_menu='';			
			$MenuId=$row->MenuId;			
			$ModuleMenuName=$row->ModuleMenuName;
			$ModuleMenuLink=$row->ModuleMenuLink;
			$ModuleMenuIcon=$row->ModuleMenuIcon;

			switch($ModuleMenuLink)
			{
				case 'javascript:void(0);':
				$get_submenu = 	$this->UserModel->get_submenu($role_id,$MenuId);
				if($get_submenu==TRUE)
				{				
					foreach($get_submenu as $row2)
		        	{
						$MenuId2=$row2->MenuId;					
						$ModuleMenuName2=$row2->ModuleMenuName;
						$ModuleMenuLink2=$row2->ModuleMenuLink;
					
					$sub_menu.='<li><a href="'.$ModuleMenuLink2.'"><i class="icon-basket"></i><span class="title"> '.$ModuleMenuName2.'</span>
					<span class="arrow "></span></a></li>';						
					}

				}
				break;

				case 'base_url()':
				$ModuleMenuLink=base_url();
				break;
			}
			
			if ($MenuId==$MenuId_active)
			{
				$active_menu="active";
			}
			else
			{
				$active_menu="";
			}
			
			$menu.='<li class="'.$active_menu.'">
			<a class="module-menu" href="'.$ModuleMenuLink.'">
			<i class="'.$ModuleMenuIcon.'"></i>
			<span class="title"> '.$ModuleMenuName.'</span>
			<span class="arrow "></span></a><ul class="sub-menu">'.$sub_menu.'</ul></li>';

        }
		return $menu;					
	}
/****************************************************************************************************/
	public function get_information_user()
	{
		return $data= array(		
		'UserRol'   	=> $this->session->userdata('UserRol'),
		'UserLoginName' => $this->session->userdata('UserLoginName'),
		'UserName'  	=> $this->session->userdata('UserName'),
		'UserImage'	  	=> $this->session->userdata('UserImage'));
	}
/****************************************************************************************************/
}
