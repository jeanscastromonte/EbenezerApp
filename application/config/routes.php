<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] 	= 'MasterController';
$route['404_override'] 			= '';
$route['translate_uri_dashes']	= FALSE;

/*********************************************************************/
$route['login_user'] 		= 'UserController/login_user';
/*********************************************************************/
$route['registro-ventas'] 	= 'SaleController/sale_view';
/*********************************************************************/