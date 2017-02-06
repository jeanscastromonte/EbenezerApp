<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] 	= 'MasterController';
$route['404_override'] 			= '';
$route['translate_uri_dashes']	= FALSE;

/*********************************************************************/
$route['login-user'] 		= 'UserController/login_user';
/*********************************************************************/
$route['register-sale'] 	= 'SaleController/sale_view';
/*********************************************************************/
$route['register-user'] 	= 'UserController/user_view';

$route['get-all-users'] 	= 'UserController/get_all_users';
$route['get-all-roles'] 	= 'UserController/get_all_roles';
/*********************************************************************/
$route['sunat-schedule'] 	= 'CalendarController/schedule_view';

$route['get-schedule-sunat'] = 'CalendarController/get_schedule_sunat';
$route['set-schedule-sunat'] = 'CalendarController/set_schedule_sunat';
$route['get-notifications'] = 'CalendarController/get_notifications';
/*********************************************************************/